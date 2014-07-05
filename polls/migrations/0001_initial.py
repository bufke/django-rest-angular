# encoding: utf8
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Poll',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(help_text=b"It's the name. OF YOUR POLL!", max_length=255, verbose_name=b'Poll Name!!')),
                ('int_field', models.IntegerField(help_text=b'For no reason an int field, put a number in it!')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
