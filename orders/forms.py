# -*- coding: UTF-8 -*-
from django import forms
from django.forms import ModelForm
from .models import Order, MailBox


class OrderCreateForm(forms.ModelForm):
    class Meta:
        model = Order
        fields = ['myname', 'email', 'phone', 'addres', 'postal_code', 'payment_method']

class ContactForm(ModelForm):
    class Meta:
        model = MailBox
        fields = ['subject', 'sender', 'phone', 'diament', 'adress', 'description']