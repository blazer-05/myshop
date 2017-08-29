# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.conf import settings
from django.core.mail import EmailMessage
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.admin.views.decorators import staff_member_required
from django.shortcuts import render, redirect, get_object_or_404
from django.core.urlresolvers import reverse
from django.template.loader import render_to_string

from interkassa_merchant.forms import PaymentRequestForm
from .models import OrderItem, Order, MailBox
from .forms import OrderCreateForm, ContactForm
from cart.cart import Cart
from .tasks import OrderCreated
from interkassa_merchant.models import *
# import weasyprint


def OrderCreate(request):
    cart = Cart(request)
    if request.method == 'POST':
        form = OrderCreateForm(request.POST)
        if form.is_valid():
            first_name = form.cleaned_data['first_name']
            last_name = form.cleaned_data['last_name']
            email = form.cleaned_data['email']
            addres = form.cleaned_data['addres']
            postal_code = form.cleaned_data['postal_code']
            recepients = ['blazer-05@mail.ru']
            payment_method = form.cleaned_data['payment_method']
            order = form.save()
            for item in cart:
                OrderItem.objects.create(order=order, product=item['product'],
                                         price=item['price'],
                                         quantity=item['quantity'],
                                         )
            context = {
                'first_name': first_name,
                'last_name': last_name,
                'email': email,
                'addres': addres,
                'postal_code': postal_code,
                'order': order,
                'cart': cart,
                'form': form,
                'payment_method': payment_method,
            }

            message = render_to_string('orders/mailbox/email-2.html', context)
            email = EmailMessage('Поступил новый заказ на конус   odrova.ru ! ', message, 'blazer-05@mail.ru', recepients)
            email.content_subtype = 'html'
            email.send()

            cart.clear()
            # Асинхронная отправка сообщения
            OrderCreated.delay(order.id)
            request.session['order_id'] = order.id
            return redirect('/order/success/')
            # return render(request, 'orders/order/created.html', {'order': order,
            #                                                      'cart': cart,
            #                                                      'form': form,})
    form = OrderCreateForm()
    return render(request, 'orders/order/create.html', {'cart': cart,
                                                        'form': form,})

@staff_member_required
def AdminOrderDetail(request, order_id):
    order = get_object_or_404(Order, id=order_id)
    return render(request, 'admin/orders/order/detail.html', {'order': order})

# @staff_member_required
# def AdminOrderPDF(request, order_id):
#     order = get_object_or_404(Order, id=order_id)
#     html = render_to_string('orders/order/pdf.html', {'order': order})
#     response = HttpResponse(content_type='application/pdf')
#     response['Content-Disposition'] = 'filename=order_{}.pdf'.format(order.id)
#     weasyprint.HTML(string=html).write_pdf(response,
#                stylesheets=[weasyprint.CSS(settings.STATIC_ROOT + 'css/bootstrap.min.css')])
#     return response

# Функция формы обратной связи
def contact(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        # Если форма заполнена корректно, сохраняем все введённые пользователем значения
        if form.is_valid():
            subject = form.cleaned_data['subject']
            sender = form.cleaned_data['sender']
            phone = form.cleaned_data['phone']
            diament = form.cleaned_data['diament']
            adress = form.cleaned_data['adress']
            description = form.cleaned_data['description']
            recepients = ['blazer-05@mail.ru']
            # Положим копию письма в базу данных
            base = MailBox.objects.create(subject=subject,
                                          sender=sender,
                                          phone=phone,
                                          diament=diament,
                                          adress=adress,
                                          description=description,
                                    )
            # Выводим в шаблон
            context = {'subject': subject,
                       'sender': sender,
                       'phone': phone,
                       'diament': diament,
                       'adress': adress,
                       'description': description,
                       'base': base,
                       }
            message = render_to_string('orders/mailbox/email.html', context)
            email = EmailMessage('Поступил новый заказ на конус   odrova.ru ! ', message, 'blazer-05@mail.ru', recepients)
            email.content_subtype = 'html'
            email.send()
            # Переходим на другую страницу, если сообщение отправлено
            return HttpResponseRedirect('/order/thanks/')

    else:
        form = ContactForm()
    # Выводим форму в шаблон
    return render(request, 'shop/index.html', {'form': form})

# Функция формы обратной связи - релирект на страницу /thanks/
def thanks(request):
    thanks = 'thanks'
    return render(request, 'orders/mailbox/thanks.html', {'thanks': thanks})

def kassa(request):
    order = Order.objects.get(id=request.session['order_id'])
    if order.payment_method == 'interkassa':
        amount = sum([item.price * item.quantity for item in order.Items.all()])
        defaults = {
            'user': request.user,
            'payment_info': 'Заказ номер %s' % order.id,
            'amount': amount
        }
        inv = Invoice.objects.get_or_create(payment_no=order.id, defaults=defaults)
        initial = dict(ik_co_id=settings.INTERKASSA_ID, ik_pm_no=inv.payment_no, ik_am=inv.amount, ik_desc=inv.payment_info)
        form = PaymentRequestForm(initial=initial)
    else:
        form = None
    return render(request, 'orders/order/created.html', {'order': order, 'form': form})

'''

def OrderCreate(request):
    cart = Cart(request)
    if request.method == 'POST':
        form = OrderCreateForm(request.POST)
        if form.is_valid():
            order = form.save()
            for item in cart:
                OrderItem.objects.create(order=order, product=item['product'],
                                         price=item['price'],
                                         quantity=item['quantity'],)

            cart.clear()
            # Асинхронная отправка сообщения
            OrderCreated.delay(order.id)
            request.session['order_id'] = order.id
            return redirect(reverse('payment:process'))

    form = OrderCreateForm()
    return render(request, 'orders/order/create.html', {'cart': cart,
                                                        'form': form})


def OrderCreate(request):
    cart = Cart(request)
    if request.method == 'POST':
        form = OrderCreateForm(request.POST)
        if form.is_valid():
            first_name = form.cleaned_data['first_name']
            last_name = form.cleaned_data['last_name']
            email = form.cleaned_data['email']
            addres = form.cleaned_data['addres']
            postal_code = form.cleaned_data['first_name']
            city = form.cleaned_data['city']
            order = form.save()
            for item in cart:
                OrderItem.objects.create(order=order, product=item['product'],
                                         price=item['price'],
                                         quantity=item['quantity'],
                                         first_name = first_name,
                                         last_name = last_name,
                                         email = email,
                                         addres = addres,
                                         postal_code = postal_code,
                                         city = city,
                                         )
            context = {
                'first_name': first_name,
                'last_name': last_name,
                'email': email,
                'addres': addres,
                'postal_code': postal_code,
                'city': city,
            }

            cart.clear()
            # Асинхронная отправка сообщения
            OrderCreated.delay(order.id)
            request.session['order_id'] = order.id
            return redirect(reverse('payment:process'))

    form = OrderCreateForm()
    return render(request, 'orders/order/create.html', {'cart': cart,
                                                        'form': form,})

'''