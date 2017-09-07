# -*- coding: UTF-8 -*-
from django import forms

PRODUCT_QUANTITY_CHOICES = [(i, str(i)) for i in range(1, 21)]

class CartAddProductForm(forms.Form):
    quantity = forms.IntegerField(label='Количество', initial=1)
    # quantity = forms.TypedChoiceField(choices=PRODUCT_QUANTITY_CHOICES, coerce=int, label='Количество')
    update = forms.BooleanField(required=False, initial=False, widget=forms.HiddenInput)
    # diameter = forms.IntegerField(label='Ø Ваш диаметр вала')
    diameter = forms.TypedChoiceField(choices=[], coerce=int, label='Ваш диаметр вала')

    def __init__(self, *args, **kwargs):
        _min = kwargs.pop('diameter_min', 0)
        _max = kwargs.pop('diameter_max', 0)
        super(CartAddProductForm, self).__init__(*args, **kwargs)
        self.fields['diameter'].choices = [(i, str(i)) for i in range(_min, _max + 1)]


'''
PRODUCT_QUANTITY_CHOICES = [(i, str(i)) for i in range(1, 21)]

class CartAddProductForm(forms.Form):
    quantity = forms.IntegerField(label='Количество', initial=1)
    # quantity = forms.TypedChoiceField(choices=PRODUCT_QUANTITY_CHOICES, coerce=int, label='Количество')
    update = forms.BooleanField(required=False, initial=False, widget=forms.HiddenInput)
    diameter = forms.IntegerField(label='Ø Ваш диаметр вала')

    def __init__(self, *args, **kwargs):
        _min = kwargs.pop('diameter_min', 0)
        _max = kwargs.pop('diameter_max', 0)
        super(CartAddProductForm, self).__init__(*args, **kwargs)
        self.fields['diameter'].widget.attrs.update({
            'min': _min,
            'max': _max
        })
'''