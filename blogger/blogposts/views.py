from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import messages
from .models import Post
from .forms import PostForm

def post_lists(request):
	# if request.user.is_authenticated():
 	# 	context = {
 	# 		"title": "My User List"
 	# 	}
 	# else:
	# 	context = {
	# 		"title": "List"
	# 	}
	post = Post.objects.all()
	context = {
		"object_list": post,
		"title":"List "
	}
	return render(request,"index.html",context)

def post_create(request):
	#form = PostForm(request.POST)
	form = PostForm(request.POST or None)
	if form.is_valid():
		instance = form.save(commit=False)
		instance.save()
		messages.success(request,"Item Created")
		return HttpResponseRedirect(instance.get_absolute_url())
	#else:
		#messages.error(request,"No item created")
	#if request.method=="POST":
		#print (request.POST.get("title"))
		#print (request.POST.get("content"))
	context = {
		"form":form,
		}
	return render(request,"post_form.html",context)

def post_delete(request,id=None):
	instance = get_object_or_404(Post, id=id)
	instance.delete()
	messages.success(request,"Sucessfully deleted")
	return redirect("posts:post_lists")

def post_retrieve(request,id=None):
	#404 Page not Found
	instance = get_object_or_404(Post, id=id)
	context = {
		"title":instance.title,
		"instance":instance,
	}
	return render(request,"post_detail.html",context)

def post_update(request,id=None):
	instance = get_object_or_404(Post,id=id)
	form = PostForm(request.POST or None,instance=instance)
	if form.is_valid():
		instance = form.save(commit=False)
		#print (form.cleaned_data.get("title"))
		instance.save()
		messages.success(request,"<a href='#'> Item </a> Saved",extra_tags='html_safe')
		return HttpResponseRedirect(instance.get_absolute_url())
	context = {
		"title":instance.title,
		"instance":instance,
		"form":form,
	}
	return render(request,"post_form.html",context)
