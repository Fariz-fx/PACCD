# Python API app

## Setup

Requirements:

- Python (3.8+)

```bash
$ pip install -r requirements.txt
```

Or

```bash
$ poetry install
```

## Running

Before running, set the  `.env` by providing URI & Connection String of Cosmos DB.

Run the following common from the root of the api folder to start the app:

```bash
$ uvicorn main:app --port 3100 --reload
```

There is also a launch profile in VS Code for debugging.

## Running in Docker

The environment variable AZURE_COSMOS_CONNECTION_STRING must be set and then application runs on TCP 8080:

```bash
docker build . -t imagename:version
docker run -p 3100:3100 -t imagename.version
```

## Tests

The tests can be run from the command line, or the launch profile in VS Code

```bash
$ pip install -r requirements-test.txt
$ AZURE_COSMOS_DATABASE_NAME=test_db python -m pytest tests/
```
