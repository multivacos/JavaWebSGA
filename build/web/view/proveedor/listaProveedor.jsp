<%-- 
    Document   : listaAlumno
    Created on : 29/06/2019, 02:58:58 PM
    Author     : Jonatan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="entity.Proveedor" %>
<%@page import="java.util.List" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proveedor</title>
    </head>
    <body>
    <section class="content-header">
        <h1>
            Proveedor <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Nuevo</button> <button type="button" class="btn btn-warning btn-lg" data-toggle="modal" data-target="#myModalSearch">Buscar</button>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Logística</li>
        </ol>
    </section>
 <section class="content">
    <div class="row">
        <div class="col-xs-12">
        <div class="box">
        <div class="box-body">
        
        <br>
        <table class="table table-bordered table-hover">
            
            <tr class="grilla_cabecera">
                <th>Id</th><th>Ruc</th><th>Razón social</th><th>Teléfono</th><th>Dirección</th><th>Eliminar</th><th>Editar</th>
            </tr>
            
            <% 
                List<Proveedor> data = (List<Proveedor>)request.getAttribute("data");
                if (data!=null) {
                        for(Proveedor x: data){
                        %>
                        <tr class="grilla_campo">
                            <td><%= x.getIdProveedor()%></td>
                            <td><%= x.getRuc()%></td>
                            <td><%= x.getRazonSocial()%></td>
                            <td><%= x.getTelefono()%></td>
                            <td><%= x.getDireccion()%></td>
                            <td>
                                <a href="proveedor?metodo=elimina&id=<%= x.getIdProveedor()%>">
                                    <img alt="Elimina" src="images/Delete.gif">
                                </a>
                            </td>
                            <td>
                                <a href="proveedor?metodo=busca&id=<%= x.getIdProveedor()%>">
                                    <img alt="Actualiza" src="images/Edit.gif">
                                </a>
                            </td>
                        </tr>
                        <%
                        }
                    }
            %>
        </table>
        </div>
        </div>
        </div>
    </div>
 </section>
       
      <!-- Modal - agregar -->
      <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Insertar nuevo proveedor</h4>
            </div>
            <div class="modal-body">
              <form action="proveedor" method="post" class="form-horizontal">
                <input type="hidden" name="metodo" value="registra">
                <div class="box-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">RUC</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" maxlength="11" name="ruc" placeholder="Inserta el numero de RUC" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">RAZON SOCIAL</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="razonSocial" placeholder="Inserta la razon social" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">TELEFONO</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" maxlength="9" name="telefono" placeholder="Inserta el telefono" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">DIRECCION</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="direccion" placeholder="Inserta la direccion" required>
                        </div>
                    </div>          
                    <div class="modal-footer">
                      <button type="submit" class="btn btn-success">Guardar</button>
                      <button type="reset" class="btn btn-warning">Limpiar</button>
                    </div>
            </form>
            </div>
          </div>

        </div>
      </div>
      </div>
      <!--Modal agregar - fin-->
      <!-- Modal - busqueda -->
      <div class="modal fade" id="myModalSearch" role="dialog">
        <div class="modal-dialog">

          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Buscar Proveedores</h4>
            </div>
            <div class="modal-body">
              <form action="proveedor" method="post" class="form-horizontal">
                <input type="hidden" name="metodo" value="ubica">
                <div class="box-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">RUC</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" maxlength="11" name="ruc" placeholder="Ingresa un numero">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">RAZON SOCIAL</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="razonSocial" placeholder="Ingresa una letra">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">TELEFONO</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" maxlength="9" name="telefono" placeholder="Ingresa un numero">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">DIRECCION</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="direccion" placeholder="Ingresa una letra">
                        </div>
                    </div>          
                    <div class="modal-footer">
                      <button type="submit" class="btn btn-success">Buscar</button>
                      <button type="reset" class="btn btn-warning">Limpiar</button>
                    </div>
            </form>
            </div>
          </div>

        </div>
      </div>
      </div>
      <!--Modal busqueda - fin-->
    </body>
</html>
