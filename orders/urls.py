# -*- coding: UTF-8 -*-
from django.conf.urls import url
from . import views


urlpatterns = [
    url(r'^create/$', views.OrderCreate, name='OrderCreate'),
    url(r'^admin/order/(?P<order_id>\d+)/$', views.AdminOrderDetail, name='AdminOrderDetail'),
    # url(r'^admin/order/(?P<order_id>\d+)/pdf/$', views.AdminOrderPDF, name='AdminOrderPDF'),
    url(r'^contact/$', views.contact, name='contact'),
    url(r'^orders/quick/(?P<product_pk>\d+)/$', views.FormView),
    url(r'^thanks/$', views.thanks, name='thanks'),
    url(r'^success/$', views.kassa, name='success'),
]