from django import forms
from .models import Blog
from django.forms import fields

class AddNewForm(forms.ModelForm):
	class Meta:
		model = Blog
		fields = ('title', 'header_image', 'body', 'tags')


	def __init__(self, *args, **kwargs):
		super(AddNewForm, self).__init__(*args, **kwargs)

		self.fields['title'].widget.attrs['class'] = 'form-control'
		self.fields['header_image'].widget.attrs['class'] = 'form-control'
		self.fields['body'].widget.attrs['class'] = 'form-control'
		self.fields['tags'].widget.attrs['class'] = 'form-control'
		self.fields['user'].widget.attrs['class'] = 'form-control'

