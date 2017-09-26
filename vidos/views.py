# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.shortcuts import render
from vidos.models import Video_tube

def video(request):
    video = Video_tube.objects.filter(is_active=True)
    paginator = Paginator(video, 4)
    page = request.GET.get('page')
    try:
        video = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        video = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        video = paginator.page(paginator.num_pages)
    return render(request, 'vidos/video.html', {'video': video})
