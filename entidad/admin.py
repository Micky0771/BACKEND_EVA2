from django.contrib import admin
from entidad.models import Usuario, ServicioContratado, Servicio, Historial

# Register your models here.
admin.site.register(Usuario)
admin.site.register(ServicioContratado)
admin.site.register(Servicio)
admin.site.register(Historial)

