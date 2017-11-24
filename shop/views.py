# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render, get_object_or_404
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from shop.models import Category, Product, Description, Albom
from cart.forms import CartAddProductForm
from vidos.models import Video_slider

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

    paginator = Paginator(products, 3)
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
def index(request, category_slug=None):
    category = None
    categories = Category.objects.all()
    cart_product_form = CartAddProductForm()
    products = Product.objects.filter(available=True)
    v_slider = Video_slider.objects.filter(is_activ=True)
    if category_slug:
        category = get_object_or_404(Category, slug=category_slug)
        products = products.filter(category=category)
        v_slider = v_slider.filter(is_activ=True)
    return render(request, 'shop/index.html', {
        'category': category,
        'categories': categories,
        'products': products,
        'cart_product_form': cart_product_form,
        'v_slider': v_slider,
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
