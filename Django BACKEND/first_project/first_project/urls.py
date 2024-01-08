"""
URL configuration for first_project project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from data_app.views import harvest_list
from data_app.views import get_members
from data_app.views import get_plants
from data_app.views import get_plots
from data_app.views import add_plants
from data_app.views import add_user
from data_app.views import search_plants
from data_app.views import order_harvests
from data_app.views import group_members_by_join_date
urlpatterns = [
    path("admin/", admin.site.urls),
    path('harvest/', harvest_list, name='harvest_list'),
    path('members/', get_members, name='get_members'),
    path('plants/', get_plants, name='get_plants'),
    path('plots/', get_plots, name='get_plots'),
    path('add_plants/', add_plants, name='add_plants'),
    path('add_members/', add_user, name='add_user'),
    path('search_plants/', search_plants, name='search_plants'),
    path('order_harvests/', order_harvests, name='order_harvests'),
    path('group_members_by_join_date/', group_members_by_join_date, name='group_members_by_join_date'),
]
