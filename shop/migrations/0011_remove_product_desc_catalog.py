# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-08-10 15:52
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0010_product_desc_catalog'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='product',
            name='desc_catalog',
        ),
    ]
