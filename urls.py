## urls.py

from django.conf.urls import patterns, include, url
from hackathon.views import hello


# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
        url(r'^', hello)
)
