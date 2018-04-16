# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2018-04-16 06:34
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('orders', '0014_postorder'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='post_comments',
            field=models.TextField(blank=True, verbose_name='\u041a\u043e\u043c\u043c\u0435\u043d\u0442\u0430\u0440\u0438\u0439'),
        ),
        migrations.AddField(
            model_name='order',
            name='post_delivery',
            field=models.CharField(choices=[('post_russia', '\u041f\u043e\u0447\u0442\u0430 \u0420\u043e\u0441\u0441\u0438\u0438'), ('post_cdek', '\u0421\u043b\u0443\u0436\u0431\u0430 \u0434\u043e\u0441\u0442\u0430\u0432\u043a\u0438 \u0421\u0414\u042d\u041a'), ('post_dpd', '\u0421\u043b\u0443\u0436\u0431\u0430 \u0434\u043e\u0441\u0442\u0430\u0432\u043a\u0438 DPD'), ('post_kit', '\u0421\u043b\u0443\u0436\u0431\u0430 \u0434\u043e\u0441\u0442\u0430\u0432\u043a\u0438 KIT')], default='', max_length=150, verbose_name='\u0421\u043b\u0443\u0436\u0431\u0430 \u0434\u043e\u0441\u0442\u0430\u0432\u043a\u0438'),
            preserve_default=False,
        ),
    ]
