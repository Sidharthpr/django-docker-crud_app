from django.contrib.gis.db import models  
from django.contrib.gis.geos import Point

class Item(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(blank=True)
    location = models.PointField(default=Point(0.0, 0.0)) 
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name
