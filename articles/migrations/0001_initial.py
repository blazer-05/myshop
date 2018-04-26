# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-12-28 07:54
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Oferta',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200, verbose_name='\u0417\u0430\u0433\u043e\u043b\u043e\u0432\u043e\u043a')),
                ('text', models.TextField(verbose_name='\u0422\u0435\u043a\u0441\u0442')),
                ('is_activ', models.BooleanField(default=False, verbose_name='\u041c\u043e\u0434\u0435\u0440\u0430\u0446\u0438\u044f')),
                ('create', models.DateTimeField(auto_now_add=True, verbose_name='\u0421\u043e\u0437\u0434\u0430\u043d')),
                ('update', models.DateTimeField(auto_now=True, verbose_name='\u041e\u0431\u043d\u043e\u0432\u043b\u0435\u043d')),
            ],
            options={
                'verbose_name': '\u0414\u043e\u0433\u043e\u0432\u043e\u0440',
            },
        ),
    ]