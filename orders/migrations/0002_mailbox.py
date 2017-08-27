# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-08-21 15:03
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='MailBox',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('subject', models.CharField(blank=True, max_length=150, verbose_name='\u0418\u043c\u044f \u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u044f')),
                ('sender', models.CharField(blank=True, max_length=50, verbose_name='E-mail \u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u044f')),
                ('phone', models.CharField(blank=True, max_length=20, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d')),
                ('diament', models.CharField(blank=True, max_length=20, verbose_name='\u0414\u0438\u0430\u043c\u0435\u0442\u0440 \u0432\u0430\u043b\u0430')),
                ('adress', models.CharField(blank=True, max_length=200, verbose_name='\u0410\u0434\u0440\u0435\u0441 \u043a\u043b\u0438\u0435\u043d\u0442\u0430')),
                ('datetime', models.DateTimeField(auto_now=True, null=True, verbose_name='\u0414\u0430\u0442\u0430')),
            ],
            options={
                'verbose_name': '\u0424\u043e\u0440\u043c\u0430',
                'verbose_name_plural': '\u0424\u043e\u0440\u043c\u0430 \u0437\u0430\u043a\u0430\u0437\u043e\u0432',
            },
        ),
    ]