# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-08-24 08:05
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0004_auto_20170824_0859'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='order',
            name='gorod',
        ),
    ]
