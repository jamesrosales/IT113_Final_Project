from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.generic import CreateView, UpdateView
from apps.blog.models import Blog
from .forms import AddNewForm
from django.db.models import Count
from django.contrib.auth.decorators import login_required

blog_list = Blog.objects.all()
context = {
    'page_title' : 'Simple Blog Site',
    'blog_list' : blog_list,
    'blog_list_limited' : blog_list[:3]
}

#Blog
def blog_list(request):
    blog_list = Blog.objects.all()
    blog_count= Blog.objects.all().count()
    context['blog_list'] = blog_list
    context['blog_count'] = blog_count
    return render(request, 'blog/blog_list.html', context)
        
def blog_details(request, blog_id):
    blog = Blog.objects.get(pk=blog_id)
    blog_list = Blog.objects.all()
    context['blog'] = blog
    context['blog_list'] = blog_list
    return render(request, 'blog/blog_details.html', context)

@login_required
class AddNewInfoView(CreateView):
    model = Blog
    form_class = AddNewForm
    template_name = 'pages/add_new.html'
    success_url = reverse_lazy('home-page')
    success_message = "Successfully added the infomation!"

@login_required
class UpdateInfoView(UpdateView):
    model = Blog
    form_class = AddNewForm
    template_name = 'blog/update_info.html'
    success_url = reverse_lazy('blog-list')
    success_message = "Successfully updated the infomation!"

@login_required
def delete_info(request, blog_id):
    blog = Blog.objects.get(pk=blog_id)
    blog.delete()
    return redirect('blog-list')
    