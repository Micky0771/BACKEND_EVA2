from django.shortcuts import render
from entidad.models import Usuario, ServicioContratado, Servicio, Historial
from datetime import datetime


#-------------------------------------------------------------------------------------

def mostrar_index(request):
    return render(request, "index.html")

#-------------------------------------------------------------------------------------

def mostrar_menu(request):
    if (request.method == 'POST'):
        nom = request.POST['txtusu']
        pas = request.POST['txtcon']
        
        comprobarlogin = Usuario.objects.filter(
            nombre_usuario=nom,
            password_usuario=pas
        ).values()
        
        if (comprobarlogin):
            request.session["estadoSesion"] = True
            request.session["idUsuario"] = comprobarlogin[0]['id']
            request.session["nomUsuario"] = nom.upper()
            
            Historial.objects.create(
                usuario_id=request.session["idUsuario"],
                descripcion_historial="Inicio de Sesión",
                tabla_afectada_historial="Usuario",
                fecha_hora_historial=datetime.now()
            )
                        
            datos = {
                'nomUsuario': nom.upper()
            }
            
            if (nom.upper() == "ADMIN"):
                return render(request, "menu_admin.html", datos)
            else:
                return render(request, "menu_usuario.html", datos)
        
        else:
            datos = {
                'r2': 'Error en Usuario o Contraseña!!!'
                
            }
        
            return render(request, "index.html", datos)
    else:
        datos = {
            'r2': 'Debe iniciar sesión para acceder!!!'
            
        }
        
        return render(request, "index.html", datos)
    

#-------------------------------------------------------------------------------------

def mostrar_listado(request):
    estadoSesion = request.session.get("estadoSesion")
    nomUsuario = request.session.get("nomUsuario")

    if (estadoSesion and nomUsuario != "ADMIN"):

        servicios = Servicio.objects.all().values(
            'id',
            'numero',
            'cliente',
            'servicio_contratado__nombre_servicio',
            'empresa',
            'precio_instalacion'
        )

        datos = {
            'nomUsuario': nomUsuario,
            'servicios': servicios
        }

        return render(request, "listado.html", datos)

    else:
        datos = {
            'r2': 'Debe iniciar sesión para acceder!!!'
        }

        return render(request, "index.html", datos)

#-------------------------------------------------------------------------------------


def eliminar_servicio(request, id):
    estadoSesion = request.session.get("estadoSesion")
    nomUsuario = request.session.get("nomUsuario")
    

    if (estadoSesion and nomUsuario != "ADMIN"):

        Servicio.objects.filter(id=id).delete()
        
        Historial.objects.create(
            usuario_id=request.session["idUsuario"],
            descripcion_historial="Eliminación de Servicio",
            tabla_afectada_historial="Servicio",
            fecha_hora_historial=datetime.now()
        )

        return mostrar_listado(request)

    else:
        datos = {
            'r2': 'Debe iniciar sesión para acceder!!!'
        }

        return render(request, "index.html", datos)


#-------------------------------------------------------------------------------------

def mostrar_menu_admin(request):
    estadoSesion = request.session.get("estadoSesion")
    nomUsuario = request.session.get("nomUsuario")

    if (estadoSesion and nomUsuario == "ADMIN"):

        datos = {
            'nomUsuario': nomUsuario
        }

        return render(request, "menu_admin.html", datos)

    else:

        datos = {
            'r2': 'No tiene privilegios para acceder!!!'
        }

        return render(request, "index.html", datos)


#-------------------------------------------------------------------------------------

def mostrar_menu_usuario(request):
    estadoSesion = request.session.get("estadoSesion")
    nomUsuario = request.session.get("nomUsuario")

    if (estadoSesion and nomUsuario != "ADMIN"):

        datos = {
            'nomUsuario': nomUsuario
        }

        return render(request, "menu_usuario.html", datos)

    else:

        datos = {
            'r2': 'No tiene privilegios para acceder!!!'
        }

        return render(request, "index.html", datos)

#-------------------------------------------------------------------------------------


def mostrar_form_reg(request):
    estadoSesion = request.session.get("estadoSesion")
    nomUsuario = request.session.get("nomUsuario")

    if (estadoSesion and nomUsuario != "ADMIN"):

        r = ""
        
        if (request.method == 'POST'):

            num = request.POST['txtnum']
            cli = request.POST['txtcli']
            ser = request.POST['cboser']
            emp = request.POST['txtemp']
            pre = request.POST['txtpre']

            Servicio.objects.create(
                numero=num,
                cliente=cli,
                servicio_contratado_id=ser,
                empresa=emp,
                precio_instalacion=pre
            )
            
            Historial.objects.create(
                usuario_id=request.session["idUsuario"],
                descripcion_historial="Registro de Servicio",
                tabla_afectada_historial="Servicio",
                fecha_hora_historial=datetime.now()
            )
            
            r = "Servicio registrado correctamente!!!"

        opcionesServicios = ServicioContratado.objects.all().values().order_by("nombre_servicio")

        datos = {
            'nomUsuario': nomUsuario,
            'opcionesServicios': opcionesServicios,
            'r': r
        }

        return render(request, "form_reg.html", datos)

    else:
        datos = {
            'r2': 'No tiene privilegios para ingresar!!!'
        }

        return render(request, "index.html", datos)
    
    
    
#-------------------------------------------------------------------------------------

def mostrar_form_act(request, id):
    estadoSesion = request.session.get("estadoSesion")
    nomUsuario = request.session.get("nomUsuario")

    if (estadoSesion and nomUsuario != "ADMIN"):
        
        r = ""
        
        if (request.method == 'POST'):

            num = request.POST['txtnum']
            cli = request.POST['txtcli']
            ser = request.POST['cboser']
            emp = request.POST['txtemp']
            pre = request.POST['txtpre']

            Servicio.objects.filter(id=id).update(
                numero=num,
                cliente=cli,
                servicio_contratado_id=ser,
                empresa=emp,
                precio_instalacion=pre
            )
            
            Historial.objects.create(
                usuario_id=request.session["idUsuario"],
                descripcion_historial="Modificación de Servicio",
                tabla_afectada_historial="Servicio",
                fecha_hora_historial=datetime.now()
            )
            
            r = "Servicio modificado correctamente!!!"

        servicio = Servicio.objects.filter(id=id).values()

        opcionesServicios = ServicioContratado.objects.all().values().order_by("nombre_servicio")

        datos = {
            'nomUsuario': nomUsuario,
            'servicio': servicio[0],
            'opcionesServicios': opcionesServicios,
            'r': r
        }

        return render(request, "form_act.html", datos)

    else:
        datos = {
            'r2': 'Debe iniciar sesión para acceder!!!'
        }

        return render(request, "index.html", datos)
    
    
#-------------------------------------------------------------------------------------

def mostrar_form_reg_servicio_contratado(request):
    estadoSesion = request.session.get("estadoSesion")
    nomUsuario = request.session.get("nomUsuario")

    if (estadoSesion and nomUsuario == "ADMIN"):
        
        r = ""

        if (request.method == 'POST'):

            nom = request.POST['txtnom']

            ServicioContratado.objects.create(
                nombre_servicio=nom
            )

            Historial.objects.create(
                usuario_id=request.session["idUsuario"],
                descripcion_historial="Registro de Servicio Contratado",
                tabla_afectada_historial="ServicioContratado",
                fecha_hora_historial=datetime.now()
            )
            
            r = "Servicio contratado registrado correctamente!!!"

        datos = {
            'nomUsuario': nomUsuario,
            'r': r
        }

        return render(request, "form_reg_servicio_contratado.html", datos)

        
    else:
        datos = {
            'r2': 'No tiene privilegios para acceder!!!'
        }

        return render(request, "index.html", datos)

#-------------------------------------------------------------------------------------

def mostrar_listado_servicio_contratado(request):
    estadoSesion = request.session.get("estadoSesion")
    nomUsuario = request.session.get("nomUsuario")

    if (estadoSesion and nomUsuario == "ADMIN"):

        serviciosContratados = ServicioContratado.objects.all().values().order_by("nombre_servicio")

        datos = {
            'nomUsuario': nomUsuario,
            'serviciosContratados': serviciosContratados
        }

        return render(request, "listado_servicio_contratado.html", datos)

    else:
        datos = {
            'r2': 'No tiene privilegios para acceder!!!'
        }

        return render(request, "index.html", datos)
    
#-------------------------------------------------------------------------------------

def mostrar_form_act_servicio_contratado(request, id):
    estadoSesion = request.session.get("estadoSesion")
    nomUsuario = request.session.get("nomUsuario")

    if (estadoSesion and nomUsuario == "ADMIN"):
        
        r = ""

        if (request.method == 'POST'):

            nom = request.POST['txtnom']

            ServicioContratado.objects.filter(id=id).update(
                nombre_servicio=nom
            )
            
            Historial.objects.create(
                usuario_id=request.session["idUsuario"],
                descripcion_historial="Modificación de Servicio Contratado",
                tabla_afectada_historial="ServicioContratado",
                fecha_hora_historial=datetime.now()
            )

            r = "Servicio contratado modificado correctamente!!!"

        servicioContratado = ServicioContratado.objects.filter(id=id).values()

        datos = {
            'nomUsuario': nomUsuario,
            'servicioContratado': servicioContratado[0],
            'r': r  
        }

        return render(request, "form_act_servicio_contratado.html", datos)

    else:
        datos = {
            'r2': 'No tiene privilegios para acceder!!!'
        }

        return render(request, "index.html", datos)   

#-------------------------------------------------------------------------------------

def eliminar_servicio_contratado(request, id):
    estadoSesion = request.session.get("estadoSesion")
    nomUsuario = request.session.get("nomUsuario")

    if (estadoSesion and nomUsuario == "ADMIN"):

        ServicioContratado.objects.filter(id=id).delete()
        
        Historial.objects.create(
            usuario_id=request.session["idUsuario"],
            descripcion_historial="Eliminación de Servicio Contratado",
            tabla_afectada_historial="ServicioContratado",
            fecha_hora_historial=datetime.now()
        )

        return mostrar_listado_servicio_contratado(request)

    else:
        datos = {
            'r2': 'No tiene privilegios para acceder!!!'
        }

        return render(request, "index.html", datos)


#-------------------------------------------------------------------------------------

def mostrar_historial(request):
    estadoSesion = request.session.get("estadoSesion")
    nomUsuario = request.session.get("nomUsuario")

    if (estadoSesion and nomUsuario == "ADMIN"):

        historial = Historial.objects.all().values(
            'id',
            'descripcion_historial',
            'tabla_afectada_historial',
            'fecha_hora_historial',
            'usuario__nombre_usuario'
        ).order_by('-id')

        datos = {
            'nomUsuario': nomUsuario,
            'historial': historial
        }

        return render(request, "historial.html", datos)

    else:
        datos = {
            'r2': 'No tiene privilegios para acceder!!!'
        }

        return render(request, "index.html", datos)


#-------------------------------------------------------------------------------------


def cerrar_sesion(request):
    try:
        idUsuario = request.session['idUsuario']

        Historial.objects.create(
            usuario_id=idUsuario,
            descripcion_historial="Cierre de Sesión",
            tabla_afectada_historial="Usuario",
            fecha_hora_historial=datetime.now()
        )

        del request.session['nomUsuario']
        del request.session['estadoSesion']
        del request.session['idUsuario']

        return render(request, "index.html")

    except:
        return render(request, "index.html")

#-------------------------------------------------------------------------------------
