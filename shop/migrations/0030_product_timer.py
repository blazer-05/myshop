# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-11-23 07:15
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0029_product_akciya'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='timer',
            field=models.BooleanField(default=False, verbose_name='\u0422\u0430\u0439\u043c\u0435\u0440'),
        ),
    ]
