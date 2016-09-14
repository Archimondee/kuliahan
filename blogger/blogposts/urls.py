from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$',views.post_lists,name='post_lists'),
    url(r'^create/',views.post_create, name='post_create'),
    url(r'^(?P<slug>[\w-]+)/update/$',views.post_update, name='post_update'),
    url(r'^(?P<slug>[\w-]+)/$',views.post_retrieve, name='post_retrieve'),
    url(r'^(?P<slug>[\w-]+)/delete/$',views.post_delete,name='post_delete'),
]
