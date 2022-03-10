from django.db import models

# Create your models here.

class Location(models.Model):
    location = models.TextField()
    def __str__(self):
        return self.location
        
class Famous(models.Model):
    item = models.TextField()
    location = models.OneToOneField("tourism.location", on_delete=models.CASCADE,null=True)
    category = models.TextField()
    like = models.IntegerField()
    dislike = models.IntegerField()