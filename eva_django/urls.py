from django.contrib import admin
from django.urls import path

from entidad import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.mostrar_index),
    path('menu', views.mostrar_menu),
    path('form_registrar', views.mostrar_form_reg),
    path('form_reg_servicio_contratado', views.mostrar_form_reg_servicio_contratado),
    path('listado_servicio_contratado', views.mostrar_listado_servicio_contratado),
    path('form_actualizar_servicio_contratado/<int:id>', views.mostrar_form_act_servicio_contratado),
    path('eliminar_servicio_contratado/<int:id>', views.eliminar_servicio_contratado),
    path('form_actualizar/<int:id>', views.mostrar_form_act),
    path('listado', views.mostrar_listado),
    path('eliminar_entidad/<int:id>', views.eliminar_servicio),
    path('logout', views.cerrar_sesion),
    
]
