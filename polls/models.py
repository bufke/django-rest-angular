from django.db import models

# Create your models here.
class Poll(models.Model):
    name = models.CharField(max_length=255, verbose_name="Poll Name!!", help_text="It's the name. OF YOUR POLL!")
    int_field = models.IntegerField(help_text="For no reason an int field, put a number in it!")
