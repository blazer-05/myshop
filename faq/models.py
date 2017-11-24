# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

class Faq(models.Model):
    title = models.CharField(max_length=150, verbose_name='Вопрос')
    text = models.TextField(verbose_name='Ответ')
    is_activ = models.BooleanField(default=False, verbose_name='Модерация')
    create = models.DateTimeField(auto_now_add=True, verbose_name='Создан')
    update = models.DateTimeField(auto_now=True, verbose_name='Обновлен')

    class Meta:
        verbose_name = 'Вопрос/Ответ'
        verbose_name_plural = 'Вопросы/Ответы'
        ordering = ['create']

    def __unicode__(self):
        return self.title