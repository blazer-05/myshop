# -*- coding: UTF-8 -*-

from django.conf.urls import url
from articles import views


urlpatterns = [

    url(r'^$', views.articles_list, name='articles_list'),
    url(r'^detail/(?P<slug>[-\w]+)/$', views.articles_detail, name='articles_detail'),
    url(r'^oferta/$', views.oferta, name='oferta'),

]
