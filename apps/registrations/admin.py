from django.contrib import admin
from django.urls import path
from django.shortcuts import render
from django.contrib.auth.admin import UserAdmin as DjangoUserAdmin
from django.utils.translation import ugettext_lazy as _
from django import forms
from django.contrib import messages
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.contrib.auth.hashers import make_password
from .models import UserProfile, User
import csv

# Register your models here.

@admin.register(User)
class UserAdmin(DjangoUserAdmin):
    """Define admin model for custom User model with no email field."""

    readonly_fields = ["first_name", "last_name", "email"]

    def get_readonly_fields(self, request, obj=None):
        if request.user.is_superuser:
            return []
        return self.readonly_fields

    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        (_('Personal info'), {'fields': ('first_name', 'last_name')}),
        (_('Permissions'), {'fields': ('is_active', 'is_staff', 'is_superuser', 'is_facilitator', 'is_participant',
                                       'groups', 'user_permissions')}),
        (_('Important dates'), {'fields': ('last_login', 'date_joined')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'password1', 'password2'),
        }),
    )


    list_display = ('email', 'first_name', 'last_name', 'is_staff', 'is_facilitator', 'is_participant')
    search_fields = ('email', 'first_name', 'last_name')
    ordering = ('email',)

    def get_urls(self):
        urls = super().get_urls()
        new_urls = [path('upload-csv/', self.upload_csv),]
        return new_urls + urls

    def upload_csv(self, request):

            if request.method == "POST":
                csv_file = request.FILES["csv_upload"]

                if not csv_file.name.endswith('.csv'):
                    messages.warning(request, 'The wrong file type was uploaded')
                    return HttpResponseRedirect(request.path_info)

                # Open the CSV file
                data = csv.reader(csv_file.read().decode('utf-8').splitlines())
                # Skip the first row
                next(data)

                for fields in data:
                    if len(fields) == 7:
                        if not User.objects.filter(email=fields[0]):
                            created = User.objects.update_or_create(
                                email = fields[0],
                                first_name = fields[1],
                                last_name = fields[2],
                                is_staff = fields[3]=='1',
                                is_facilitator = fields[4]=='1',
                                is_participant = fields[5]=='1',
                                password = make_password(fields[6], salt=None, hasher='default')
                                )
                            
                url = reverse('admin:index')
                return HttpResponseRedirect(url)

            form = CsvImportForm()
            data = {"form": form}
            return render(request, "admin/csv_upload.html", data)


admin.site.register(UserProfile)

class CsvImportForm(forms.Form):
    csv_upload = forms.FileField()