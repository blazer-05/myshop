# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render
from vidos.models import Video_tube

def video(request):
    video = Video_tube.objects.filter(is_active=True)
    return render(request, 'vidos/video.html', {'video': video})
