from django.conf.urls import patterns, url
from . import views

urlpatterns = patterns('',
    url(r'^index/', views.index, name='index'),
    url(r'^login/', views.login, name='login'),
    url(r'^home/', views.home, name='home'),
    url(r'^forum/', views.forum, name='forum'),
)
