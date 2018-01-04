# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.urls import reverse


class Articles(models.Model):
    title = models.CharField(max_length=200, verbose_name='Заголовок')
    metakeywords = models.CharField(max_length=200, verbose_name='Ключевые слова', blank=True)
    metadescription = models.CharField(max_length=200, verbose_name='Описание', blank=True)
    slug = models.SlugField(max_length=200, verbose_name='Транслит')
    text = models.TextField(verbose_name='Краткий текст статьи')
    text_full = models.TextField(verbose_name='Полный текст статьи')
    image = models.ImageField(upload_to='articles/%y/%m/%d/', blank=True, verbose_name='Изображение статьи')
    video = models.URLField(blank=True, verbose_name='Ссылка на видео')
    autor = models.CharField(max_length=100, verbose_name='Автор', blank=True)
    count = models.IntegerField(default=0, verbose_name='Просмотры')
    is_activ = models.BooleanField(default=False, verbose_name='Модерация')
    create = models.DateTimeField(auto_now_add=True, verbose_name='Создан')
    update = models.DateTimeField(auto_now=True, verbose_name='Обновлен')

    class Meta:
        verbose_name = 'Статья'
        verbose_name_plural = 'Статьи'
        ordering = ['-create']

    def __unicode__(self):
        return self.title

    # Вывод картинок в админке!
    def image_img(self):
        if self.image:
            return u'<a href="{0}" target="_blank"><img src="{0}" width="50"/></a>'.format(self.image.url)
        else:
            return '(Нет изображения)'
    image_img.short_description = 'Картинка'
    image_img.allow_tags = True

class Oferta(models.Model):
    title = models.CharField(max_length=200, verbose_name='Заголовок')
    text = models.TextField(verbose_name='Текст')
    is_activ = models.BooleanField(default=False, verbose_name='Модерация')
    create = models.DateTimeField(auto_now_add=True, verbose_name='Создан')
    update = models.DateTimeField(auto_now=True, verbose_name='Обновлен')

    def __unicode__(self):
        return self.title

    class Meta:
        verbose_name = 'Договор'
