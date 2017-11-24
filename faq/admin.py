# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import Faq

class AdminFaq(admin.ModelAdmin):
    list_display = ['title', 'text', 'is_activ', 'create', 'update']

admin.site.register(Faq, AdminFaq)

