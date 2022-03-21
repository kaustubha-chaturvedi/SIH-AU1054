from tourism.views import *
from django.urls import path,include
from rest_framework.routers import DefaultRouter
from rest_framework.authtoken import views

router = DefaultRouter()
router.register(r'famous', FamousViewSet,basename='famous')
router.register(r'location', LocationViewSet,basename='location')
 
urlpatterns = [
    path('', include(router.urls)),
    path('register/', UserRegistrationView.as_view(), name='register'),
    path('login/', UserLoginView.as_view(), name='login'),
    path("profile/", UserProfileView.as_view(), name="profile"),
    path('api-token-auth/', views.obtain_auth_token, name='api-token-auth'),
]
