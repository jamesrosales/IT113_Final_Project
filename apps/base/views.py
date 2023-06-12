from unicodedata import category
from aiohttp import request
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.urls import reverse
from django.contrib.auth import authenticate, login, logout, update_session_auth_hash
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required
import json
from datetime import datetime
from django.contrib import messages
from django.db.models import Count
from django.db.models import Q
from extensionsys.settings import MEDIA_ROOT, MEDIA_URL

from apps.registrations.models import UserProfile, User
from apps.workshop.models import ExtensionProgram, ExtensionProgram_Files, ExtensionProgram_Member, ExtensionProject, ExtensionProject_Files, ExtensionProject_Member, Category, Workshop, WorkshopFacilitator, WorkshopParticipant, Lesson, LessonActivity, LessonFile, ActivityOutput

extensionprogram_list = ExtensionProgram.objects.all()
context = {
    'page_title' : 'Simple Blog Site',
    'extensionprogram_list' : extensionprogram_list,
    'extensionprogram_list_limited' : extensionprogram_list[:3]
}


#Home
def index(request):
    extensionprogram_list = ExtensionProgram.objects.all()[0:3]
    extensionproject_list = ExtensionProject.objects.all()[0:3]
    workshop_list = Workshop.objects.all()[0:3]
    workshop_count= Workshop.objects.all().count()
    workshopfacilitator_list = WorkshopFacilitator.objects.all()
    category_list = Category.objects.all()[0:4]
    context['extensionprogram_list'] = extensionprogram_list
    context['extensionproject_list'] = extensionproject_list
    context['workshop_list'] = workshop_list
    context['workshop_count'] = workshop_count
    context['workshopfacilitator_list'] = workshopfacilitator_list
    context['category_list'] = category_list

    return render(request,'base/index.html', context)

#About
def about(request):
    extensionprogram_list = ExtensionProgram.objects.all()[0:4]
    extensionprogram_count= ExtensionProgram.objects.all().count()
    facilitator_list = User.objects.filter(is_facilitator=True)
    facilitator_count= User.objects.filter(is_facilitator=True).count()
    context['extensionprogram_list'] = extensionprogram_list
    context['extensionprogram_count'] = extensionprogram_count
    context['facilitator_list'] = facilitator_list
    context['facilitator_count'] = facilitator_count

    return render(request,'base/about.html', context)

#Contact
def contact(request):

    return render(request,'base/contact.html', context)