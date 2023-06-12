from django.db.models import Prefetch, Q
from django.db.models import Count
from apps.workshop.models import ExtensionProgram, ExtensionProgram_Files, ExtensionProgram_Member, ExtensionProject, ExtensionProject_Files, ExtensionProject_Member, Category, Workshop, WorkshopFacilitator, WorkshopParticipant, Lesson, LessonActivity, LessonFile, ActivityOutput

def workshop_list_renderer(request):
    return {
        'workshop_list': Workshop.objects.all(),
    }

def workshop_facilitator_list_renderer(request):
    return {
        'workshopfacilitator_list': WorkshopFacilitator.objects.all()
    }

def workshop_participant_renderer(request):
    return {
        'workshopparticipant_list': WorkshopParticipant.objects.all(),
    }
    
def lesson_list_renderer(request):
    return {
        'lesson_list': Lesson.objects.all(),        
    }

def lessonfile_list_renderer(request):
    return {
        'lessonfile_list': LessonActivity.objects.annotate(lessonactivity_count=Count("id")).filter(lessonactivity_count__gt=0)
    }

def activity_output_list_renderer(request):
    return {
        'activityoutput_list': ActivityOutput.objects.all()
    }
    