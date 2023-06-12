from django.db import models
from apps.registrations.models import User
from django.db.models.deletion import CASCADE
from django.db.models.fields import BLANK_CHOICE_DASH
from django.db.models.fields.files import ImageFileDescriptor
from ckeditor.fields import RichTextField
from django.urls import reverse

# Create your models here.
    
class Blog(models.Model):
    title = models.CharField(max_length=255, blank=True, null=True)
    shortdescription = models.CharField(max_length=250, blank=True, null=True)
    header_image = models.ImageField(null=True, blank=True, upload_to="blog/header_images/")
    body = RichTextField(blank=True, null=True)
    tags = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('blog-details', args=(str)(self.id))


