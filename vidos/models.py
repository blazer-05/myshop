# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.utils import timezone


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

class Video_slider(models.Model):
    title = models.CharField(max_length=250, verbose_name='Заголовок')
    links = models.URLField(verbose_name='Ссылка на ролик')
    link_tovar = models.URLField(verbose_name='Ссылка на товар', blank=True)
    price = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name='Цена', blank=True)
    v_timer = models.BooleanField(default=False, verbose_name='Таймер')
    is_activ = models.BooleanField(default=False, verbose_name='Модерация')
    timer_before = models.DateTimeField(null=True, blank=True, verbose_name='Дата таймера')
    create = models.DateTimeField(auto_now_add=True, verbose_name='Создан')
    update = models.DateTimeField(auto_now=True, verbose_name='Обновлен')

    class Meta:
        verbose_name = 'Видео слайдер'
        verbose_name_plural = 'Видео слайдеры'
        ordering = ['create']

    def __unicode__(self):
        return self.title

    def need_timer(self):
        return self.v_timer and self.timer_before and timezone.now() < self.timer_before

