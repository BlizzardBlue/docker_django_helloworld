## Dockerfile

FROM ubuntu:14.04
MAINTAINER JiYun Kim <dbdb6151@gmail.com>

RUN apt-get update && \
apt-get upgrade -y

RUN apt-get install -y python python-pip curl && \
pip install django && \
apt-get clean

RUN mkdir /opt/webapp

WORKDIR /opt/webapp

RUN django-admin.py startproject hackathon

WORKDIR /opt/webapp/hackathon/hackathon

RUN curl https://raw.githubusercontent.com/BlizzardBlue/lightning_hackathon_150905/master/urls.py >> urls.py && \
curl https://raw.githubusercontent.com/BlizzardBlue/lightning_hackathon_150905/master/views.py >> views.py

WORKDIR /opt/webapp/hackathon
CMD python manage.py runserver 0.0.0.0:80


EXPOSE 80
