from fastapi import FastAPI,Request
from dotenv import dotenv_values
from azure.cosmos.aio import CosmosClient
from azure.cosmos import PartitionKey, exceptions
from routes import router as todo_router
# Opencensus Azure imports
from opencensus.trace.attributes_helper import COMMON_ATTRIBUTES
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace.samplers import ProbabilitySampler
from opencensus.trace.tracer import Tracer
from opencensus.trace.span import SpanKind
from opencensus.trace.status import Status
from opencensus.trace import config_integration
from opencensus.ext.azure.log_exporter import AzureLogHandler
#Logging
from datetime import datetime
import logging, time, os, uvicorn
from pydantic import BaseModel
# Metric imports
from opencensus.ext.azure import metrics_exporter
from opencensus.stats import aggregation as aggregation_module
from opencensus.stats import measure as measure_module
from opencensus.stats import stats as stats_module
from opencensus.stats import view as view_module
from opencensus.tags import tag_map as tag_map_module

logger = logging.getLogger(__name__)

config = dotenv_values(".env")
app = FastAPI()
DATABASE_NAME = "todo-db"
CONTAINER_NAME = "todo-items"

app.include_router(todo_router, tags=["todos"], prefix="/todos")

#dotenv_values
#dotenv_values()
#APPINSIGHTS_INSTRUMENTATIONKEY = os.environ["APPINSIGHTS_INSTRUMENTATIONKEY"]


APPINSIGHTS_INSTRUMENTATIONKEY= config["APPINSIGHTS_INSTRUMENTATIONKEY"]
HTTP_URL = COMMON_ATTRIBUTES['HTTP_URL']
HTTP_STATUS_CODE = COMMON_ATTRIBUTES['HTTP_STATUS_CODE']

# On startup
@app.on_event("startup")
async def startup_db_client():
    app.cosmos_client = CosmosClient(config["URI"], credential = config["KEY"])
    await get_or_create_db(DATABASE_NAME)
    await get_or_create_container(CONTAINER_NAME)

    print('DataBase & App Insights configured successfully')
    config_integration.trace_integrations(['logging'])
    logger = logging.getLogger(__name__)

    handler = AzureLogHandler(connection_string=f'InstrumentationKey={APPINSIGHTS_INSTRUMENTATIONKEY}')
    logger.addHandler(handler)
    
@app.on_event('shutdown')
async def shutdown_event():
    message="Shut Down initiated by user"
    print(message)
    logger.info(message)
    await get_http_client_session().close()

app.middleware("http")
async def add_process_time_header(request: Request, call_next):
    tracer = Tracer(exporter=AzureExporter(connection_string=f'InstrumentationKey={APPINSIGHTS_INSTRUMENTATIONKEY}'),sampler=ProbabilitySampler(1.0))
    with tracer.span("main") as span:
        span.span_kind = SpanKind.SERVER
            
        response = await call_next(request)

        tracer.add_attribute_to_current_span(
                attribute_key=HTTP_STATUS_CODE,
                attribute_value=response.status_code)
        tracer.add_attribute_to_current_span(
            attribute_key=HTTP_URL,
            attribute_value=str(request.url))
        
    return response

@app.get("/")
async def root(request:Request):
    message="PACCD is working successfylly, Use /docs at the end of URL to Launcg fast API"
    print(message)
    logger.info(message)
    return message

async def get_or_create_db(db_name):
    try:
        app.database  = app.cosmos_client.get_database_client(db_name)
        message="Fetching DB info from Cosmos DB"
        print(message)
        logger.info(message)
        return await app.database.read() 
    except exceptions.CosmosResourceNotFoundError:
        message="Can't find DB, Creating Database"
        print(message)
        logger.info(message)
        return await app.cosmos_client.create_database(db_name)
     
async def get_or_create_container(container_name):
    try:        
        app.todo_items_container = app.database.get_container_client(container_name)
        message="Getting Container from DB"
        print(message)
        logger.info(message)
        return await app.todo_items_container.read()   
    except exceptions.CosmosResourceNotFoundError:
        message="Creating container with id as partition key"
        print(message)
        logger.info(message)
        #print("Creating container with id as partition key")
        return await app.database.create_container(id=container_name, partition_key=PartitionKey(path="/id"))
    except exceptions.CosmosHttpResponseError:
        message="CosmosHttpResponseError"
        print(message)
        logger.error(message)
        raise

# Generate some custom metrics
@app.get("/log_custom_metric")
async def log_custom_metric():
    stats = stats_module.stats
    view_manager = stats.view_manager
    stats_recorder = stats.stats_recorder

    loop_measure = measure_module.MeasureInt("loop", "number of loop", "loop")
    loop_view = view_module.View("metric name: club stats", "number of loop", [], loop_measure, aggregation_module.CountAggregation())
    view_manager.register_view(loop_view)
    mmap = stats_recorder.new_measurement_map()
    tmap = tag_map_module.TagMap()

    for i in range(1,3):
        mmap.measure_int_put(loop_measure, 1)
        mmap.record(tmap)
        metrics = list(mmap.measure_to_view_map.get_metrics(datetime.utcnow()))
        print(metrics[0].time_series[0].points[0])

    exporter = metrics_exporter.new_metrics_exporter(
        connection_string=f'InstrumentationKey={APPINSIGHTS_INSTRUMENTATIONKEY}')

    view_manager.register_exporter(exporter)
    return "Log custom metric"

if __name__=="__main__":
    print("main started")
    uvicorn.run("main:app", port=3100, log_level="info")