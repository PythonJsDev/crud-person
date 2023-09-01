from django.contrib import admin
from django.urls import path, include

from rest_framework.routers import DefaultRouter

from crud_person.person.views import PersonVS

router = DefaultRouter()
router.register("persons", PersonVS, basename="persons")


urlpatterns = [
    path("admin/", admin.site.urls),
    path("", include(router.urls)),
]
