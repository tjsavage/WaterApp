from django.template import Context, loader
from django.http import HttpResponse
from django.utils import tzinfo

from google.appengine.api import mail
from google.appengine.ext import db 
from google.appengine.ext import blobstore 
from google.appengine.api import images 

import json, logging
from datetime import datetime

import os

os.environ['TZ'] = 'America/Los_Angeles'
PSTOFFSET = -8

from waterapp.models import LeakReport, EmergencyContact, LeakType

def list(request):
		
	leak_list = []
	for next in LeakType.objects.all():
		leak = {}
		leak['id'] = next.pk
		leak['description'] = next.description
		leak['critical_severity'] = next.critical_severity
		
		severities = {}
		severities['low'] = next.low
		severities['mid'] = next.mid
		severities['high'] = next.high
		leak['severities'] = severities
		leak_list.append(leak)
		
	contact = EmergencyContact.objects.get()
	try:
		contact = EmergencyContact.objects.get()
		ec = {'email': contact.email, 'phone_number':contact.phone_number}
	except EmergencyContact.DoesNotExist:
		ec = None
	
	
	response = HttpResponse(content_type='application/json', status = 200)
	obj = {'leaks':leak_list }
	if ec:
		obj['emergency_contact'] = ec
	json.dump(obj, response)
	

	return response

class leakImage(db.Model):
	picture = db.BlobProperty(default=None)

def displayImage(request, pic_id):

	try:
		p = leakImage.get_by_id(int(pic_id))
			
		response = HttpResponse(p.picture)
		response['Content-Type'] = 'image/png'
		response['Cache-Control'] = 'max-age=7200'
	except:
		response = HttpResponse('Image not found.')
	return response
		
	


def recieve(request):
	logging.getLogger().setLevel(logging.DEBUG)
	l = LeakReport()
	params = request.POST
	l.leak = params['leakType']
	l.severity = params['severity']
	l.latitude = params['latitude']
	l.longitude = params['longitude']
	l.comments = params['comments']
	l.sunet_id = params['sunetID']
	l.report_time = datetime.now(tzinfo=tzinfo.FixedOffset(PSTOFFSET, 'PST'))
	
	
	
	
	pic = request.FILES['file'].read()
	p = leakImage()
	logging.debug('pic: ' + str(pic))
	m = images.resize(pic, 480)
	logging.debug('m: ' + str(m))
	p.picture = db.Blob(m)
	logging.debug('leakImage: ' + str(p.picture))
	s = p.put()
	l.pic = s.id()
	
	
	l.save()
	#return HttpResponse(content=l.report_time.strftime('%I:%M %B %d, %Y'))
	
	contact = EmergencyContact.objects.get()
	
	
	
	try:
		part1 = """
	
		There has been a report of a 
	
		""" 
		part2 = str(l.severity) + " " +  str(l.leak)
		part3 = """
	
		at 
	
		"""
		part4 = "http://maps.google.com/?ll=" + str(l.latitude) + "," + str(l.longitude) 
		part5 = """ 
	
		On
	
		"""
		part6 = str(l.report_time.strftime('%I:%M %B %d, %Y'))
		b = part1 + part2 + part3 + part4 + part5
	
		message = mail.send_mail(sender = 'stanfordwaterapp@gmail.com',
								to = contact.email,
							   subject = 'New leak report',
							   body = b
							   )
	except EmergencyContact.DoesNotExist:
		pass
	
		
	return HttpResponse(status=200)
		
