# PACCD ToDO Application

PACCD is a simple Python FastAPI application which will deploy its docker image to Azure Container App, Azure Cosmos DB and captures metrics and logs in App insights

This application creates a very simple three-tiered ToDo web app backend using Cosmos DB as the database and FastAPI as the python web framework to expose API endpoints for performing CRUD operations and to monitor we will make use application insight and Grafana

## Link
Application Link:

* Test App link: https://fx-t-eu-paccd-01-ca.wittyforest-11fef98c.eastus.azurecontainerapps.io/docs
* Prod App Link: https://fx-p-eu-paccd-02-ca.ambitioustree-10d1932a.eastus.azurecontainerapps.io/docs

Grafana Link:
* Test Grafana Dashboard: https://farizfx.grafana.net/d/gSMia4pVz/test-paccd?orgId=1&from=now-24h&to=now
* Prod Grafana Dashboard: https://farizfx.grafana.net/d/pSMia4pVz/prod-paccd?orgId=1

Azure Repo Link: 
* Azure Repo for Work capture: https://dev.azure.com/fareesdeveloper0547/Fenesys

Workflow
* It have 2 environments Prod and test.
* Developer can clone this repo and use vs.code to perform development activity
* Once they are happy with the development raise pull request and once approved, they can check deployment of docker image in test environment
  Note: During PR, 2 github actions will run to check vulnerabilities and syntax error
* For Prod Deployment, it will automatically go for admin approval, once approved resources will be pushed to prod


## Features

This project demonstrates the use of the Cosmos DB python SDK with FastAPI . It covers the following aspects:

* Create Azure Cosmos DB Resource in Azure Portal 
* Setup the dev environment and install requisite client-side libraries
* Store Cosmos DB Resource connection credentials on our server 
* Connect to Cosmos DB Resource through python client 
* Define ToDoItem data model 
* Create the required database and container to store ToDo Items 
* Setup for API implementation 
* Write functions to interact with the database 
* Expose the API endpoints with FastAPI 
* Test the endpoints 
* Configure Dashboard
* Configure alert

## Source: 
This project is inspired from 
* https://github.com/Azure-Samples/cosmosdb-python-fastapi
* https://github.com/Azure-Samples/opencensus-with-fastapi-and-azure-monitor

## Project Files:

* Code present in api directory -> https://github.com/Fariz-fx/PACCD/tree/main/api/
* Bicep Template present in iac -> https://github.com/Fariz-fx/PACCD/tree/main/iac
* Github Workflow present in default location: https://github.com/Fariz-fx/PACCD/tree/main/.github

## Resources

- Learn more about Azure Cosmos DB SQL API  - https://docs.microsoft.com/en-us/azure/cosmos-db/sql/
