from django.shortcuts import render

# Create your views here.
# myapp/views.py

from django.http import JsonResponse
from .models import Harvest
from .models import Member
from .models import Plot
from .models import Plant

from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def harvest_list(request):
    harvests = Harvest.objects.all().values()
    harvest_list = list(harvests)  # Convert QuerySet to a list for JSON serialization
    return JsonResponse({'harvest': harvest_list})



@csrf_exempt
def get_members(request):
    members = Member.objects.all().values()
    members_list = list(members)  # convert QuerySet to a list for JSON serialization
    return JsonResponse({'members': members_list})

@csrf_exempt
def get_plots(request):
    plots = Plot.objects.all().values()
    plots_list = list(plots)  # convert QuerySet to a list for JSON serialization
    return JsonResponse({'plots': plots_list})


@csrf_exempt
def get_plants(request):
    plants = Plant.objects.all().values()
    plants_list = list(plants)
    return JsonResponse({'plants': plants_list})

import json
@csrf_exempt
def add_plants(request):
    if request.method == 'POST':
        data = json.loads(request.body)

        for plant_data in data:
            # Assuming plant_data is a dictionary here
            Plant.objects.create(
                pname=plant_data['pname'],
                ptype=plant_data['ptype'],
                season=plant_data['season'],
                care=plant_data['care']
            )

        return JsonResponse({'status': 'success'})
    return JsonResponse({'status': 'invalid request'}, status=400)

@csrf_exempt
def add_user(request):
    if request.method == 'POST':
        data = json.loads(request.body)

        for member_data in data:
            # Assuming member_data is a dictionary here
            Member.objects.create(
                first_name=member_data['first_name'],
                last_name=member_data['last_name'],
                email=member_data['email'],
                phone=member_data['phone'],
                address=member_data['address'],
                join_date=member_data['join_date'],
            )

        return JsonResponse({'status': 'success'})
    return JsonResponse({'status': 'invalid request'}, status=400)


@csrf_exempt  # This decorator is used to bypass CSRF protection. Use with caution.
def search_plants(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            search_query = data.get('query', '')

            # Perform a basic case-insensitive search across desired fields
            plants = Plant.objects.filter(
                pname__icontains=search_query
                # Add other fields if you want to search across them as well
            ).values()  # or only return necessary fields using values('id', 'pname', etc.)

            return JsonResponse(list(plants), safe=False)  # Convert QuerySet to list and return as JSON

        except json.JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON'}, status=400)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)

    return JsonResponse({'error': 'Invalid request'}, status=400)


@csrf_exempt
def order_harvests(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        order_by_field = data.get('order_by', 'date')  # Default ordering by date
        try:
            harvests = Harvest.objects.all().order_by(order_by_field).values()
            return JsonResponse(list(harvests), safe=False)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)
    return JsonResponse({'error': 'Invalid request'}, status=400)




from django.db.models import Count

@csrf_exempt
def group_members_by_join_date(request):
    if request.method == 'GET':
        try:
            grouped_members = Member.objects.values('join_date').annotate(total=Count('member_id'))
            return JsonResponse(list(grouped_members), safe=False)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)
    return JsonResponse({'error': 'Invalid request'}, status=400)
