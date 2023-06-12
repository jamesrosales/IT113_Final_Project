from distutils import extension
from multiprocessing.sharedctypes import Value
import os, datetime
from urllib import request
from django.template.defaultfilters import slugify
from django.contrib import admin
from multiprocessing.spawn import old_main_modules
from statistics import mode
from unicodedata import category
from django.db import models
from django.db.models.functions import Concat
from django.db.models import Value, CharField
from apps.registrations.models import  UserProfile, User
from django.dispatch import receiver
from django.db.models.signals import post_save
from django.utils import timezone
from django.dispatch import receiver
from ckeditor.fields import RichTextField
from django.conf import settings
from django.urls import reverse

# Create your models here.

class ExtensionProgram(models.Model):
    added_by = models.ForeignKey(settings.AUTH_USER_MODEL,null=True, blank=True, on_delete=models.SET_NULL, limit_choices_to = {'is_facilitator': True}, related_name = 'program_author')
    co_facilitator = models.ManyToManyField(settings.AUTH_USER_MODEL, blank=True, limit_choices_to = {'is_facilitator': True})
    title = models.CharField(max_length=250)
    slug = models.SlugField() 
    shortdescription = models.CharField(max_length=250, blank=True, null=True)
    description = RichTextField(blank=True, null=True)
    image = models.ImageField(blank=True, null=True,upload_to='extensionprogram_coverimages/')
    duration = models.DurationField(blank=True, null = True)
    date_added = models.DateTimeField(default=timezone.now)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.title)

    class Meta:
        verbose_name = 'Extension Program'
        verbose_name_plural = 'Extension Programs'
        ordering = ('-date_updated',)

    def save_model(self, request, obj, form, change):
        if getattr(obj, 'added_by', None) is None:
            obj.added_by = request.user
        obj.save()

    def get_absolute_url(self):
        return reverse("program_detail", kwargs={"slug": self.slug})
    
    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        return super().save(*args, **kwargs)

class ExtensionProgram_Files(models.Model):
    added_by = models.ForeignKey(settings.AUTH_USER_MODEL,null=True, blank=True, on_delete=models.SET_NULL, limit_choices_to = {'is_facilitator': True}, related_name = 'programfiles_author')
    co_facilitator = models.ManyToManyField(settings.AUTH_USER_MODEL, blank=True, limit_choices_to = {'is_facilitator': True})
    title = models.CharField(max_length=250)
    file = models.FileField(blank=True, null=True, upload_to='extensionprogram_files/')
    image = models.ImageField(blank=True, null=True,upload_to='extensionprogram_images/')
    extensionprogram = models.ForeignKey(ExtensionProgram, null=True, on_delete=models.SET_NULL)
    date_added = models.DateTimeField(default=timezone.now)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.title)

    class Meta:
        verbose_name = 'Extension Program Files'
        verbose_name_plural = 'Extension Program Files'
        ordering = ('-date_updated',)

    def save_model(self, request, obj, form, change):
        obj.added_by = request.user
        super().save_model(request, obj, form, change)

class ExtensionProgram_Member(models.Model):
    added_by = models.ForeignKey(settings.AUTH_USER_MODEL,null=True, blank=True, on_delete=models.SET_NULL, limit_choices_to = {'is_facilitator': True}, related_name = 'programmember_author')
    co_facilitator = models.ManyToManyField(settings.AUTH_USER_MODEL, blank=True, limit_choices_to = {'is_facilitator': True})
    is_leader = models.BooleanField(default=False)
    member = models.ForeignKey(User, null=True, on_delete=models.CASCADE, limit_choices_to = {'is_facilitator': True}, related_name="program_member")
    extensionprogram = models.ForeignKey(ExtensionProgram, null=True, on_delete=models.SET_NULL)
    date_added = models.DateTimeField(default=timezone.now)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.member.first_name) + ' ' + str(self.member.last_name)
        
    class Meta:
        verbose_name = 'Extension Program Member'
        verbose_name_plural = 'Extension Program Members'
        ordering = ('-date_updated',)

    def save_model(self, request, obj, form, change):
        obj.added_by = request.user
        super().save_model(request, obj, form, change)

class ExtensionProject(models.Model):
    added_by = models.ForeignKey(settings.AUTH_USER_MODEL,null=True, blank=True, on_delete=models.SET_NULL, limit_choices_to = {'is_facilitator': True}, related_name = 'project_author')
    co_facilitator = models.ManyToManyField(settings.AUTH_USER_MODEL, blank=True, limit_choices_to = {'is_facilitator': True})
    title = models.CharField(max_length=250, blank=True, null=True)
    slug = models.SlugField() 
    shortdescription = models.CharField(max_length=250, blank=True, null=True)
    description = RichTextField(blank=True, null=True)
    image = models.ImageField(blank=True, null=True,upload_to='extensionproject_coverimages/')
    extensionprogram = models.ForeignKey(ExtensionProgram, null=True, on_delete=models.SET_NULL)
    date_added = models.DateTimeField(default=timezone.now)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.title)

    class Meta:
        verbose_name = 'Extension Projects'
        verbose_name_plural = 'Extension Projects'
        ordering = ('-date_updated',)

    def save_model(self, request, obj, form, change):
        obj.added_by = request.user
        super().save_model(request, obj, form, change)

    def get_absolute_url(self):
        return reverse("project_detail", kwargs={"slug": self.slug})
    
    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        return super().save(*args, **kwargs)

class ExtensionProject_Files(models.Model):
    added_by = models.ForeignKey(settings.AUTH_USER_MODEL,null=True, blank=True, on_delete=models.SET_NULL, limit_choices_to = {'is_facilitator': True}, related_name = 'projectfiles_author')
    co_facilitator = models.ManyToManyField(settings.AUTH_USER_MODEL, blank=True, limit_choices_to = {'is_facilitator': True})
    title = models.CharField(max_length=250)
    file = models.FileField(blank=True, null=True, upload_to='extensionproject_files/')
    image = models.ImageField(blank=True, null=True,upload_to='extensionproject_images/')
    extensionproject = models.ForeignKey(ExtensionProject, null=True, on_delete=models.SET_NULL)
    date_added = models.DateTimeField(default=timezone.now)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):  
        return str(self.title)

    class Meta:
        verbose_name = 'Extension Project Files'
        verbose_name_plural = 'Extension Project Files'
        ordering = ('-date_updated',)

    def save_model(self, request, obj, form, change):
        obj.added_by = request.user
        super().save_model(request, obj, form, change)

class ExtensionProject_Member(models.Model):
    added_by = models.ForeignKey(settings.AUTH_USER_MODEL,null=True, blank=True, on_delete=models.SET_NULL, limit_choices_to = {'is_facilitator': True}, related_name = 'projectmember_author')
    co_facilitator = models.ManyToManyField(settings.AUTH_USER_MODEL, blank=True, limit_choices_to = {'is_facilitator': True})
    is_leader = models.BooleanField(default=False)
    member = models.ForeignKey(ExtensionProgram_Member, null=True, on_delete=models.CASCADE, limit_choices_to = {'is_leader': False}, related_name='project_member')
    extensionproject = models.ForeignKey(ExtensionProject, null=True, on_delete=models.SET_NULL)
    date_added = models.DateTimeField(default=timezone.now)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.member.member.first_name) + ' ' + str(self.member.member.last_name)

    class Meta:
        verbose_name = 'Extension Project Member'
        verbose_name_plural = 'Extension Project Members'
        ordering = ('-date_updated',)

    def save_model(self, request, obj, form, change):
        obj.added_by = request.user
        super().save_model(request, obj, form, change)

class Category(models.Model):
    name = models.CharField(max_length=250, blank=True, null=True)
    description = RichTextField(blank=True, null=True)

    def __str__(self):
        return str(self.name)

    class Meta:
        verbose_name = 'Category'
        verbose_name_plural = 'Categories'

class Workshop(models.Model):
    added_by = models.ForeignKey(settings.AUTH_USER_MODEL,null=True, blank=True, on_delete=models.SET_NULL, limit_choices_to = {'is_facilitator': True}, related_name = 'workshop_author')
    co_facilitator = models.ManyToManyField(settings.AUTH_USER_MODEL, blank=True, limit_choices_to = {'is_facilitator': True})
    title = models.CharField(max_length=250, blank=True, null=True)
    slug = models.SlugField() 
    shortdescription = models.CharField(max_length=250, blank=True, null=True)
    description = RichTextField(blank=True, null=True)
    image = models.ImageField(blank=True, null=True,upload_to='workshop_coverimages/')
    duration = models.DurationField(blank=True, null = True)
    extensionproject = models.ForeignKey(ExtensionProject, null=True, on_delete=models.SET_NULL)
    category = models.ManyToManyField(Category, blank=True)
    date_added = models.DateTimeField(default=timezone.now)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.title)

    class Meta:
        verbose_name = 'Workshop'
        verbose_name_plural = 'Workshops'
        ordering = ('-date_updated',)

    def save_model(self, request, obj, form, change):
        obj.added_by = request.user
        super().save_model(request, obj, form, change)

    def get_absolute_url(self):
        return reverse("workshop-detail", kwargs={"slug": self.slug})
    
    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        return super().save(*args, **kwargs)

class WorkshopFacilitator(models.Model):
    added_by = models.ForeignKey(settings.AUTH_USER_MODEL,null=True, blank=True, on_delete=models.SET_NULL, limit_choices_to = {'is_facilitator': True}, related_name = 'workshopfacilitator_author')
    co_facilitator = models.ManyToManyField(settings.AUTH_USER_MODEL, blank=True, limit_choices_to = {'is_facilitator': True})
    is_active = models.BooleanField(default=False)
    workshop = models.ForeignKey(Workshop, null=True, on_delete=models.SET_NULL)
    facilitator = models.ForeignKey(ExtensionProject_Member, null=True, on_delete=models.SET_NULL, limit_choices_to = {'is_leader': False}, related_name='workshop_facilitator')
    date_added = models.DateTimeField(default=timezone.now)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.facilitator.member.member.first_name) + ' ' + str(self.facilitator.member.member.last_name)

    class Meta:
        verbose_name = 'Workshop Facilitator'
        verbose_name_plural = 'Workshop Facilitators'
        ordering = ('-date_updated',)

    def save_model(self, request, obj, form, change):
        obj.added_by = request.user
        super().save_model(request, obj, form, change)


class WorkshopParticipant(models.Model):
    added_by = models.ForeignKey(settings.AUTH_USER_MODEL,null=True, blank=True, on_delete=models.SET_NULL, limit_choices_to = {'is_facilitator': True}, related_name = 'workshopparticipant_author')
    co_facilitator = models.ManyToManyField(settings.AUTH_USER_MODEL, blank=True, limit_choices_to = {'is_facilitator': True})
    is_active = models.BooleanField(default=False)
    is_finished = models.BooleanField(default=False)
    workshop = models.ForeignKey(Workshop, null=True, on_delete=models.SET_NULL)
    participant = models.ForeignKey(User, null=True, on_delete=models.CASCADE, limit_choices_to = {'is_participant': True}, related_name="participant")
    date_added = models.DateTimeField(default=timezone.now)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.participant.first_name) + ' ' + str(self.participant.last_name)

    class Meta:
        verbose_name = 'Workshop Partcipant'
        verbose_name_plural = 'Workshop Participants'
        ordering = ('-date_updated',)

    def save_model(self, request, obj, form, change):
        obj.added_by = request.user
        super().save_model(request, obj, form, change)

class Lesson(models.Model):
    added_by = models.ForeignKey(settings.AUTH_USER_MODEL,null=True, blank=True, on_delete=models.SET_NULL, limit_choices_to = {'is_facilitator': True}, related_name = 'lesson_author')
    co_facilitator = models.ManyToManyField(settings.AUTH_USER_MODEL, blank=True, limit_choices_to = {'is_facilitator': True})
    title = models.CharField(max_length=250, blank=True, null=True)
    slug = models.SlugField() 
    description = RichTextField(blank=True, null=True, )
    duration = models.DurationField(blank=True, null = True)
    workshop = models.ForeignKey(Workshop, null=True, on_delete=models.SET_NULL)
    participant = models.ManyToManyField(WorkshopParticipant, blank=True)
    is_open = models.BooleanField(default=False)
    date_added = models.DateTimeField(default=timezone.now)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.title)

    class Meta:
        verbose_name = 'Lesson'
        verbose_name_plural = 'Lessons'
        ordering = ('-date_updated',)

    def save_model(self, request, obj, form, change):
        obj.added_by = request.user
        super().save_model(request, obj, form, change)

    def get_absolute_url(self):
        return reverse("lesson_detail", kwargs={"slug": self.slug})
    
    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        return super().save(*args, **kwargs)

class LessonFile(models.Model):
    added_by = models.ForeignKey(settings.AUTH_USER_MODEL,null=True, blank=True, on_delete=models.SET_NULL, limit_choices_to = {'is_facilitator': True}, related_name = 'lessonfile_author')
    co_facilitator = models.ManyToManyField(settings.AUTH_USER_MODEL, blank=True, limit_choices_to = {'is_facilitator': True})
    title = models.CharField(max_length=250, blank=True, null=True)
    description = RichTextField(blank=True, null=True)
    file = models.FileField(blank=True, null=True, upload_to='lesson_files/')
    image = models.ImageField(blank=True, null=True,upload_to='lesson_images/')
    lesson = models.ForeignKey(Lesson, null=True, on_delete=models.SET_NULL)
    date_added = models.DateTimeField(default=timezone.now)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.title)

    class Meta:
        verbose_name = 'Lesson File'
        verbose_name_plural = 'Lesson Files'
        ordering = ('-date_updated',)

    def save_model(self, request, obj, form, change):
        obj.added_by = request.user
        super().save_model(request, obj, form, change)

    def extension(self):
        title, extension = os.path.splitext(self.file.title)
        return extension
        
    def css_class(self):
        title, extension = os.path.splitext(self.file.title)
        if extension == 'pdf':
            return 'pdf'
        if extension == 'doc' or  extension == 'docx':
            return 'word'
        if extension == 'ppt' or extension == 'pptx':
            return 'ppt'
        if extension == 'xls' or extension == 'xlsx':
            return 'xls'
        return 'other'

class LessonActivity(models.Model):
    added_by = models.ForeignKey(settings.AUTH_USER_MODEL,null=True, blank=True, on_delete=models.SET_NULL, limit_choices_to = {'is_facilitator': True}, related_name = 'lessonactivity_author')
    co_facilitator = models.ManyToManyField(settings.AUTH_USER_MODEL, blank=True, limit_choices_to = {'is_facilitator': True})
    title = models.CharField(max_length=250, blank=True, null=True)
    slug = models.SlugField() 
    description = RichTextField(blank=True, null=True)
    file = models.FileField(blank=True, null=True, upload_to='lessonactivity_files/')
    image = models.ImageField(blank=True, null=True,upload_to='lessonactivity_images/')
    lesson = models.ForeignKey(Lesson, null=True, on_delete=models.SET_NULL)
    is_open = models.BooleanField(default=False)
    deadline = models.DateTimeField(blank=True, null=True)
    total_items = models.FloatField(default=0.00)
    date_added = models.DateTimeField(default=timezone.now)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.title) 

    class Meta:
        verbose_name = 'Lesson Activity'
        verbose_name_plural = 'Lesson Activities'
        ordering = ('-date_updated',)

    def save_model(self, request, obj, form, change):
        obj.added_by = request.user
        super().save_model(request, obj, form, change)

    def get_absolute_url(self):
        return reverse("lessonactivity_detail", kwargs={"slug": self.slug})
    
    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        return super().save(*args, **kwargs)

class ActivityOutput(models.Model):
    title = models.CharField(max_length=250, blank=True, null=True)
    text_answer = RichTextField(blank=True, null=True)
    file = models.FileField(blank=True, null=True, upload_to='activityoutput_files/')
    image = models.ImageField(blank=True, null=True,upload_to='activityoutput_images/')
    is_checked = models.BooleanField(default=False)
    score = models.FloatField(blank=True, default=0.00)
    time_submitted = models.DateTimeField(auto_now_add=True, null=True)
    lessonactivity = models.ForeignKey(LessonActivity, null=True, on_delete=models.SET_NULL)
    participant = models.ForeignKey(WorkshopParticipant, null=True, on_delete=models.SET_NULL)
    feedback = RichTextField(blank=True, null=True)
    date_added = models.DateTimeField(default=timezone.now)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.title)

    class Meta:
        verbose_name = 'Activity Output'
        verbose_name_plural = 'Activity Outputs'
        ordering = ('-date_updated',)
    
    