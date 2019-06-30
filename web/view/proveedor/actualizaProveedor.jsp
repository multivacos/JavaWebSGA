<%-- 
    Document   : actualizaAlumno
    Created on : 29/06/2019, 02:58:27 PM
    Author     : Jonatan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="entity.Proveedor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mantenimiento</title>
    </head>
    <body>
    <section class="content-header">
        <h1>
            Mantenimiento de proveedores
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
        <% Proveedor a = (Proveedor) request.getAttribute("data"); %>
        
        <form action="proveedor" method="post" class="form-horizontal">
            <input type="hidden" name="metodo" value="actualiza">
            <input type="hidden" name="id" value="<%= a.getIdProveedor()%>"
            <div class="box-body">
                <div class="form-group">
                    <label class="col-sm-2 control-label">ID</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="id" placeholder="" value="<%= a.getIdProveedor()%>" readonly="">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">RUC</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" maxlength="11" name="ruc" placeholder="" value="<%= a.getRuc()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">RAZON SOCIAL</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="razonSocial" placeholder="" value="<%= a.getRazonSocial()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">TELEFONO</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" maxlength="9" name="telefono" placeholder="" value="<%= a.getTelefono()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">DIRECCION</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="direccion" placeholder="" value="<%= a.getDireccion()%>">
                    </div>
                </div>
                    <div class="form-group" style="text-align: center;">
                    <button type="submit" value="guardar" class="btn btn-primary navbar-btn">Actualizar proveedor</button>
                </div>
        </form>
        </div>
    </div>
    </section>
    </body>
</html>
