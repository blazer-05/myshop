# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

from interkassa_merchant.models import Invoice
from shop.models import Product

POST_CHOICES = (
    ('post_russia', 'Почта России'),
    ('post_cdek', 'Служба доставки СДЭК'),
    ('post_dpd', 'Служба доставки DPD'),
    ('post_kit', 'Служба доставки KIT')
)

PAYMENT_CHOICES = (
("nal", "Наличными при получении"),
("bank", "Оплата картой банка"),
# ("interkassa", "Онлайн оплата(Interkassa)")
("walletone", "Онлайн оплата(walletone)")
)

class PostOrder(models.Model):
    post_name = models.CharField(max_length=150, verbose_name='ФИО')
    post_email = models.EmailField(max_length=100, verbose_name='e-mail', blank=True)
    post_phone = models.CharField(max_length=100, verbose_name='Телефон')
    post_adres = models.CharField(max_length=150, verbose_name='Адрес')
    post_delivery = models.CharField(max_length=150, verbose_name='Служба доставки', choices=POST_CHOICES)
    payment_method = models.CharField(max_length=100, verbose_name='Способ оплаты', choices=PAYMENT_CHOICES)
    post_comments = models.TextField(verbose_name='Комментарий')
    post_created = models.DateTimeField(auto_now_add=True, verbose_name='Создан')
    post_update = models.DateTimeField(auto_now=True, verbose_name='Изменен')

    class Meta:
        verbose_name = 'Быстрый заказ'
        verbose_name_plural = 'Быстрые заказы'
        ordering = ('-post_created',)

    def __unicode__(self):
        return self.post_name

class Order(models.Model):
    name_tems = models.CharField(max_length=150, verbose_name='Заголовок темы', blank=True)
    myname = models.CharField(max_length=150, verbose_name='ФИО')
    email = models.EmailField(verbose_name='Email')
    addres = models.CharField(max_length=200, verbose_name='Адрес')
    phone = models.CharField(max_length=20, verbose_name='Телефон', blank=True)
    postal_code = models.CharField(max_length=20, verbose_name='Почтовый код')
    created = models.DateTimeField(auto_now_add=True, verbose_name='Создан')
    update = models.DateTimeField(auto_now=True, verbose_name='Обновлен')
    paid = models.BooleanField(default=False, verbose_name='Оплачен')
    payment_method = models.CharField(max_length=100, verbose_name='Способ оплаты', choices=PAYMENT_CHOICES)
    invoice = models.OneToOneField(Invoice, blank=True, null=True, related_name='order', verbose_name='Invoice')

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
    diameter = models.IntegerField(default=0, verbose_name='Ø ваш диаметр вала')

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