from django.db import models

# Create your models here.

class village(models.Model):
    village_name=models.CharField(max_length=150)
    def __str__(self):
        return self.village_name
class famous(models.Model):
    name_of_village=models.ForeignKey(village,on_delete=models.CASCADE,db_index=True)
    famous_food=models.CharField(max_length=200,db_index=True)
    famous_place=models.CharField(max_length=200,db_index=True)
    famous_fruit=models.CharField(max_length=200,db_index=True)
    famous_handicraft=models.CharField(max_length=200,db_index=True)
    def __str__(self):
        return self.name_of_village

