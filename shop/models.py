# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.core.urlresolvers import reverse

# Модель категории
class Category(models.Model):
    name = models.CharField(max_length=200, db_index=True, verbose_name='Название')
    slug = models.SlugField(max_length=200, db_index=True, unique=True, verbose_name='Транслит')
    description = models.TextField(blank=True, verbose_name='Описание')
    available = models.BooleanField(default=True, verbose_name='Доступна')

    class Meta:
        ordering = ['name']
        verbose_name = 'Категория'
        verbose_name_plural = 'Категории'

    def __unicode__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('shop:ProductListByCategory', args=[self.slug])

# Модель продукта
class Product(models. Model):
    category = models.ForeignKey(Category, related_name='product', verbose_name='Категория')
    name = models.CharField(max_length=200, db_index=True, verbose_name='Название')
    slug = models.SlugField(max_length=200, db_index=True, verbose_name='Транслит')
    image = models.ImageField(upload_to='products/%y/%m/%d/', blank=True, verbose_name='Изображение товара')
    description = models.TextField(blank=True, verbose_name='Описание')
    description_two = models.TextField(blank=True, verbose_name='Доп.информация')
    urlyoutube = models.URLField(blank=True, verbose_name='Ссылка на видео')
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Цена')
    discount = models.IntegerField(default=0, verbose_name='Скидка')
    netto = models.CharField(max_length=20, blank=True, verbose_name='Габариты')
    massa = models.CharField(max_length=20, blank=True, verbose_name='Масса')
    stock = models.PositiveIntegerField(verbose_name='На складе')
    available = models.BooleanField(default=True, verbose_name='Доступен')
    new = models.BooleanField(default=False, verbose_name='Новый товар')
    vip = models.BooleanField(default=False, verbose_name='vip товар')
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    diameter_default = models.IntegerField(default=30, verbose_name='Ø по умолчанию')
    diameter_min = models.IntegerField(default=0, verbose_name='Ø минимальный')
    diameter_max = models.IntegerField(default=0, verbose_name='Ø максимальный')

    class Meta:
        ordering = ['name']
        index_together = [
            ['id', 'slug']
        ]
        verbose_name = 'Товар'
        verbose_name_plural = 'Товары'

    def __unicode__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('shop:ProductDetail', args=[self.id, self.slug])

    # Расчет скидки
    def get_sale(self):
        '''Расчитать стоимость со скидкой'''
        price = int(self.price * (100 - self.discount) / 100)
        return price

    def get_form(self):
        from cart.forms import CartAddProductForm
        limits = {'diameter_min': self.diameter_min, 'diameter_max': self.diameter_max}
        initial = {'diameter': self.diameter_default}
        return CartAddProductForm(initial=initial, **limits)

    # Вывод картинок в админке!
    def image_img(self):
        if self.image:
            return u'<a href="{0}" target="_blank"><img src="{0}" width="100"/></a>'.format(self.image.url)
        else:
            return '(Нет изображения)'
    image_img.short_description = 'Картинка'
    image_img.allow_tags = True

# Модель категория для страницы каталога
class Description(models.Model):
    desc_catalog = models.TextField(blank=True, verbose_name='Описание')

    class Meta:
        verbose_name = 'Категрия'
        verbose_name_plural = 'Описание для страницы каталога'

    def __unicode__(self):
        return self.desc_catalog

class Albom(models.Model):
    name = models.CharField(max_length=100, blank=True, verbose_name='Название')
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='images', null=True)
    images = models.ImageField(upload_to='products/thumbnail/%y/%m/%d/', blank=True, verbose_name='Изображение')

    class Meta:
        verbose_name = 'Фото альбом'
        verbose_name_plural ='Фото товаров'

    def __unicode__(self):
        return self.name

    # Вывод картинок в админке!
    def image_img(self):
        if self.images:
            return u'<a href="{0}" target="_blank"><img src="{0}" width="100"/></a>'.format(self.images.url)
        else:
            return '(Нет изображения)'
    image_img.short_description = 'Картинка'
    image_img.allow_tags = True