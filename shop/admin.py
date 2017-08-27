# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib import admin
from shop.models import Category, Product, Description, Albom

# Функции фильтрации для массовой публикации/снятия с публикации новостей.
def all_post(modeladmin, reguest, queryset):
    for qs in queryset:
        print(qs.title)

def complete_post(modeladmin, reguest, queryset):
    queryset.update(available=True)
complete_post.short_description = 'Опубликовать товар'

def incomplete_post(modeladmin, reguest, queryset):
    queryset.update(available=False)
incomplete_post.short_description = 'Снять с публикации товар'
# Конец Функции фильтрации

class AlbomInLine(admin.TabularInline):
    model = Albom
    extra = 1

class CategoryAdmin(admin.ModelAdmin):
    list_display = ['name', 'slug', 'available']
    list_editable = ['available']
    prepopulated_fields = {'slug': ('name', )}

class ProductAdmin(admin.ModelAdmin):
    date_hierarchy = 'created'
    list_display = ['name', 'image_img', 'slug', 'price', 'discount', 'stock', 'netto', 'massa', 'available', 'new', 'vip', 'created', 'updated']
    list_filter = ['available', 'created', 'updated']
    list_editable = ['price', 'discount', 'stock', 'netto', 'massa', 'available', 'new', 'vip',]
    prepopulated_fields = {'slug': ('name',)}
    search_fields = ['name']
    list_per_page = 10  # Вывод количества новостей в админке
    actions = [complete_post, incomplete_post]
    inlines = [AlbomInLine]

class AlbomAdmin(admin.ModelAdmin):
    list_display = ['name', 'image_img']

admin.site.register(Category, CategoryAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(Description)
admin.site.register(Albom, AlbomAdmin)



