from django.template import Context, loader
from django.http import HttpResponse
from django.shortcuts import render_to_response
from django.core import serializers


from waterapp.models import LeakReport, EmergencyContact, LeakType

def list(request):
	try:
		data = []
		
		
		leak_list = []
		for next in LeakType.objects.all():
			leak = {}
			leak['description'] = next.description
			leak['critical_severity'] = next.critical_severity
			
			severities = {}
			severities['low'] = next.low
			severities['mid'] = next.mid
			severities['high'] = next.high
			
		data.append(EmergencyContact.objects.get())
		data = serializers.serialize("json", data, use_natural_keys=True, fields=('description', 'low', 'mid', 'high', 'critical_severity', 'category', 'phone_number', 'email'))
		response = HttpResponse(content = data, status=200)
	except:
		response = HttpResponse(status=503)
	return response
	
	

def recieve(request):

		#data = request.POST.__getitem__("leak_report")

	report = serializers.deserialize("json", '[{"pk":"999999","model":"waterapp.LeakReport", "fields":{"leak_id":"86", "severity":"1", "latitude":"1.1", "longitude":"1.1"}}]').next()
	report.object.id = None
	report.object.pk = None
	report.save()
	
	
	response = HttpResponse(content = report.object.report_time)	
	return response
	
def test_leak_repot(request):
	return render_to_response('waterapp/leakreporttester.html', {})
	
def convert_leak_report(request):
	converted = LeakReport()
	converted.leak_id = 20
	converted.longitude = 1.1
	converted.latitidue = 1.2
	converted.severity = 2
	return HttpResponse(content = serializers.serialize("json", [converted]))
		 


