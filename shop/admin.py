# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib import admin
from django_summernote.admin import SummernoteModelAdmin
from shop.models import Category, Product, Description, Albom
from django.utils.safestring import mark_safe

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

@admin.register(Product)
class ProductAdmin(SummernoteModelAdmin):
    date_hierarchy = 'created'
    list_display = ['name', 'image_img', 'slug', 'price', 'discount', 'stock', 'netto', 'massa', 'available', 'pod_zakaz', 'new', 'vip', 'akciya', 'timer', 'created', 'updated']
    readonly_fields = ["headshot_image"]
    list_filter = ['available', 'created', 'updated']
    list_editable = ['price', 'discount', 'stock', 'netto', 'massa', 'available', 'pod_zakaz', 'new', 'vip', 'akciya', 'timer',]
    prepopulated_fields = {'slug': ('name',)}
    search_fields = ['name']
    list_per_page = 10  # Вывод количества новостей в админке
    actions = [complete_post, incomplete_post]
    inlines = [AlbomInLine]

    def headshot_image(self, obj):# Вывод в карточке изображений
        return mark_safe('<img src="{url}" width="150" height="150" />'.format(
            url = obj.image.url,
            width=obj.image.width,
            height=obj.image.height,
            )
    )


@admin.register(Albom)
class AlbomAdmin(admin.ModelAdmin):
    list_display = ['name', 'image_img', 'images']
    readonly_fields = ["headshot_image"]

    def headshot_image(self, obj):# Вывод в карточке изображений
        return mark_safe('<img src="{url}" width="150" height="150" />'.format(
            url = obj.images.url,
            width=obj.images.width,
            height=obj.images.height,
            )
    )

admin.site.register(Category, CategoryAdmin)
#admin.site.register(Product, ProductAdmin)
admin.site.register(Description)
#admin.site.register(Albom, AlbomAdmin)



