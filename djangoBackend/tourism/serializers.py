from rest_framework import serializers
from tourism.models import *

class FamousSerializer(serializers.ModelSerializer):
    class Meta:
        model = Famous
        fields = "__all__"

class LocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = "__all__"