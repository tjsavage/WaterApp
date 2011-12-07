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
	low = models.ForeignKey(Severity, related_name='low')
	#mid = models.ForeignKey(Severity, related_name='mid')
	#high = models.ForeignKey(Severity, related_name='high')
	
	
class EmergencyContact(models.Model):
	phone_number = models.CharField(max_length=10)
	email = models.CharField(max_length=30)
	
	
class Severity(models.Model):
	description = models.CharField(max_length=50) 
	
	
class LeakReport(models.Model):
	leak_id = models.IntegerField()
	severity = models.IntegerField()
	report_time = models.DateTimeField(auto_now_add=True)
	latitude = models.FloatField()
	longitude = models.FloatField()
		
