from dataclasses import fields
from re import T
from unicodedata import category
from ckeditor.fields import RichTextField
from unittest.util import _MAX_LENGTH
from django import forms
from django.contrib.auth.forms import UserCreationForm,PasswordChangeForm, UserChangeForm
import datetime

from .models import User, UserProfile, ExtensionProgram, ExtensionProgram_Files, ExtensionProgram_Member, ExtensionProject, ExtensionProject_Files, ExtensionProject_Member, Category, Workshop, WorkshopParticipant, Lesson, LessonActivity, LessonFile, ActivityOutput

class SaveWorkshop(forms.ModelForm):
    name = forms.CharField(max_length=250,help_text = "Course Name Field is required.")
    description = forms.Textarea()

    class Meta:
        model= Workshop
        fields = ('name','description')
    
    def clean_name(self):
        id = self.instance.id if not self.instance == None else 0
        try:
            if id.isnumeric() and id > 0:
                 workshop = Workshop.objects.exclude(id = id).get(name = self.cleaned_data['name'])
            else:
                 workshop = Workshop.objects.get(name = self.cleaned_data['name'])
        except:
            return self.cleaned_data['name']
        raise forms.ValidationError(f'{workshop.name} Workshop Already Exists.')

class AddActivityOutput(forms.ModelForm):
    class Meta:
        model = ActivityOutput
        fields = ('title','text_answer', 'file')

    def __init__(self, *args, **kwargs):
        participant = kwargs.pop('participant')
        lesson = kwargs.pop('lesson')
        
        super(AddActivityOutput, self).__init__(*args, **kwargs)
        self.fields['title'].widget.attrs['class'] = 'form-control'
        widgets = {
            'text_answer': RichTextField(),
        }
        self.fields['file'].widget.attrs['class'] = 'form-control'

class UpdateActivityOutput(forms.ModelForm):
    class Meta:
        model = ActivityOutput
        fields = ('title','text_answer', 'file')

    def __init__(self, *args, **kwargs):
        
        super(UpdateActivityOutput, self).__init__(*args, **kwargs)
        self.fields['title'].widget.attrs['class'] = 'form-control'
        self.fields['text_answer'].widget.attrs['class'] = 'form-control'
        self.fields['file'].widget.attrs['class'] = 'form-control'
        
