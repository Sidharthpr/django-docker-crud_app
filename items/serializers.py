from rest_framework_gis.serializers import GeoFeatureModelSerializer
from .models import Item

class ItemSerializer(GeoFeatureModelSerializer):
    class Meta:
        model = Item
        geo_field = "location" 
        fields = '__all__'
