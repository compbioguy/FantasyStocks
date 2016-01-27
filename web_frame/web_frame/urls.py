from django.conf.urls import patterns, include, url
from django.contrib import admin

urlpatterns = [
    url(r'^FantasyStocks/', include('FantasyStocks.urls')),
    url(r'^admin/', include(admin.site.urls)),
]
