# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-08-24 05:59
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0003_mailbox_description'),
    ]

    operations = [
        migrations.RenameField(
            model_name='order',
            old_name='city',
            new_name='gorod',
        ),
    ]