# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-08-30 07:04
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('interkassa_merchant', '0001_initial'),
        ('orders', '0006_order_payment_method'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='invoice',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='order', to='interkassa_merchant.Invoice', verbose_name='Invoice'),
        ),
        migrations.AlterField(
            model_name='order',
            name='payment_method',
            field=models.CharField(choices=[('nal', '\u041d\u0430\u043b\u0438\u0447\u043d\u044b\u043c\u0438 \u043f\u0440\u0438 \u043f\u043e\u043b\u0443\u0447\u0435\u043d\u0438\u0438'), ('bank', '\u041e\u043f\u043b\u0430\u0442\u0430 \u043a\u0430\u0440\u0442\u043e\u0439 \u0431\u0430\u043d\u043a\u0430'), ('interkassa', '\u041e\u043d\u043b\u0430\u0439\u043d \u043e\u043f\u043b\u0430\u0442\u0430(Interkassa)')], max_length=100, verbose_name='\u0421\u043f\u043e\u0441\u043e\u0431 \u043e\u043f\u043b\u0430\u0442\u044b'),
        ),
    ]
