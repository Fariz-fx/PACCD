from fastapi import APIRouter, Request
from fastapi.encoders import jsonable_encoder
from typing import List
from azure.cosmos.aio import CosmosClient
from azure.cosmos import PartitionKey, exceptions
from models import ToDoItem

from datetime import datetime
import logging, time

router = APIRouter()


@router.post("/insert", response_model=ToDoItem)
async def create_todo(request: Request, todo_item: ToDoItem):
    todo_item = jsonable_encoder(todo_item)
    new_todo = await request.app.todo_items_container.create_item(todo_item)
    message="Inserting Data to Cosmos via API"
    print(message)
    logger.info(message)
    return new_todo
    #try:
        #print(1/todo_item.id)
        # Append club
        #tod
        #todo-db.append(todo_item.dict())
        #return new_todo


@router.get("/listall", response_description="List of all To-do items", response_model=List[ToDoItem])
async def list_todos(request: Request):
    todos = [todo async for todo in request.app.todo_items_container.read_all_items()]
    message="Get all Todo list"
    print(message)
    logger.info(message)
    return todos
    

@router.put("/update", response_model = ToDoItem, )
async def replace_todo(request: Request, item_with_update:ToDoItem):
    """
    Update an item. Id (which is also the PartitionKey in this case) values should reference the item to be updated:

    - **id**: [Mandatory] Old Item ID
    - **name**: [Optional] The new name.
    - **description**: [Optional] The new description
    - **isComplete**: [Optional] boolean flag to mark a Todo complete or incomplete
    """
    existing_item = await request.app.todo_items_container.read_item(item_with_update.id,partition_key = item_with_update.id)
    existing_item_dict = jsonable_encoder(existing_item)
    update_dict = jsonable_encoder(item_with_update)
    for (k) in update_dict.keys():
        if update_dict[k]:
            existing_item_dict[k] = update_dict[k]
    updatedItem = await request.app.todo_items_container.replace_item(item_with_update.id, existing_item_dict)    
    return updatedItem


@router.delete("/delete")
async def delete_todo(request: Request, item_id: str, pk: str):
     message="deleting club"
     print(message)
     logger.info(message)
     await request.app.todo_items_container.delete_item(item_id, partition_key=pk)



