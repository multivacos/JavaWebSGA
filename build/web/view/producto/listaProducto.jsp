<%@page import="java.util.List"%>
<%@page import="entity.Producto"%>
<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"></h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <table id="example2" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>DESCRIPCIÓN</th>
                                <th>FORMA</th>
                                <th>MATERIAL</th>
                                <th>TAMAÑO</th>
                                <th>COLOR</th>
                                <th>CLASIFICACIÓN</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                List<Producto> dataProd = (List<Producto>) request.getAttribute("lsProducto");
                                int i=1;
                                if (dataProd.size()>0) {
                                    for (Producto x : dataProd) {%>
                            <tr class="grilla_campo">
                                <td><%= i  %></td>
                                <td><%=x.getDescripcion()%></td>
                                <td><%=x.getForma()%></td>
                                <td><%=x.getMaterial()%></td>
                                <td><%=x.getTamanio()%></td>
                                <td><%=x.getColor()%></td>
                                <td><%=x.getNomClase() %></td>
                                <td>
                                    <a id="lnkEliminar" reg="<%=x.getIdProducto()%>" href="#">
                                        <img alt="Eliminar" src="images/Delete.gif">
                                    </a>

                                    <a id="lnkEditar" reg="<%=x.getIdProducto()%>" href="#">
                                        <img alt="Actualiza" src="images/Edit.gif">
                                    </a>

                                </td>     


                            </tr>
                            <% i++;
                                    }
                                }else{%>
                            
                                <tr><td colspan="8" align="center"><b>No se encontraron registros.</b></td></tr>
                            <%}
                            %>

                        </tbody>
                        <tfoot>
                            <tr>
                                <th>ID</th>
                                <th>DESCRIPCIÓN</th>
                                <th>FORMA</th>
                                <th>MATERIAL</th>
                                <th>TAMAÑO</th>
                                <th>COLOR</th>
                                <th>CLASIFICACIÓN</th>
                                <th></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->

        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>
<!-- /.content -->