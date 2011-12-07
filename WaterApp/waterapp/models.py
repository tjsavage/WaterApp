from django.db import models

# Create your models here.

class LeakType(models.Model):
	CATEGORY_CHOICES = (
		('cat one', 'one'),
		('cat two', 'two')
	)
	
	category = models.CharField(max_length=200, choices = CATEGORY_CHOICES)
	
	description = models.CharField(max_length=200)
	critical_severity = models.IntegerField()
	low = models.CharField(max_length=50) 
	mid = models.CharField(max_length=50) 
	high = models.CharField(max_length=50) 
	
	
class EmergencyContact(models.Model):
	phone_number = models.CharField(max_length=10)
	email = models.CharField(max_length=30)
	
class LeakReport(models.Model):
	leak = models.CharField(max_length=200)
	severity = models.CharField(max_length=50) 
	report_time = models.DateTimeField("Time the leak took place")
	latitude = models.FloatField()
	longitude = models.FloatField()
	comments = models.CharField(max_length=200)
	sunet_id = models.CharField(max_length=15)
	pic = models.TextField()
	
	
	