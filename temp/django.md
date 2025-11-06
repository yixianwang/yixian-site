+++
title = 'django'
date = 2023-10-24T03:10:46-04:00
draft = true
+++

//0
virtualenv dj

cd dj

pip install django

django-admin startproject reports_proj

python manage.py migrate

python manage.py createsuperuser

python manage.py startapp sales

python manage.py startapp reports

python manage.py startapp profiles

python manage.py startapp products

python manage.py startapp customers

python manage.py runserver
http://127.0.0.1:8000/
//10
pip install pillow django-crispy-forms matplotlib seaborn pandas xhtml2pdf
pip freeze
pip freeze > requirements.txt

//15
>> settings.py
# Application definition
INSTALLED_APPS = [
    ...

    # our apps
    'customers',
    'products',
    'profiles',
    'reports',
    'sales',
    # 3rd party
    'crispy_forms'
]

# define crispy template
CRISPY_TEMPLATE_PACK = 'bootstrap4'

'DIRS': [BASE_DIR / 'templates']

mkdir templates
touch base.html
touch navbar.html

STATICFILES_DIRS = [
    BASE_DIR / 'static'
]
MEDIA_URL = '/media/'
MEDIA_ROOT = BASE_DIR / 'media'

mkdir static
touch style.css

mkdir media

>> urls.py
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


>> base.html

>> customers/models.py
class Customer(models.models):
    name = models.CharField(max_length=120)
    logo = models.ImageField(upload_to='customers', default='no_picture.png')

mv no_picture.png media

>> customers/admin.py
from .models import Customer
# Register your models here.

admin.site.register(Customer)

>> terminal
python manage.py makemigrations
python manage.py migrate
python manage.py runserver

