from django.contrib import admin
from django.urls import path, include, re_path

from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('apps.base.urls')),
    path('', include('apps.blog.urls')),
    path('', include('apps.registrations.urls')),
    path('', include('apps.workshop.urls')),
    re_path(r'^accounts/', include('users.urls')),
] 
urlpatterns += static(settings.MEDIA_URL,
                              document_root=settings.MEDIA_ROOT)

handler404 = 'apps.workshop.views.error_404_view'