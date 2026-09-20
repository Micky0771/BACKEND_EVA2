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
            
            datos = {
                'nomUsuario': nom.upper()
            }
            
            return render(request, "menu.html", datos)
        
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
    return render(request, "listado.html")

#-------------------------------------------------------------------------------------

def mostrar_form_reg(request):
    return render(request, "form_reg.html")

#-------------------------------------------------------------------------------------

def mostrar_form_act(request):
    return render(request, "form_act.html")

#-------------------------------------------------------------------------------------

def cerrar_sesion(request):
    try:
        del request.session['nomUsuario']
        del request.session['estadoSesion']
        del request.session['idUsuario']
        
        return render(request, "index.html")
    
    except:
        return render(request, "index.html")
    

#-------------------------------------------------------------------------------------
