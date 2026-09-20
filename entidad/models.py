from django.db import models


class Usuario(models.Model):
    nombre_usuario = models.TextField(max_length=15)
    password_usuario = models.TextField(max_length=20)

class ServicioContratado(models.Model):
    nombre_servicio = models.TextField(max_length=100)
    
    def __str__(self):
        return str(self.nombre_servicio)
    
    
class Servicio(models.Model):
    numero = models.IntegerField(null=False)
    cliente = models.TextField(max_length=100)
    servicio_contratado = models.ForeignKey(ServicioContratado, on_delete=models.CASCADE)
    empresa = models.TextField(max_length=100)
    precio_instalacion = models.IntegerField(null=False)


class Historial(models.Model):
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    descripcion_historial = models.TextField(max_length=200)
    tabla_afectada_historial = models.TextField(max_length=100)
    fecha_hora_historial = models.DateTimeField()    


  