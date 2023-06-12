from contextlib import nullcontext
import os, datetime
from django.views.decorators.http import require_POST
from distutils import extension
from django.shortcuts import render, redirect
from django.template import RequestContext
from django.http import JsonResponse
from django.urls import reverse_lazy
from django.contrib.auth.mixins import LoginRequiredMixin
from django.db.models import Prefetch, Q
from django.core.files.storage import FileSystemStorage
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.views.generic import ListView, DeleteView, CreateView, UpdateView, FormView
from django.http import HttpResponse
import json
from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.db.models import Count
from apps.registrations.models import UserProfile, User
from apps.workshop.models import ExtensionProgram, ExtensionProgram_Files, ExtensionProgram_Member, ExtensionProject, ExtensionProject_Files, ExtensionProject_Member, Category, Workshop, WorkshopFacilitator, WorkshopParticipant, Lesson, LessonActivity, LessonFile, ActivityOutput
from apps.workshop.forms import AddActivityOutput, UpdateActivityOutput

extensionprogram_list = ExtensionProgram.objects.all()
context = {
    'page_title' : 'CCIS Extension Services',
    'extensionprogram_list' : extensionprogram_list,
    'extensionprogram_list_limited' : extensionprogram_list[:3]
}

#Error Handling
def error_404_view(request, exception):

    return render(request, 'workshop/404.html')

#Search Query
def search_query(request):
    if request.method == 'POST':
        searched = request.POST['searched']
        program_list = ExtensionProgram.objects.filter(Q(title__icontains=searched) | Q(description__icontains=searched))
        paginator = Paginator(program_list, 10) 
        page = request.GET.get('page')
        try:
            program_list = paginator.page(page)
        except PageNotAnInteger:
            program_list = paginator.page(1)
        except EmptyPage:
            program_list = paginator.page(paginator.num_pages)
        context['searched'] = searched
        context['program_list'] = program_list
        return render(request, 'workshop/search_result.html', context)
    else:
        return render(request, 'workshop/search_result.html', {})

#Extension Program
def program_list(request):
    extensionprogram_list = ExtensionProgram.objects.all()
    paginator = Paginator(extensionprogram_list, 10) 
    page = request.GET.get('page')
    try:
        extensionprogram_list = paginator.page(page)
    except PageNotAnInteger:
        extensionprogram_list = paginator.page(1)
    except EmptyPage:
        extensionprogram_list = paginator.page(paginator.num_pages)
    context['extensionprogram_list'] = extensionprogram_list
    context['page'] = page

    return render(request,'workshop/program_list.html', context)

def program_detail(request, slug, extensionprogram_id):
    extensionprogram_files = ExtensionProgram_Files.objects.filter(extensionprogram_id = extensionprogram_id)
    programfiles_count= ExtensionProgram_Files.objects.filter(extensionprogram_id = extensionprogram_id).count()
    extensionprogram = ExtensionProgram.objects.get(pk=extensionprogram_id)
    extensionproject = ExtensionProject.objects.filter(extensionprogram_id=extensionprogram_id)
    facilitator_list = ExtensionProgram_Member.objects.filter(extensionprogram_id=extensionprogram_id)
    facilitator_count= ExtensionProgram_Member.objects.filter(extensionprogram_id=extensionprogram_id).count()
    context['extensionprogram_files'] = extensionprogram_files
    context['programfiles_count'] = programfiles_count
    context['extensionprogram'] = extensionprogram
    context['extensionproject'] = extensionproject
    context['facilitator_list'] = facilitator_list
    context['facilitator_count'] = facilitator_count

    return render(request, 'workshop/program_detail.html', context)

#Extension Program Files
@login_required
def program_files_upload(request, extensionprogram_id):

    return render(request, 'workshop/program_adding.html')

#Extension Project
def project_detail(request, slug, extensionproject_id):
    extensionproject = ExtensionProject.objects.get(pk=extensionproject_id)
    extensionproject_files = ExtensionProject_Files.objects.filter(extensionproject_id=extensionproject_id)
    projectfiles_count = ExtensionProject_Files.objects.filter(extensionproject_id = extensionproject_id).count()
    facilitator_list = ExtensionProject_Member.objects.filter(extensionproject_id=extensionproject_id)
    facilitator_count= ExtensionProject_Member.objects.filter(extensionproject_id=extensionproject_id).count()
    context['extensionproject'] = extensionproject
    context['extensionproject_files'] = extensionproject_files
    context['projectfiles_count'] = projectfiles_count
    context['facilitator_list'] = facilitator_list
    context['facilitator_count'] = facilitator_count

    return render(request, 'workshop/project_detail.html', context)

#Workshop
def workshop_list(request):
    category_list = Category.objects.annotate(workshop_count=Count("workshop")).filter(workshop_count__gt=0)
    extensionprogram_list = ExtensionProgram.objects.all()[0:3]
    workshop_count= Workshop.objects.all().count()
    workshop_list = Workshop.objects.all()
    paginator = Paginator(workshop_list, 8) 
    page = request.GET.get('page')
    try:
        workshop_list = paginator.page(page)
    except PageNotAnInteger:
        workshop_list = paginator.page(1)
    except EmptyPage:
        workshop_list = paginator.page(paginator.num_pages)
    context['page_title'] = 'Workshops'
    context['category_list'] = category_list
    context['extensionprogram_list'] = extensionprogram_list
    context['workshop_count'] = workshop_count
    context['workshop_list'] = workshop_list
    context['page'] = page

    return render(request,'workshop/workshop_list.html', context)

def workshop_detail(request, slug ,workshop_id):
    workshop = Workshop.objects.get(slug=slug)
    lesson_list = Lesson.objects.filter(workshop_id=workshop_id).order_by('date_added').values()
    if lesson_list:
        lesson_count = Lesson.objects.filter(workshop_id = workshop_id).count()
        lessonfile_list = LessonFile.objects.filter(lesson__workshop_id=workshop_id).order_by('date_added')
        lessonactivity_list = LessonActivity.objects.filter(lesson__workshop_id=workshop_id).order_by('date_added')
    else:
        lesson_count = 0
        lessonfile_list = None
        lessonactivity_list = None
    
    context['workshop'] = workshop
    context['lesson_count'] = lesson_count
    context['lesson_list'] = lesson_list
    context['lessonfile_list'] = lessonfile_list
    context['lessonactivity_list'] = lessonactivity_list
    context['data'] = RequestContext(request)
    if request.user.is_authenticated:
        workshop_participant = WorkshopParticipant.objects.filter(Q(participant=request.user) & Q(workshop_id=workshop_id))
        context['workshop_participant'] = workshop_participant

        return render(request, 'workshop/workshop_detail.html', context)
    else:
        return render(request, 'workshop/workshop_detail.html', context)
            
#Lesson
@login_required
def lesson_list(request, workshop_id):
    workshop = Workshop.objects.get(pk=workshop_id)
    workshop_participant = WorkshopParticipant.objects.filter(Q(participant=request.user) & Q(workshop_id=workshop_id))
    lesson_list = Lesson.objects.filter(workshop_id = workshop_id)
    if lesson_list:
        lesson_count = Lesson.objects.filter(workshop_id = workshop_id).count()
        lessonfile_list = LessonFile.objects.filter(lesson__workshop_id=workshop_id).order_by('date_added')
        lessonactivity_list = LessonActivity.objects.filter(lesson__workshop_id=workshop_id).order_by('date_added')
    else:
        lesson_count = 0
        lessonfile_list = None
        lessonactivity_list = None
    context['workshop'] = workshop
    context['workshop_participant'] = workshop_participant
    context['lesson_count'] = lesson_count
    context['lesson_list'] = lesson_list
    context['lessonfile_list'] = lessonfile_list
    context['lessonactivity_list'] = lessonactivity_list
    
    return render(request, 'workshop/lesson_list.html', context)

@login_required
def lesson_detail(request, workshop_id, slug, lesson_id):
    workshop = Workshop.objects.get(pk=workshop_id)
    workshop_participant = WorkshopParticipant.objects.filter(Q(participant=request.user) & Q(workshop_id=workshop_id))
    lesson = Lesson.objects.get(slug=slug)
    lesson_list = Lesson.objects.filter(workshop_id = workshop_id).order_by('date_added').values()
    if lesson_list:
        lesson_count = Lesson.objects.filter(workshop_id = workshop_id).count()
        lessonfile_list = LessonFile.objects.filter(lesson__workshop_id=workshop_id).order_by('date_added')
        lessonactivity_list = LessonActivity.objects.filter(lesson__workshop_id=workshop_id).order_by('date_added')
    else:
        lesson_count = 0
        lessonfile_list = None
        lessonactivity_list = None
    context['workshop'] = workshop
    context['workshop_participant'] = workshop_participant
    context['lesson'] = lesson
    context['lesson_count'] = lesson_count
    context['lesson_list'] = lesson_list
    context['lessonfile_list'] = lessonfile_list
    context['lessonactivity_list'] = lessonactivity_list

    return render(request, 'workshop/lesson_detail.html',context)

def update_lesson(request, lesson_id):
    if request.is_ajax() and request.method == 'POST':
        try:
            lesson = Lesson.objects.get(id=lesson_id)
            participant = request.user
            if participant in lesson.participant.all():
                lesson.participant.remove(participant)
                is_checked = False
            else:
                lesson.participant.add(participant)
                is_checked = True
            lesson.save()
            return JsonResponse({'status': 'success', 'is_checked': is_checked})
        except Lesson.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Lesson not found'})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
    return JsonResponse({'status': 'error', 'message': 'Invalid request'})


#Lesson Activty
def handle_uploaded_file(f):  
    with open(settings.MEDIA_ROOT+'/activityoutput_files/'+f.name, 'wb+') as destination:  
        for chunk in f.chunks():  
            destination.write(chunk)  

@login_required
def lessonactivity_detail_p(request, slug, lessonactivity_id):
    lessonactivity = LessonActivity.objects.get(slug=slug)
    workshop_participant = WorkshopParticipant.objects.filter(workshop=lessonactivity.lesson.workshop, participant=request.user)
    context['lessonactivity'] = lessonactivity
    context['workshop_participant'] = workshop_participant
    try:
        activityoutput = ActivityOutput.objects.get(lessonactivity_id=lessonactivity_id)
        context['activityoutput'] = activityoutput
        return render(request, 'workshop/lessonactivity_detail_p.html',context)
    except ActivityOutput.DoesNotExist:
        return render(request, 'workshop/lessonactivity_detail_p.html',context)

@login_required
def lessonactivity_detail_f(request, slug, lessonactivity_id):
    lessonactivity = LessonActivity.objects.get(slug=slug)
    activityoutput_count = ActivityOutput.objects.filter(lessonactivity_id=lessonactivity_id).count()
    context['lessonactivity'] = lessonactivity
    context['activityoutput_count'] = activityoutput_count
    return render(request, 'workshop/lessonactivity_detail_f.html',context)


#Activity Output
@login_required
def submit_activityoutput(request, lessonactivity_id):
    lessonactivity = LessonActivity.objects.get(pk=lessonactivity_id)
    lesson = LessonActivity.objects.filter(lesson=lessonactivity.lesson).values_list('lesson')
    workshop = Lesson.objects.values_list('workshop')
    workshop_participant = WorkshopParticipant.objects.get(workshop=lessonactivity.lesson.workshop, participant=request.user)
    if request.method == "POST":

        print(request.POST['title'])
        form = AddActivityOutput(participant=request.user, lesson=lessonactivity.lesson, data=request.POST)
        if form.is_valid():
            activityoutput = form.save(commit=False)
            activityoutput.file = request.FILES['file']
            activityoutput.participant = workshop_participant
            activityoutput.lessonactivity = lessonactivity
            activityoutput.time_submitted = datetime.date.today()
            activityoutput.date_added = datetime.date.today()

            pre_output = ActivityOutput.objects.filter(lessonactivity__id=lessonactivity_id, participant=activityoutput.participant).all()
            pre_output.delete()
            activityoutput.save()

            return redirect('my-workshops')

    else:
        form = AddActivityOutput(participant=request.user, lesson=lessonactivity.lesson)
        
        return render(request, 'workshop/submit_output.html', {'form': form, 'lesson':lessonactivity.lesson, 'lessonactivity':lessonactivity, 'workshop_participant':workshop_participant, 'workshop':workshop})

class UpdateInfoView(UpdateView):
    model = ActivityOutput
    form_class = UpdateActivityOutput
    template_name = 'workshop/update_output.html'
    success_url = reverse_lazy('my-workshops')

@login_required
def update_activityoutput(request, lessonactivity_id):
    workshop_participant = WorkshopParticipant.objects.get(participant=request.user)
    lessonactivity = LessonActivity.objects.get(pk=lessonactivity_id)
    activityouput = ActivityOutput.objects.get(lessonactivity__id=lessonactivity_id, participant=workshop_participant)

    if request.method == "POST":
        print(request.POST['title'])
        form = AddActivityOutput(participant=request.user, lesson=lessonactivity.lesson, data=request.POST)
        if form.is_valid():
            activityoutput = form.save(commit=False)
            activityoutput.time_submitted = datetime.date.today()
            activityoutput.date_added = datetime.date.today()

            pre_output = ActivityOutput.objects.filter(lessonactivity__id=lessonactivity_id, participant=activityoutput.participant).all()
            pre_output.delete()
            activityoutput.save()

            return redirect('my-workshops')

    else:
        form = AddActivityOutput(participant=request.user, lesson=lessonactivity.lesson)

    return render(request, 'workshop/update_output.html', {'form': form, 'activityoutput':activityouput, 'lesson':lessonactivity.lesson, 'lessonactivity':lessonactivity, 'workshop_participant':workshop_participant, 'workshop':workshop})

#Dashboard
@login_required
def dashboard_p(request):
    participant = WorkshopParticipant.objects.filter(participant=request.user)
    workshop_list = Workshop.objects.all()
    context['workshop_list'] = workshop_list
    context['participant'] = participant

    return render(request, 'workshop/dashboard_p.html',context)
