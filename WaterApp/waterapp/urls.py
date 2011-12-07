from django.conf.urls.defaults import *

urlpatterns = patterns('waterapp.views',
	(r'^api/leak/list/$', 'list'),
    (r'^api/leak/report/$', 'recieve'),
    (r'^api/picture/(?P<pic_id>\d+)/$', 'displayImage'),
)
