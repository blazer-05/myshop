# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-09-06 08:53
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0007_auto_20170830_1004'),
    ]

    operations = [
        migrations.AddField(
            model_name='orderitem',
            name='diameter',
            field=models.IntegerField(default=0, verbose_name='\xd8 \u0432\u0430\u0448 \u0434\u0438\u0430\u043c\u0435\u0442\u0440 \u0432\u0430\u043b\u0430'),
        ),
    ]
