# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from shop.models import Product

class Order(models.Model):
    first_name = models.CharField(max_length=50, verbose_name='Имя')
    last_name = models.CharField(max_length=50, verbose_name='Фамилия')
    email = models.EmailField(verbose_name='Email')
    addres = models.CharField(max_length=200, verbose_name='Адрес')
    postal_code = models.CharField(max_length=20, verbose_name='Почтовый код')
    created = models.DateTimeField(auto_now_add=True, verbose_name='Создан')
    update = models.DateTimeField(auto_now=True, verbose_name='Обновлен')
    paid = models.BooleanField(default=False, verbose_name='Оплачен')

    class Meta:
        ordering = ('-created', )
        verbose_name = 'Заказ'
        verbose_name_plural = 'Заказы'

    def __unicode__(self):
        return 'Заказ: {}'.format(self.id)

    def get_total_cost(self):
        return sum(item.get_cost() for item in self.Items.all())

class OrderItem(models.Model):
    order = models.ForeignKey(Order, related_name='Items')
    product = models.ForeignKey(Product, related_name='order_items')
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Цена')
    quantity = models.PositiveIntegerField(default=1, verbose_name='Количество')

    def __unicode__(self):
        return '{}'.format(self.id)

    def get_cost(self):
        return self.price * self.quantity


class MailBox(models.Model):
    subject = models.CharField(max_length=150, verbose_name='Имя пользователя', blank=True)
    sender = models.CharField(max_length=50, verbose_name='E-mail пользователя', blank=True)
    phone = models.CharField(max_length=20, verbose_name='Телефон', blank=True)
    diament = models.CharField(max_length=20, verbose_name='Диаметр вала', blank=True)
    adress = models.CharField(max_length=200, verbose_name='Адрес клиента', blank=True)
    description = models.TextField(blank=True, verbose_name='Примечание')
    datetime = models.DateTimeField(auto_now=True, null=True, verbose_name='Дата')

    class Meta:
        verbose_name = 'Форма'
        verbose_name_plural = 'Форма заказов'

    def __unicode__(self):
        return self.subject