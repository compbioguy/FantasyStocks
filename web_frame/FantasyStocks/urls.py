from django.conf.urls import patterns, url

from FantasyStocks import views

urlpatterns = patterns('',
    url(r'^admin/', admin.site.urls),
    url(r'^$', views.index, name='index'),
    url(r'^login/', views.login, name='login'),
    url(r'^home/', views.home, name='home'),
    url(r'^forum/', views.forum, name='forum'),
)
