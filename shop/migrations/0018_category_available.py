# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-08-16 18:26
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0017_auto_20170815_0830'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='available',
            field=models.BooleanField(default=True, verbose_name='\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u0430'),
        ),
    ]