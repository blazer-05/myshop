# -*- coding: UTF-8 -*-
from django.conf.urls import url
from . import  views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    # url(r'^$', views.ProductList, name='ProductList'),
    url(r'^catalog/$', views.ProductList, name='ProductList'),
    url(r'^catalog/(?P<category_slug>[-\w]+)/$', views.ProductList, name='ProductListByCategory'),
    url(r'^(?P<id>\d+)/(?P<slug>[-\w]+)/$', views.ProductDetail, name='ProductDetail'),

    url(r'^videos/', views.video, name='video'),
    url(r'^oplata_dostavka/', views.oplata_dostavka, name='oplata_dostavka'),
    url(r'^otzivi/', views.otzivi, name='otzivi'),
    url(r'^faq/', views.faq, name='faq'),
]