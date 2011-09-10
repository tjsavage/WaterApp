from django.template import Context, loader
from django.http import HttpResponse
from waterapp.models import LeakReport

from django.core import serializers

def list(request):
	return HttpResponse("hello world")
	
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
		 


