# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-09-14 20:57
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('blogposts', '0002_post_user'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='draft',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='post',
            name='publish',
            field=models.DateTimeField(default=datetime.datetime(2016, 9, 14, 20, 57, 56, 111034, tzinfo=utc)),
            preserve_default=False,
        ),
    ]