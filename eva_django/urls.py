from django.contrib import admin
from django.urls import path

from entidad import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.mostrar_index),
    path('menu', views.mostrar_menu),
    path('form_registrar', views.mostrar_form_reg),
    path('form_actualizar', views.mostrar_form_act),
    path('listado', views.mostrar_listado),
    path('logout', views.cerrar_sesion),
]
