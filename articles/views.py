# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.shortcuts import render, get_object_or_404
from .models import *

def articles_list(request):
    context = {}
    posts = Articles.objects.filter(is_activ=True)
    paginator = Paginator(posts, 2)
    page = request.GET.get('page')

    try:
        posts = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        posts = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        posts = paginator.page(paginator.num_pages)
    context['posts'] = posts
    context['page'] = page
    return render(request, 'articles/articles_list.html', context)

def articles_detail(request, slug):
    context = {}
    post_full = get_object_or_404(Articles, slug=slug)
    top_five_articles = Articles.objects.all().exclude(slug=slug).order_by()[:3]
    context['post_full'] = post_full
    context['top_five_articles'] = top_five_articles
    return render(request, 'articles/articles_detail.html', context)

def oferta(request):
    context = {}
    oferttile = Oferta.objects.get()
    oferta = Oferta.objects.filter(is_activ=True)
    context['oferta'] = oferta
    context['oferttile'] = oferttile
    return render(request, 'articles/oferta.html', context)