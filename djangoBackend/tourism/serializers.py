from rest_framework import serializers
from tourism.models import *

class FamousSerializer(serializers.ModelSerializer):
    class Meta:
        model = Famous
        fields = "__all__"