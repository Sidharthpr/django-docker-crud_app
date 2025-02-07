from django.contrib import admin
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from items.views import ItemViewSet  

# DRF Router for API endpoints
router = DefaultRouter()
router.register(r'items', ItemViewSet)  # Register ItemViewSet

urlpatterns = [
    path('admin/', admin.site.urls),  # Admin panel
    path('api/', include(router.urls)),  # API endpoints
]
