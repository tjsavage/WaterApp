from django.conf.urls.defaults import *

urlpatterns = patterns('waterapp.views',
	(r'^api/leak/list', 'list'),
    (r'^api/leak/send', 'recieve'),
)
