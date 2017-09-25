# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.http import HttpResponse
import csv
import six
import codecs
import datetime
from django.contrib import admin
from orders.models import Order, OrderItem, MailBox

from django.core.urlresolvers import reverse
from django.utils.html import format_html

def OrderDetail(obj):
    return format_html('<a href="{}">Посмотреть</a>'.format(
        reverse('orders:AdminOrderDetail', args=[obj.id])
    ))

# def OrderPDF(obj):
#     return format_html('<a href="{}">PDF</a>'.format(
#         reverse('orders:AdminOrderPDF', args=[obj.id])
#     ))
# OrderPDF.short_description = 'В PDF'

def ExportToCSV(modeladmin, request, queryset):
    opts = modeladmin.model._meta
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; \
        filename=Orders-{}.csv'.format(datetime.datetime.now().strftime("%d/%m/%Y"))
    response.write(codecs.BOM_UTF8)
    writer = csv.writer(response, delimiter=str(';'), quoting=csv.QUOTE_ALL)

    fields = [field for field in opts.get_fields() if not field.many_to_many and not field.one_to_many]
    # Первая строка- оглавления
    writer.writerow([field.verbose_name.encode("utf8") for field in fields])
    # Заполняем информацией
    for obj in queryset:
        data_row = []
        for field in fields:
            value = getattr(obj, field.name)
            if isinstance(value, six.string_types):
                data_row.append(value.encode('utf8'))
            else:
                data_row.append(value)
        writer.writerow(data_row)
    return response
ExportToCSV.short_description = 'Export CSV'

class OrderItemInline(admin.TabularInline):
    model = OrderItem
    raw_id_field = ['product']

class OrderAdmin(admin.ModelAdmin):
    list_display = ['id', 'myname', 'email', 'phone', 'addres',
                    'postal_code', 'paid', 'payment_method', 'created', 'update', OrderDetail]
    list_filter = ['paid', 'created', 'update']
    inlines = [OrderItemInline]
    actions = [ExportToCSV]

class MailBoxAdmin(admin.ModelAdmin):
    list_display = ['subject', 'sender', 'phone', 'diament', 'adress', 'description', 'datetime']

admin.site.register(Order, OrderAdmin)
admin.site.register(MailBox, MailBoxAdmin)