# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-03-23 08:13
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0012_order_name_tems'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='payment_method',
            field=models.CharField(choices=[('nal', '\u041d\u0430\u043b\u0438\u0447\u043d\u044b\u043c\u0438 \u043f\u0440\u0438 \u043f\u043e\u043b\u0443\u0447\u0435\u043d\u0438\u0438'), ('bank', '\u041e\u043f\u043b\u0430\u0442\u0430 \u043a\u0430\u0440\u0442\u043e\u0439 \u0431\u0430\u043d\u043a\u0430'), ('walletone', '\u041e\u043d\u043b\u0430\u0439\u043d \u043e\u043f\u043b\u0430\u0442\u0430(walletone)')], max_length=100, verbose_name='\u0421\u043f\u043e\u0441\u043e\u0431 \u043e\u043f\u043b\u0430\u0442\u044b'),
        ),
    ]
