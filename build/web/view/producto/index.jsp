<%@page import="java.util.List"%>
<%@page import="entity.Clase"%>
<script src="js/producto.js"></script>
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Producto
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Logística</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <!-- Small boxes (Stat box) -->
    <div class="row">
        <div class="col-md-12">
            <!-- Horizontal Form -->
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title"></h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form id="frmBuscarProducto" class="form-horizontal">
                    <input type="hidden" name="metodo" value="lista" />
                    <div class="box-body">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">Descripción</label>

                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="txtBusDescripcion" name="txtBusDescripcion" placeholder="Descripción">
                            </div>
                            <label  class="col-sm-2 control-label">Forma</label>

                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="txtBusForma" name="txtBusForma" placeholder="Forma">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">Material</label>

                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="txtBusMaterial" name="txtBusMaterial" placeholder="Material">
                            </div>
                            <label  class="col-sm-2 control-label">Clasificación</label>

                            <div class="col-sm-4">
                                <select class="form-control"name="sltBusClasificacion">
                                    <option value="0">--Seleccione--</option>

                                    <%
                                        List<Clase> dataBusClase = (List<Clase>) request.getAttribute("lsClase");
                                        if (dataBusClase != null) {
                                            for (Clase busCl : dataBusClase) {%>


                                    <option value="<%=busCl.getIdClase()%>"><%=busCl.getDescripcion()%></option>
                                    <% }
                                        }%>
                                </select>
                            </div>
                        </div>

                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">

                        <button id="btnBuscarProd" type="submit" class="btn btn-info ">Buscar</button>
                        <button type="reset" class="btn btn-default">Cancelar</button>
                        <button id="btnNuevoProd" type="button" class="btn btn-primary pull-right">
                            Nuevo
                        </button>
                    </div>
                    <!-- /.box-footer -->
                </form>
            </div>
        </div>


</section>

<div class="modal fade" id="modal-producto">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Producto</h4>
            </div>
            <div class="modal-body">





            </div>
            <!--<div class="modal-footer">

            </div>-->
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div id="divResultado" style="overflow: auto">

</div>

<script>
    $(function () {

        $('#example2').DataTable({
            'paging': true,
            'lengthChange': false,
            'searching': false,
            'ordering': true,
            'info': true,
            'autoWidth': false
        })
    })
</script>