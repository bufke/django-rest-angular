from django.conf.urls import patterns, include, url
from django.contrib import admin
from api.routers import api_urls
from django.views.generic import TemplateView
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = patterns('',
    url(r'^admin/', include(admin.site.urls)),
    url(r'^api/', include(api_urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^', TemplateView.as_view(template_name="angular.html")),
) + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
