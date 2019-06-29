/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.Clase;
import entity.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ClaseModel;
import model.ProductoModel;
import util.ViewResolve;

/**
 *
 * @author MELANY
 */
public class ProductoService {

    public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ClaseModel model = new ClaseModel();
        List<Clase> data = model.listaClase();

        request.setAttribute("lsClase", data);
        ViewResolve.showMain("producto/index.jsp", request, response);
    }

    public void registra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String descripcion = request.getParameter("txtDescripcion");
        String forma = request.getParameter("txtForma");
        String material = request.getParameter("txtMaterial");
        String tamanio = request.getParameter("txtTamanio");
        String color = request.getParameter("txtColor");
        String clase = request.getParameter("sltClasificacion");

        descripcion=(descripcion!=null)?descripcion.toUpperCase():descripcion;
        forma=(forma!=null)?forma.toUpperCase():forma;
        material=(material!=null)?material.toUpperCase():material;
        tamanio=(tamanio!=null)?tamanio.toUpperCase():tamanio;
        color=(color!=null)?color.toUpperCase():color;
        
        Producto p = new Producto();
        p.setDescripcion(descripcion);
        p.setForma(forma);
        p.setMaterial(material);
        p.setTamanio(tamanio);
        p.setColor(color);
        p.setIdClase(Integer.parseInt(clase));

        ProductoModel pm = new ProductoModel();
        pm.insertProducto(p);

        PrintWriter out = response.getWriter();

        out.println("{\"estado\":\"OK\",\"mensaje\":\"Se guardo correctamente\"}");

    }

    public void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String descripcion = request.getParameter("txtBusDescripcion");
        String forma = request.getParameter("txtBusForma");
        String material = request.getParameter("txtBusMaterial");
        String clase = request.getParameter("sltBusClasificacion");
        Integer idcla = null;
        if (clase != null && !clase.equals("")) {
            idcla = Integer.parseInt(clase);
        }

        descripcion=(descripcion!=null)?descripcion.toUpperCase():descripcion;
        forma=(forma!=null)?forma.toUpperCase():forma;
        material=(material!=null)?material.toUpperCase():material;

        
        Producto p = new Producto();
        p.setDescripcion(descripcion);
        p.setForma(forma);
        p.setMaterial(material);
        p.setIdClase(idcla);

        ProductoModel model = new ProductoModel();
        List<Producto> data = model.listaProducto(p);

        request.setAttribute("lsProducto", data);

        //request.getRequestDispatcher("/view/producto/listaProducto.jsp").forward(request, response);
        ViewResolve.show("producto/listaProducto.jsp", request, response);

    }

    
    public void actualiza(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String descripcion = request.getParameter("txtDescripcion");
        String forma = request.getParameter("txtForma");
        String material = request.getParameter("txtMaterial");
        String tamanio = request.getParameter("txtTamanio");
        String color = request.getParameter("txtColor");
        String clase = request.getParameter("sltClasificacion");
        int id = Integer.parseInt(request.getParameter("id"));
        
        descripcion=(descripcion!=null)?descripcion.toUpperCase():descripcion;
        forma=(forma!=null)?forma.toUpperCase():forma;
        material=(material!=null)?material.toUpperCase():material;
        tamanio=(tamanio!=null)?tamanio.toUpperCase():tamanio;
        color=(color!=null)?color.toUpperCase():color;
        
        Producto p = new Producto();
        p.setIdProducto(id);
        p.setDescripcion(descripcion);
        p.setForma(forma);
        p.setMaterial(material);
        p.setTamanio(tamanio);
        p.setColor(color);
        p.setIdClase(Integer.parseInt(clase));

        ProductoModel pm = new ProductoModel();
        pm.actualizarProdcuto(p);

        PrintWriter out = response.getWriter();

        out.println("{\"estado\":\"OK\",\"mensaje\":\"Se guardo correctamente\"}");
        

    }
     
    public void load(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        request.setAttribute("metodo", new String("registra"));
        if (id != null && !id.isEmpty()) {
            ProductoModel model = new ProductoModel();
            Producto a = model.buscaProducto(Integer.parseInt(id));

            request.setAttribute("metodo", new String("actualiza"));
            request.setAttribute("dataProd", a);

        }

        ClaseModel model = new ClaseModel();
        List<Clase> data = model.listaClase();

        request.setAttribute("lsClase", data);

        ViewResolve.show("producto/MProducto.jsp", request, response);
    }

    public void elimina(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        if (!id.isEmpty()) {
            ProductoModel model = new ProductoModel();
            model.eliminarProducto(Integer.parseInt(id));

            PrintWriter out = response.getWriter();

            out.println("{\"estado\":\"OK\",\"mensaje\":\"Se elimino correctamente\"}");
        }

    }
}
