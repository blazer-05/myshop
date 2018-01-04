# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib import admin
from articles.models import Oferta, Articles
from django_summernote.admin import SummernoteModelAdmin

class AdminArticles(SummernoteModelAdmin):
    prepopulated_fields = {'slug': ('title',)}
    list_display = ['title', 'image_img', 'autor', 'is_activ', 'count', 'create', 'update']

class AdminOferta(SummernoteModelAdmin):
    list_display = ['title', 'is_activ', 'create', 'update']

admin.site.register(Articles, AdminArticles)
admin.site.register(Oferta, AdminOferta)
