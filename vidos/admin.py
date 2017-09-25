# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib import admin
from vidos.models import Video_tube

class Video_tubeAdmin(admin.ModelAdmin):
    list_display = ['title', 'text', 'links', 'is_active', 'create', 'update']

admin.site.register(Video_tube, Video_tubeAdmin)

