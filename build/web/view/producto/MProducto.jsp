<%@page import="entity.Producto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="entity.Clase"%>
<!-- form start -->
<% String strMetodo = (String) request.getAttribute("metodo");%>
<% Producto dataProd = (Producto) request.getAttribute("dataProd");%>
<form id="frmProducto" class="form-horizontal">
    <input type="hidden" name="metodo" value="<%= strMetodo %>" />
    <input type="hidden" name="id" value="<%= (dataProd!=null?dataProd.getIdProducto():"") %>" />
    <div class="box-body">
        <div class="form-group">
            <label class="col-sm-2 control-label">Código</label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="txtCodigo" name="txtCodigo" placeholder="" value="<%= (dataProd!=null?dataProd.getIdProducto():"") %>" readonly="">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">Descripción</label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="txtDescripcion" name="txtDescripcion" placeholder="Descripción" value="<%= (dataProd!=null?dataProd.getDescripcion():"") %>">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">Forma</label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="txtForma" name="txtForma" placeholder="Forma" value="<%= (dataProd!=null?dataProd.getForma():"")%>">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">Material</label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="txtMaterial" name="txtMaterial" placeholder="Material" value="<%= (dataProd!=null?dataProd.getMaterial():"")%>" >
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">Tamaño</label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="txtTamanio" name="txtTamanio" placeholder="Tamaño" value="<%= (dataProd!=null?dataProd.getTamanio():"")%>">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">Color</label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="txtColor" name="txtColor" placeholder="Color" value="<%= (dataProd!=null?dataProd.getColor():"")%>">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">Clasificación</label>

            <div class="col-sm-10">
                <select class="form-control"  id="sltClasificacion" name="sltClasificacion">
                    <option value="0">--Seleccione--</option>

                    <%
                        List<Clase> data = (List<Clase>) request.getAttribute("lsClase");
                        if (data != null) {
                            for (Clase cl : data) {
                                if (dataProd!=null && cl.getIdClase() == dataProd.getIdClase()) {
                    %>


                    <option value="<%=cl.getIdClase()%>" selected><%=cl.getDescripcion()%></option>
                    <%} else {

                        }%>
                    <option value="<%=cl.getIdClase()%>"><%=cl.getDescripcion()%></option>
                    <% }
                        }%>
                </select>

            </div>
        </div>
    </div>
    <!-- /.box-body -->
    <div class="box-footer">
        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancelar</button>
        <button id="btnGuardarProd" type="button" class="btn btn-primary pull-right">Guardar</button>
    </div>
    <!-- /.box-footer -->
</form>
