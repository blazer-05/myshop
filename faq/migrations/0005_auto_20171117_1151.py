# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-11-17 08:51
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('faq', '0004_remove_faq_description'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='faq',
            options={'ordering': ['create'], 'verbose_name': '\u0412\u043e\u043f\u0440\u043e\u0441/\u041e\u0442\u0432\u0435\u0442', 'verbose_name_plural': '\u0412\u043e\u043f\u0440\u043e\u0441\u044b/\u041e\u0442\u0432\u0435\u0442\u044b'},
        ),
    ]