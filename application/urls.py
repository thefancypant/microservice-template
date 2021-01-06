from django.contrib import admin
from django.urls import path
from health import views as health_views

urlpatterns = [
    # Health check API
    path('health/', health_views.HealthCheckView.as_view(), name='health'),


]
