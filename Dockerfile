FROM python:3.7-alpine
MAINTAINER John Survant

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

#create a user to run the project under and then switch to that user, keeps us from running under the root account
RUN adduser -D user
USER user
