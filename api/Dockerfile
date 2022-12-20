FROM python:3.9
WORKDIR /code
EXPOSE 3100
COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY . /code

CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "3100"]