from django.urls import path, include
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('blog_list/', views.blog_list, name='blog-list'),
    path('blog/<blog_id>', views.blog_details, name='blog-details'),
    
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
