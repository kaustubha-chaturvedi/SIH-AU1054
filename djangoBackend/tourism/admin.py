from django.contrib import admin

from tourism.models import *

@admin.register(Location)
class LocationAdmin(admin.ModelAdmin):
    list_display = ["location"] 

@admin.register(Famous)
class FamousAdmin(admin.ModelAdmin):
    list_display = ["item",'location']