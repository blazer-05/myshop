# -*- coding: UTF-8 -*-

from django.conf.urls import url
from vidos import views


urlpatterns = [
    # url(r'^catalog/(?P<category_slug>[-\w]+)/$', views.ProductList, name='ProductListByCategory'),
    # url(r'^(?P<id>\d+)/(?P<slug>[-\w]+)/$', views.ProductDetail, name='ProductDetail'),

    url(r'^', views.video, name='video'),

]