from django.db import models
from django.core.urlresolvers import reverse
from django.db.models.signals import pre_save
from django.utils.text import slugify
from django.conf import settings
from django.utils import timezone
# Create your models here.

#Post.objects.all()
#Post.objects.create()

class PostManager(models.Manager):
	def active(self,*args,**kwargs):
		# --> Post.objects.all() = super(PostManager,self).all()
		return super(PostManager,self).filter(draft=False).filter(publish__lte=timezone.now())

def upload_locations(instance,filename):
	return "%s/%s"%(instance.id,filename)

class Post(models.Model):
	""" models.py adalah file yg akan berinteraksi dengan database server """
	user = models.ForeignKey(settings.AUTH_USER_MODEL,default=1)
	slug = models.SlugField(unique=True)
	title = models.CharField(max_length = 120)
	image = models.ImageField(upload_to=upload_locations,
			null=True,
			blank=True,
			width_field="width_field",
			height_field="height_field")
	height_field=models.IntegerField(default=0)
	width_field=models.IntegerField(default=0)
	content = models.TextField()
	updated = models.DateTimeField(auto_now=True,auto_now_add=False)
	timestamp = models.DateTimeField(auto_now=False,auto_now_add=True)
	publish = models.DateTimeField(auto_now=False, auto_now_add=False)
	draft = models.BooleanField(default=False)

	objects = PostManager()

	def __unicode__(self):
		return self.title

	def __str__(self):
		return self.title

	def get_absolute_url(self):
		return reverse("posts:post_retrieve", kwargs={"slug": self.slug})

	class Meta:
		ordering = ["-timestamp","-updated"]
def create_slug(instance, new_slug=None):
	slug = slugify(instance.title)
	if new_slug is not None:
		slug = new_slug
	qs = Post.objects.filter(slug=slug).order_by("-id")
	exists = qs.exists()
	if exists:
		slug = "%s-%s"%(slug, qs.first().id)
		return create_slug(instance, new_slug=new_slug)
	return slug

def pre_save_signal(sender, instance, *args, **kwargs):
	if not instance.slug:
		instance.slug = create_slug(instance)

pre_save.connect(pre_save_signal, sender=Post)
