# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render
from .models import Faq

def faq(request):
    faqs = 'Вопрос/Ответ'
    faq = Faq.objects.filter(is_activ=True)
    return render(request, 'faq/faq.html', {'faq': faq, 'faqs': faqs})
