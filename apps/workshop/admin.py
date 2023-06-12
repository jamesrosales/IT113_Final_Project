from django.contrib import admin
from django.db.models import Prefetch, Q
from .models import User, ExtensionProgram, ExtensionProgram_Files, ExtensionProgram_Member, ExtensionProject, ExtensionProject_Files, ExtensionProject_Member, Category, Workshop, WorkshopFacilitator, WorkshopParticipant, Lesson, LessonActivity, LessonFile, ActivityOutput
from itertools import chain

# Register your models here.

class FilterUserAdmin(admin.ModelAdmin): 
    def save_model(self, request, obj, form, change):
        obj.added_by = request.user
        obj.save()

    def get_queryset(self, request): 
        qs = super(FilterUserAdmin, self).get_queryset(request) 
        if request.user.is_superuser:
            return qs
        else:
            return qs.filter(Q(added_by = request.user) | Q(co_facilitator = request.user))

class ExtensionProgramAdmin(FilterUserAdmin):
    exclude = ['added_by']
    prepopulated_fields = {"slug": ("title",)}

    def get_changeform_initial_data(self, request):
        return {'added_by': request.user}

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == 'co_facilitator':
            if request.user.is_superuser:
                kwargs["queryset"] = User.objects.all()
            else:
                kwargs["queryset"] = User.objects.exclude(id=request.user.id) 

        return super().formfield_for_manytomany(db_field, request, **kwargs)

    pass
admin.site.register(ExtensionProgram, ExtensionProgramAdmin)

class ExtensionProgram_FilesAdmin(FilterUserAdmin):
    exclude = ['added_by']

    def get_changeform_initial_data(self, request):
        return {'added_by': request.user}
    
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "extensionprogram":
            if request.user.is_superuser:
                kwargs["queryset"] = ExtensionProgram.objects.all()
            else:
                kwargs["queryset"] = ExtensionProgram.objects.filter(Q(added_by=request.user) | Q(co_facilitator=request.user))
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == 'co_facilitator':
            if request.user.is_superuser:
                kwargs["queryset"] = User.objects.all()
            else:
                kwargs["queryset"] = User.objects.exclude(id=request.user.id) 

        return super().formfield_for_manytomany(db_field, request, **kwargs)
    
    pass
admin.site.register(ExtensionProgram_Files, ExtensionProgram_FilesAdmin)

class ExtensionProgram_MemberAdmin(FilterUserAdmin):
    list_display = ('member', 'extensionprogram', 'is_leader')
    exclude = ['added_by']

    def get_changeform_initial_data(self, request):
        return {'added_by': request.user}
    
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "extensionprogram":
            if request.user.is_superuser:
                kwargs["queryset"] = ExtensionProgram.objects.all()
            else:
                kwargs["queryset"] = ExtensionProgram.objects.filter(Q(added_by=request.user) | Q(co_facilitator=request.user))
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == 'co_facilitator':
            if request.user.is_superuser:
                kwargs["queryset"] = User.objects.all()
            else:
                kwargs["queryset"] = User.objects.exclude(id=request.user.id) 

        return super().formfield_for_manytomany(db_field, request, **kwargs)
    
    pass
admin.site.register(ExtensionProgram_Member, ExtensionProgram_MemberAdmin)

class ExtensionProjectAdmin(FilterUserAdmin):
    exclude = ['added_by']
    prepopulated_fields = {"slug": ("title",)}

    def get_changeform_initial_data(self, request):
        return {'added_by': request.user}

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "extensionprogram":
            if request.user.is_superuser:
                kwargs["queryset"] = ExtensionProgram.objects.all()
            else:
                kwargs["queryset"] = ExtensionProgram.objects.filter(Q(added_by=request.user) | Q(co_facilitator=request.user))
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == 'co_facilitator':
            if request.user.is_superuser:
                kwargs["queryset"] = User.objects.all()
            else:
                kwargs["queryset"] = User.objects.exclude(id=request.user.id) 

        return super().formfield_for_manytomany(db_field, request, **kwargs)

    pass
admin.site.register(ExtensionProject, ExtensionProjectAdmin)

class ExtensionProject_FilesAdmin(FilterUserAdmin):
    exclude = ['added_by']

    def get_changeform_initial_data(self, request):
        return {'added_by': request.user}

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "extensionproject":
            if request.user.is_superuser:
                kwargs["queryset"] = ExtensionProject.objects.all()
            else:
                kwargs["queryset"] = ExtensionProject.objects.filter(Q(added_by=request.user) | Q(co_facilitator=request.user))
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == 'co_facilitator':
            if request.user.is_superuser:
                kwargs["queryset"] = User.objects.all()
            else:
                kwargs["queryset"] = User.objects.exclude(id=request.user.id)
        return super().formfield_for_manytomany(db_field, request, **kwargs)

    pass
admin.site.register(ExtensionProject_Files, ExtensionProject_FilesAdmin)

class ExtensionProject_MemberAdmin(FilterUserAdmin):
    list_display = ('member', 'extensionproject', 'is_leader')
    exclude = ['added_by']

    def get_changeform_initial_data(self, request):
        return {'added_by': request.user}

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "extensionproject":
            if request.user.is_superuser:
                kwargs["queryset"] = ExtensionProject.objects.all()
            else:
                kwargs["queryset"] = ExtensionProject.objects.filter(Q(added_by=request.user) | Q(co_facilitator=request.user))
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == 'co_facilitator':
            if request.user.is_superuser:
                kwargs["queryset"] = User.objects.all()
            else:
                kwargs["queryset"] = User.objects.exclude(id=request.user.id)
        return super().formfield_for_manytomany(db_field, request, **kwargs)

    pass
admin.site.register(ExtensionProject_Member, ExtensionProject_MemberAdmin)
        
admin.site.register(Category)

class WorkshopAdmin(FilterUserAdmin):
    exclude = ['added_by']
    prepopulated_fields = {"slug": ("title",)}

    def get_changeform_initial_data(self, request):
        return {'added_by': request.user, 'co_facilitator': request.user}

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "extensionproject":
            if request.user.is_superuser:
                kwargs["queryset"] = ExtensionProject.objects.all()
            else:
                kwargs["queryset"] = ExtensionProject.objects.filter(Q(added_by=request.user) | Q(co_facilitator=request.user))
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == 'co_facilitator':
            if request.user.is_superuser:
                kwargs["queryset"] = User.objects.all()
            else:
                kwargs["queryset"] = User.objects.exclude(id=request.user.id)
        return super().formfield_for_manytomany(db_field, request, **kwargs)

    pass
admin.site.register(Workshop, WorkshopAdmin)

class WorkshopFacilitatorAdmin(FilterUserAdmin):
    list_display = ('facilitator', 'workshop', 'is_active')
    exclude = ['added_by']

    def get_changeform_initial_data(self, request):
        return {'added_by': request.user}
    
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "workshop":
            if request.user.is_superuser:
                kwargs["queryset"] = Workshop.objects.all()
            else:
                kwargs["queryset"] = Workshop.objects.filter(Q(added_by=request.user) | Q(co_facilitator=request.user))
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == 'co_facilitator':
            if request.user.is_superuser:
                kwargs["queryset"] = User.objects.all()
            else:
                kwargs["queryset"] = User.objects.exclude(id=request.user.id)
        return super().formfield_for_manytomany(db_field, request, **kwargs)

    pass
admin.site.register(WorkshopFacilitator, WorkshopFacilitatorAdmin)

class WorkshopPartcipantAdmin(FilterUserAdmin):
    list_display = ('participant', 'workshop', 'is_active')
    exclude = ['added_by']

    def get_changeform_initial_data(self, request):
        return {'added_by': request.user}

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "workshop":
            if request.user.is_superuser:
                kwargs["queryset"] = Workshop.objects.all()
            else:
                kwargs["queryset"] = Workshop.objects.filter(Q(added_by=request.user) | Q(co_facilitator=request.user))
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == 'co_facilitator':
            if request.user.is_superuser:
                kwargs["queryset"] = User.objects.all()
            else:
                kwargs["queryset"] = User.objects.exclude(id=request.user.id)
        return super().formfield_for_manytomany(db_field, request, **kwargs)

    pass
admin.site.register(WorkshopParticipant, WorkshopPartcipantAdmin)
        
class LessonAdmin(FilterUserAdmin):
    exclude = ['added_by']
    prepopulated_fields = {"slug": ("title",)}

    def get_changeform_initial_data(self, request):
        return {'added_by': request.user}

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "workshop":
            if request.user.is_superuser:
                kwargs["queryset"] = Workshop.objects.all()
            else:
                kwargs["queryset"] = Workshop.objects.filter(Q(added_by=request.user) | Q(co_facilitator=request.user))
        elif db_field.name == "participant":
            if request.user.is_superuser:
                kwargs["queryset"] = WorkshopParticipant.objects.all()
            else:
                kwargs["queryset"] = WorkshopParticipant.objects.filter(Q(added_by=request.user) | Q(co_facilitator=request.user))
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == 'co_facilitator':
            if request.user.is_superuser:
                kwargs["queryset"] = User.objects.all()
            else:
                kwargs["queryset"] = User.objects.exclude(id=request.user.id)
        return super().formfield_for_manytomany(db_field, request, **kwargs)

    pass
admin.site.register(Lesson, LessonAdmin)

class LessonFileAdmin(FilterUserAdmin):
    exclude = ['added_by']

    def get_changeform_initial_data(self, request):
        return {'added_by': request.user}

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "lesson":
            if request.user.is_superuser:
                kwargs["queryset"] = Lesson.objects.all()
            else:
                kwargs["queryset"] = Lesson.objects.filter(Q(added_by=request.user) | Q(co_facilitator=request.user))
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == 'co_facilitator':
            if request.user.is_superuser:
                kwargs["queryset"] = User.objects.all()
            else:
                kwargs["queryset"] = User.objects.exclude(id=request.user.id)
        return super().formfield_for_manytomany(db_field, request, **kwargs)

    pass
admin.site.register(LessonFile, LessonFileAdmin)

class LessonActivityAdmin(FilterUserAdmin):
    exclude = ['added_by']
    prepopulated_fields = {"slug": ("title",)}

    def get_changeform_initial_data(self, request):
        return {'added_by': request.user}

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "lesson":
            if request.user.is_superuser:
                kwargs["queryset"] = Lesson.objects.all()
            else:
                kwargs["queryset"] = Lesson.objects.filter(Q(added_by=request.user) | Q(co_facilitator=request.user))
        return super().formfield_for_foreignkey(db_field, request, **kwargs)

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == 'co_facilitator':
            if request.user.is_superuser:
                kwargs["queryset"] = User.objects.all()
            else:
                kwargs["queryset"] = User.objects.exclude(id=request.user.id)
        return super().formfield_for_manytomany(db_field, request, **kwargs)
    
    pass
admin.site.register(LessonActivity, LessonActivityAdmin)

admin.site.register(ActivityOutput)