# -*- coding: UTF-8 -*-
from django import forms
from django.forms import ModelForm
from .models import Order, MailBox, OrderItem

class OrderItemForm(forms.ModelForm):
    class Meta:
        model = OrderItem
        fields = 'product', 'quantity', 'diameter'

    def save(self, commit=True):
        product = self.cleaned_data.get('product')
        self.instance.price = product.get_sale()
        return super(OrderItemForm, self).save(commit)

class OrderCreateForm(forms.ModelForm):
    class Meta:
        model = Order
        fields = ['myname',
                  'email',
                  'phone',
                  'addres',
                  'postal_code',
                  'payment_method',
                  'post_delivery',
                  'post_comments',
                  ]

class ContactForm(ModelForm):
    class Meta:
        model = MailBox
        fields = ['subject',
                  'sender',
                  'phone',
                  'diament',
                  'adress',
                  'description'
                  ]

