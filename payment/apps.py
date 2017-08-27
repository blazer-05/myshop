# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.apps import AppConfig


class PaymentConfig(AppConfig):
    name = 'payment'
    verbose_name = 'Оплата'

    def ready(self):
        import payment.signals
