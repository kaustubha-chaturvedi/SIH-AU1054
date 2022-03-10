from django.shortcuts import render
from tourism.models import *
from tourism.serializers import *
from rest_framework.decorators import api_view
from rest_framework.response import Response

@api_view(['GET'])
def index(request):
    famous = Famous.objects.all()
    serializer=FamousSerializer(famous, many=True)
    return Response(serializer.data)
