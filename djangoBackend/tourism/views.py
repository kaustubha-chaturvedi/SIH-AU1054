from django.shortcuts import render
from tourism.models import *
from tourism.serializers import *
from rest_framework.decorators import api_view
from rest_framework.response import Response

@api_view(['GET','POST'])
def index(request):
    if request.method == 'GET':
        famous = Famous.objects.all()
        serializer=FamousSerializer(famous, many=True)
        return Response(serializer.data)
    if request.method == 'POST':
        serializer = FamousSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=201)
        return Response(serializer.errors, status=400)

@api_view(['GET','POST'])
def location(request):
    if request.method == 'GET':
        location = Location.objects.all()
        serializer=LocationSerializer(location, many=True)
        return Response(serializer.data)
    if request.method == 'POST':
        serializer = LocationSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=201)
        return Response(serializer.errors, status=400)
