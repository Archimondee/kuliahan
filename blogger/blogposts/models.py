from django.db import models
from django.core.urlresolvers import reverse
# Create your models here.
class Post(models.Model):
	""" models.py adalah file yg akan berinteraksi dengan database server """
	title = models.CharField(max_length = 120)
	content = models.TextField()
	updated = models.DateTimeField(auto_now=True,auto_now_add=False)
	timestamp = models.DateTimeField(auto_now=False,auto_now_add=True)

	def __unicode__(self):
		return self.title

	def __str__(self):
		return self.title

	def get_absolute_url(self):
		return reverse("posts:post_retrieve", kwargs={"id":self.id})
