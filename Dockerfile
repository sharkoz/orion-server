FROM python:2.7-buster
MAINTAINER Kevin Lin <developer@kevinlin.info>

RUN pip install gunicorn
COPY . /
RUN pip install -r requirements.txt 

ENV DATABASE_HOST db
ENV DATABASE_PORT 3306
ENV DATABASE_NAME orion
ENV DATABASE_USER root
ENV DATABASE_PASSWORD orion
ENV PYTHONPATH "/"

EXPOSE 80

CMD make init-db && gunicorn --bind 0.0.0.0:80 -w 4 orion.server:app
