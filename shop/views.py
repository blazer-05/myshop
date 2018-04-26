# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.conf import settings

from django.core.mail import EmailMessage
from django.db import transaction
from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, redirect
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.template.loader import render_to_string

from cart.cart import Cart
from orders.forms import OrderCreateForm, OrderItemForm
from orders.models import OrderItem

from shop.models import Category, Product, Description, Albom
from cart.forms import CartAddProductForm
from vidos.models import Video_slider, Video_tube

from g_recaptcha.validate_recaptcha import validate_captcha

# Выводим товары

# Страница с товарами - каталог
#@validate_captcha
@transaction.atomic
def ProductList(request, category_slug=None):
    category = None
    categories = Category.objects.all()
    desc = Description.objects.all()
    cart_product_form = CartAddProductForm()
    products = Product.objects.filter(available=True)
    if category_slug:
        category = get_object_or_404(Category, slug=category_slug)
        products = products.filter(category=category)

    paginator = Paginator(products, 20)
    page = request.GET.get('page')
    try:
        products = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        products = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        products = paginator.page(paginator.num_pages)

    if request.method == 'POST':
        cart = Cart(request)
        form = OrderCreateForm(request.POST)
        order_item_form = OrderItemForm(request.POST)
        if form.is_valid() and order_item_form.is_valid():
            order = form.save()
            order_item_form.instance.order = order
            order_item_form.save()

            context = {
                'myname': order.myname,
                'email': order.email,
                'addres': order.addres,
                'postal_code': order.postal_code,
                'order': order,
                'cart': cart,
                'form': form,
                'phone': order.phone,
                'payment_method': order.payment_method,
                'post_delivery': order.post_delivery,
                'post_comments': order.post_comments,
            }

            recepients = ['blazer-05@mail.ru']
            message = render_to_string('orders/mailbox/email_post_order.html', context)
            email = EmailMessage((order.myname), message, 'blazer-05@mail.ru', recepients)
            email.content_subtype = 'html'
            email.send()

            cart.clear()
            # Асинхронная отправка сообщения
            #OrderCreated.delay(order.id)
            request.session['order_id'] = order.id

            if order.payment_method == 'walletone':
                return redirect('/order/success/')
            else:
                return redirect('/order/thanks/')

    else:
        form = OrderCreateForm()

    return render(request, 'shop/product/list.html', {'category': category,
                                                      'categories': categories,
                                                      'products': products,
                                                      'cart_product_form': cart_product_form,
                                                      'desc': desc,
                                                      'form': form,
                                                      #'GOOGLE_RECAPTCHA_SITE_KEY': settings.GOOGLE_RECAPTCHA_SITE_KEY,
                                                      })


# Страница товара
def ProductDetail(request, id, slug):
    top_five_products = Product.objects.all().exclude(id=id).order_by()[:10]
    alboms = Albom.objects.filter(product=id)
    product = get_object_or_404(Product, id=id, slug=slug, available=True)
    limits = {'diameter_min': product.diameter_min, 'diameter_max': product.diameter_max}
    initial = {'diameter': product.diameter_default}
    cart_product_form = CartAddProductForm(initial=initial, **limits)
    return  render(request, 'shop/product/detail.html', {'product': product,
                                                         'cart_product_form': cart_product_form,
                                                         'alboms': alboms,
                                                         'top_five_products': top_five_products,
                                                         })

# Главная страница
#@validate_captcha
@transaction.atomic
def index(request, category_slug=None):
    category = None
    categories = Category.objects.all()
    cart_product_form = CartAddProductForm()
    products = Product.objects.filter(available=True).order_by()[0:20]
    v_slider = Video_slider.objects.filter(is_activ=True)
    video = Video_tube.objects.filter(is_active=True)
    if category_slug:
        category = get_object_or_404(Category, slug=category_slug)
        products = products.filter(category=category)
        v_slider = v_slider.filter(is_activ=True)
        video = video.filter(is_active=True)

    if request.method == 'POST':
        cart = Cart(request)
        form = OrderCreateForm(request.POST)
        order_item_form = OrderItemForm(request.POST)
        if form.is_valid() and order_item_form.is_valid():
            order = form.save()
            order_item_form.instance.order = order
            order_item_form.save()

            context = {
                'myname': order.myname,
                'email': order.email,
                'addres': order.addres,
                'postal_code': order.postal_code,
                'order': order,
                'cart': cart,
                'form': form,
                'phone': order.phone,
                'payment_method': order.payment_method,
                'post_delivery': order.post_delivery,
                'post_comments': order.post_comments,
            }

            recepients = ['blazer-05@mail.ru']
            message = render_to_string('orders/mailbox/email_post_order.html', context)
            email = EmailMessage((order.myname), message, 'blazer-05@mail.ru', recepients)
            email.content_subtype = 'html'
            email.send()

            cart.clear()
            # Асинхронная отправка сообщения
            #OrderCreated.delay(order.id)
            request.session['order_id'] = order.id

            if order.payment_method == 'walletone':
                return redirect('/order/success/')
            else:
                return redirect('/order/thanks/')
    else:
        form = OrderCreateForm()
    return render(request, 'shop/index.html', {
        'category': category,
        'categories': categories,
        'products': products,
        'cart_product_form': cart_product_form,
        'v_slider': v_slider,
        'video': video,
        'form': form,
        #'GOOGLE_RECAPTCHA_SITE_KEY': settings.GOOGLE_RECAPTCHA_SITE_KEY,
    })

def video(request):
    video = 'Видео'
    return render(request, 'shop/video.html', {'video': video})

def oplata_dostavka(request):
    oplata_dostavka = 'Оплата и доставка'
    return render(request, 'shop/oplata_dostavka.html', {'oplata_dostavka': oplata_dostavka})

def otzivi(request):
    otzivi = 'Отзывы'
    return render(request, 'shop/otzivi.html', {'otzivi': otzivi})

def faq(request):
    faq = 'Вопрос - ответ'
    return render(request, 'shop/faq.html', {'faq': faq})
