from django.contrib import admin

# Register your models here.
from blogposts.models import Post

class PostModelAdmin(admin.ModelAdmin):
	list_display = ["title","content","updated","timestamp"]
	list_filter = ["timestamp","updated"]
	list_editable = ["title"]
	list_display_links = ["content"]
	search_fields = ["title","content"]


	class Meta:
		model = Post



#Registerin models to admin site
admin.site.register(Post, PostModelAdmin)