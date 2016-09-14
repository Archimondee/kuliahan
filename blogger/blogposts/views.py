from django.shortcuts import render, get_object_or_404, redirect, Http404
from django.http import HttpResponse, HttpResponseRedirect
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib import messages
from .models import Post
from .forms import PostForm
from urllib.parse import quote_plus

def post_lists(request):
	post_list = Post.objects.all().order_by("-timestamp")
	paginator = Paginator(post_list,5)
	page_request_var = "page"
	page = request.GET.get(page_request_var)
	try:
		post = paginator.page(page)
	except PageNotAnInteger:
		post = paginator.page(1)
	except EmptyPage:
		post = paginator.page(paginaotr.num_pages)
	context = {
		"object_list": post,
		"title":"List ",
		"page_request_var":page_request_var,
	}
	return render(request,"post_list.html",context)

def post_create(request):
	#form = PostForm(request.POST)
	if not request.user.is_staff or not request.user.is_superuser:
		raise Http404
	form = PostForm(request.POST or None, request.FILES or None)
	if form.is_valid():
		instance = form.save(commit=False)
		instance.save()
		messages.success(request,"Item Created")
		return HttpResponseRedirect(instance.get_absolute_url())
	context = {
		"form":form,
		}
	return render(request,"post_form.html",context)

def post_delete(request,slug=None):
	if not request.user.is_staff or not request.user.is_superuser:
		raise Http404
	instance = get_object_or_404(Post, slug=slug)
	instance.delete()
	messages.success(request,"Sucessfully deleted")
	return redirect("posts:post_lists")

def post_retrieve(request,slug=None):
	#404 Page not Found
	instance = get_object_or_404(Post, slug=slug)
	social_share = quote_plus(instance.content)
	context = {
		"title":instance.title,
		"instance":instance,
		"social_share":social_share,
	}
	return render(request,"post_detail.html",context)

def post_update(request,slug=None):
	if not request.user.is_staff or not request.user.is_superuser:
		raise Http404
	instance = get_object_or_404(Post,slug=slug)
	form = PostForm(request.POST or None,request.FILES or None,instance=instance)
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
