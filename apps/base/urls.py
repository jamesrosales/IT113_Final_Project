from . import views
from django.contrib import admin
from django.urls import path
from django.contrib.auth import views as auth_views
from django.views.generic.base import RedirectView

urlpatterns = [
    path('', views.index, name="home-page"),
    path('about', views.about, name="about-us"),
    path('contact', views.contact, name="contact-us"),
]
