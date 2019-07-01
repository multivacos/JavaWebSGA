<%-- 
    Document   : actualizaAlmacen
    Created on : 30/06/2019, 06:26:25 PM
    Author     : Joseph
--%>

<%@page import="entity.Almacen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento</title>
    </head>
    <body>
    <section class="content-header">
        <h1>
            Mantenimiento de almacenes
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Logística</li>
        </ol>
    </section>
    <section class="content">
    <div class="container">
        <div class="col-xs-12">        
        <br>        
        <% Almacen a = (Almacen) request.getAttribute("data"); %>
        
        <form action="almacen" method="post" class="form-horizontal">
            <input type="hidden" name="metodo" value="actualiza">
            <input type="hidden" name="id" value="<%= a.getIdAlmacen()%>"
            <div class="box-body">
                <div class="form-group">
                    <label class="col-sm-2 control-label">ID</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="id" placeholder="" value="<%= a.getIdAlmacen()%>" readonly="">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">DESCRIPCION</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control"  name="descripcion" placeholder="" value="<%= a.getDescripcion()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">DIRECCION</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="direccion" placeholder="" value="<%= a.getDireccion()%>">
                    </div>
                </div>
                
                    <div class="form-group" style="text-align: center;">
                    <button type="submit" value="guardar" class="btn btn-primary navbar-btn">Actualizar almacen</button>
                </div>
        </form>
        </div>
    </div>
    </section>
    </body>
</html>

