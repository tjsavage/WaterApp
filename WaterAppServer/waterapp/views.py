from django.template import Context, loader
from django.http import HttpResponse
from waterapp.models import LeakReport, EmergencyContact, LeakType

from django.core import serializers

def list(request):
	try:
		data = []
		for next in LeakType.objects.all():
			data.append(next)
		data.append(EmergencyContact.objects.get())
		data = serializers.serialize("json", data, use_natural_keys=True, fields=('description', 'low', 'mid', 'high', 'critical_severity', 'phone_number', 'email'))
		response = HttpResponse(content = data, status=200)
	except:
		response = HttpResponse(status=503)
	return response
	
def recieve(request):
	try:
		data = request.POST.__getitem__("leak_report")
		report = serializers.deserialize("json", data)[0]
		if not isinstance(report, LeakReport):
			raise
		report.save()
		response = HttpResponse(content="pk:" +str(report.pk), status=202)
		return response
	except:
		response = HttpResponse(status=400)
		return response
		 


