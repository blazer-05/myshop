# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render, redirect, get_object_or_404
from django.views.decorators.http import require_POST
from shop.models import Product
from .cart import Cart
from .forms import CartAddProductForm

@require_POST
def CartAdd(request, product_id):
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    limits = {'diameter_min': product.diameter_min, 'diameter_max': product.diameter_max}
    form = CartAddProductForm(data=request.POST, **limits)
    if form.is_valid():
        cd = form.cleaned_data
        cart.add(product=product, quantity=cd['quantity'],
                                  update_quantity=cd['update'],
                                  diameter=cd['diameter'],
                                   )
    print(form.is_valid())
    print(form.errors)
    return redirect('cart:CartDetail')

def CartRemove(request, product_id):
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    cart.remove(product)
    return redirect('cart:CartDetail')

def CartDetail(request):
    cart = Cart(request)
    for item in cart:
        product = item['product']
        limits = {'diameter_min': product.diameter_min, 'diameter_max': product.diameter_max}
        item['update_quantity_form'] = CartAddProductForm(
                                        initial={
                                            'quantity': item['quantity'],
                                            'diameter': item['diameter'],
                                            'update': True
                                        }, **limits)
    return render(request, 'cart/detail.html', {'cart': cart})


'''
def CartDetail(request):
    cart = Cart(request)
    for item in cart:
        item['update_quantity_form'] = CartAddProductForm(
                                        initial={
                                            'quantity': item['quantity'],
                                            'diameter': item['diameter'],
                                            'update': True
                                        })
    return render(request, 'cart/detail.html', {'cart': cart})
'''