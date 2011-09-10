from django.db import models

# Create your models here.

class LeakType(models.Model):
	description = models.CharField(max_length=200)
	critical_severity = models.IntegerField()
	severity_list = models.ForeignKey('SeverityList')
		
	
class EmergencyContact(models.Model):
	phone_number = models.CharField(max_length=10)
	email = models.CharField(max_length=30)
	
class SeverityList(models.Model):
	low = models.ForeignKey('Severity')
	mid = models.ForeignKey('Severity')
	high = models.ForeignKey('Severity')
	
class Severity(models.Model):
	description = models.CharField(max_length=50) 
	
class LeakReport(models.Model):
	leak_type = models.IntegerField()
	severity = models.IntegerField()
	report_time = models.DateTimeField(auto_now_add=True)
	latitude = models.FloatField()
	longitude = models.FloatField()
		
