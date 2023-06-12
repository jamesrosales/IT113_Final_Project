from . import views
from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views
from django.views.generic.base import RedirectView
from django_downloadview import ObjectDownloadView
from .views import UpdateInfoView
from .models import ExtensionProgram, ExtensionProgram_Files, ExtensionProgram_Member, ExtensionProject, ExtensionProject_Files, ExtensionProject_Member, Category, Workshop, WorkshopParticipant, Lesson, LessonActivity, LessonFile, ActivityOutput
lessonfile_download = ObjectDownloadView.as_view(model=LessonFile, file_field='file')

urlpatterns = [
    path('program_list', views.program_list, name="program-list"),
    path('extensionprogram/<slug:slug>-<extensionprogram_id>', views.program_detail, name='program-detail'),

    path('extensionproject/<slug:slug>-<extensionproject_id>', views.project_detail, name='project-detail'),

    path('workshop', views.workshop_list, name="workshop-list"),
    path('workshop/<slug:slug>-<workshop_id>', views.workshop_detail, name='workshop-detail'),

    path('lesson/<lesson_id>/update/', views.update_lesson, name='update-lesson'),
    path('lesson/<workshop_id>/<slug:slug>-<lesson_id>', views.lesson_detail,name='lesson-detail'), 
    
    path('lessonactivityp/<slug:slug>-<lessonactivity_id>', views.lessonactivity_detail_p,name='lessonactivity-detail-p'),
    path('lessonactivityf/<slug:slug>-<lessonactivity_id>', views.lessonactivity_detail_f,name='lessonactivity-detail-f'),
    path('submit_activityoutput/<lessonactivity_id>', views.submit_activityoutput,name="submit-activityoutput"),
    path('update_activityoutput/<int:pk>', UpdateInfoView.as_view(),name="update-activityoutput"),
   
    path('my-workshops', views.dashboard_p,name='my-workshops'),

    path('search', views.search_query, name='search-query'),
    path('', lessonfile_download, name=''),
]
urlpatterns += static(settings.MEDIA_URL,
                              document_root=settings.MEDIA_ROOT)


