
import os, sys
sys.path.append('D:\\OpenServer\\domains\\myshop')
sys.path.append('D:\\OpenServer\\domains\\virtualenv\\myshop\\Lib\\site-packages')
os.environ['DJANGO_SETTINGS_MODULE'] = 'myshop.settings'

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()


#import django.core.handlers.wsgi
#application = django.core.handlers.wsgi.WSGIHandler()




