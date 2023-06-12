from . import views
from django.contrib import admin
from django.urls import path
from django.contrib.auth import views as auth_views
from django.views.generic.base import RedirectView

urlpatterns = [
    path('login',auth_views.LoginView.as_view(template_name="registrations/login.html",redirect_authenticated_user = True),name='login'),
    path('userlogin', views.login_user, name="login-user"),  
    path('logout',views.logoutuser, name='logout'),
    path('profile',views.profile,name='profile'),
    path('update-profile',views.update_profile,name='update-profile'),
    path('update-avatar',views.update_avatar,name='update-avatar'),
    path('update-password',views.update_password,name='update-password')
]