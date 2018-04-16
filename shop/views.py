# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.conf import settings

from django.core.mail import EmailMessage
from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, redirect
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.template.loader import render_to_string

from cart.cart import Cart
from orders.forms import OrderCreateForm
from orders.models import OrderItem

from shop.models import Category, Product, Description, Albom
from cart.forms import CartAddProductForm
from vidos.models import Video_slider, Video_tube

from g_recaptcha.validate_recaptcha import validate_captcha

# Выводим товары

# Страница с товарами - каталог
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

    return render(request, 'shop/product/list.html', {'category': category,
                                                      'categories': categories,
                                                      'products': products,
                                                      'cart_product_form': cart_product_form,
                                                      'desc': desc,})


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
@validate_captcha
def index(request, category_slug=None):
    category = None
    categories = Category.objects.all()
    cart_product_form = CartAddProductForm()
    products = Product.objects.filter(available=True)
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
        if form.is_valid():
            myname = form.cleaned_data['myname']
            email = form.cleaned_data['email']
            phone = form.cleaned_data['phone']
            addres = form.cleaned_data['addres']
            postal_code = form.cleaned_data['postal_code']
            payment_method = form.cleaned_data['payment_method']
            post_delivery = form.changed_data['post_delivery']
            post_comments = form.changed_data['post_comments']
            recepients = ['blazer-05@mail.ru']
            order = form.save()
            for item in cart:
                OrderItem.objects.create(order=order, product=item['product'],
                                         price=item['price'],
                                         quantity=item['quantity'],
                                         diameter=item['diameter'],
                                         )
            context = {
                'myname': myname,
                'email': email,
                'addres': addres,
                'postal_code': postal_code,
                'order': order,
                'cart': cart,
                'form': form,
                'phone': phone,
                'payment_method': payment_method,
                'post_delivery': post_delivery,
                'post_comments': post_comments,
            }

            message = render_to_string('orders/mailbox/email_post_order.html', context)
            email = EmailMessage((myname), message, 'blazer-05@mail.ru', recepients)
            email.content_subtype = 'html'
            email.send()

            cart.clear()
            # Асинхронная отправка сообщения
            #OrderCreated.delay(order.id)
            request.session['order_id'] = order.id
            return redirect('/order/success/')
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
        'GOOGLE_RECAPTCHA_SITE_KEY': settings.GOOGLE_RECAPTCHA_SITE_KEY,
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
