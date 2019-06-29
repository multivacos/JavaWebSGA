/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    loadListaProducto();
    function loadListaProducto() {
        var prm = $("#frmBuscarProducto").serialize();
        $.post("producto", prm, function (data) {

            $("#divResultado").html(data)


        });
    }

    $("#btnBuscarProd").click(function (e) {
        e.preventDefault();

        loadListaProducto();
    });

    $("#btnNuevoProd").click(function (e) {
        e.preventDefault();
        var prm = {
            "metodo": "load"
        };
        $.post("producto", prm, function (data) {
            $("#modal-producto .modal-body").html(data);

        });

        $("#modal-producto").modal('show');
    });
    $("#modal-producto").on("click", "#btnGuardarProd", function (e) {
        e.preventDefault();
        var prm = $("#modal-producto").find("#frmProducto").serialize();
        if ($("#modal-producto").find("#txtDescripcion").val() == null || $("#modal-producto").find("#txtDescripcion").val() == "") {

            $("#modal-alert-mensaje").html("Debe ingresar una descripción");
            $("#modal-alert").modal('show');
            return;
        }
        if ($("#modal-producto").find("#sltClasificacion").val() == null || $("#modal-producto").find("#sltClasificacion").val() == 0) {

            $("#modal-alert-mensaje").html("Debe ingresar una clasificación");
            $("#modal-alert").modal('show');
            return;
        }

        $.post("producto", prm, function (data) {
            if (data.estado == "OK") {
                $("#modal-producto").modal('hide');
                loadListaProducto();
                //alert(data.mensaje);
            } else {
                //alert(data.mensaje);
            }
            $("#modal-alert-mensaje").html(data.mensaje);
            $("#modal-alert").modal('show');
            $("#frmProducto")[0].reset();

        }, "json");


    });

    $("#divResultado").on("click", "#lnkEliminar", function (e) {

        e.preventDefault();
        var idreg = $(this).attr("reg");
        var prm = {
            "metodo": "elimina",
            "id": idreg
        };



        $.post("producto", prm, function (data) {
            if (data.estado == "OK") {
                loadListaProducto();
                $("#modal-alert-mensaje").html(data.mensaje);
                $("#modal-alert").modal('show');
            }


        }, "json");


    });

    $("#divResultado").on("click", "#lnkEditar", function (e) {

        e.preventDefault();
        var idreg = $(this).attr("reg");
        var prm = {
            "metodo": "load",
            "id": idreg
        };

        $.post("producto", prm, function (data) {
            $("#modal-producto .modal-body").html(data);

        });

        $("#modal-producto").modal('show');


    });
});

