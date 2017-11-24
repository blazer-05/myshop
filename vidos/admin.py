# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib import admin
from vidos.models import Video_tube, Video_slider

class Video_tubeAdmin(admin.ModelAdmin):
    list_display = ['title', 'text', 'links', 'is_active', 'create', 'update']

class Video_sliderAdmin(admin.ModelAdmin):
    list_display = ['title', 'links', 'v_timer', 'is_activ', 'create', 'update']
    list_editable = ['v_timer', 'is_activ']


admin.site.register(Video_tube, Video_tubeAdmin)
admin.site.register(Video_slider, Video_sliderAdmin)

