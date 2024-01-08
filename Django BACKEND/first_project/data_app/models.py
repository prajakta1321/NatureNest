from django.db import models

# myapp/models.py
# model = Table name
# models.py

from django.db import models

class Harvest(models.Model):
    h_id = models.IntegerField(primary_key=True)
    date = models.DateField()
    quantity = models.IntegerField()
    plant_id = models.IntegerField()
    plot_id = models.IntegerField()
    member_id = models.IntegerField()

    class Meta:
        db_table = 'harvest'  # Specify the exact table name here

    def __str__(self):
        return f"Harvest {self.h_id}"

class Member(models.Model):
    member_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=70)
    last_name = models.CharField(max_length=70)
    email = models.EmailField(max_length=255)
    phone = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    join_date = models.DateField()

    class Meta:
        db_table = 'member'  # Specify the exact table name here
    

    def __str__(self):
        return f"{self.first_name} {self.last_name}"
from django.db import models

class Plot(models.Model):
    plot_id = models.AutoField(primary_key=True)
    location = models.CharField(max_length=70)
    size = models.IntegerField()
    statuss = models.CharField(max_length=255)
    member_id = models.IntegerField()  # This assumes a simple integer relationship. For ForeignKey, see below

    class Meta:
        db_table = 'plot'  # Specify the exact table name here

    def __str__(self):
        return f"Plot {self.plot_id} at {self.location}"


class Plant(models.Model):
    plant_id = models.AutoField(primary_key=True)
    pname = models.CharField(max_length=255)
    ptype = models.CharField(max_length=255)
    season = models.CharField(max_length=50)
    care = models.CharField(max_length=255)

    class Meta:
        db_table = 'plants'  # Specify the exact table name here

    def __str__(self):
        return f"{self.pname} ({self.ptype})"
    

