# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

class Video_tube(models.Model):
    title = models.CharField(max_length=200, verbose_name='Заголовок', blank=True)
    text = models.TextField(blank=True, verbose_name='Описание')
    links = models.URLField(verbose_name='Ссылка')
    is_active = models.BooleanField(default=False, verbose_name='Модерация')
    create = models.DateTimeField(auto_now_add=True, verbose_name='Создан')
    update = models.DateTimeField(auto_now=True, verbose_name='Обновлен')

    class Meta:
        verbose_name = 'Видео'
        verbose_name_plural = 'Видео с youtube'

    def __unicode__(self):
        return self.title
