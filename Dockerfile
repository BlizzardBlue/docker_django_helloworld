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

RUN curl https://raw.githubusercontent.com/BlizzardBlue/docker_django_helloworld/master/urls.py >> urls.py && \
curl https://raw.githubusercontent.com/BlizzardBlue/docker_django_helloworld/master/views.py >> views.py

WORKDIR /opt/webapp/hackathon

EXPOSE 80
CMD python manage.py runserver 0.0.0.0:80
