/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.Almacen;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AlmacenModel;
import util.ViewResolve;

/**
 *
 * @author Joseph
 */
public class AlmacenService {
        public void registra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Se obtiene los parametros
        
        String descripcion = request.getParameter("descripcion");
        String direccion = request.getParameter("direccion");
 
        
        //Se crea el objeto proveedor
        Almacen a = new Almacen();
        a.setDescripcion(descripcion);
        a.setDireccion(direccion);
    

        //Se inserta a la BD el proveedor
        AlmacenModel model = new AlmacenModel();
        model.insertarAlmacen(a);
        
        //Se lista todos los proveedores
        lista(request, response);
        
    }
    
    public void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AlmacenModel model = new AlmacenModel();
        List<Almacen> data = model.listaAlmacen();
        
        //Se almacena en memoria llamada request
        request.setAttribute("data", data);
        
        //Se reenvia el request (con los datos) al jsp listaProveedor.jsp
        ViewResolve.showMain("almacen/listaAlmacen.jsp", request, response);
    }
    
    public void actualiza(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Se obtiene los parametros
        String descripcion = request.getParameter("descripcion");
        String direccion = request.getParameter("direccion");
        int id = Integer.parseInt(request.getParameter("id"));
        
        //Se crea el objeto proveedor
        Almacen a = new Almacen();
        a.setIdAlmacen(id);
        a.setDescripcion(descripcion);
        a.setDireccion(direccion);

        
        //Se inserta a la BD el proveedor
        AlmacenModel model = new AlmacenModel();
        model.actualizaAlmacen(a);
        
        //Se lista todos los proveedores
        lista(request, response);
    }
    
    public void busca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Se obtiene los parametros
        String id = request.getParameter("id");
        
        //Se inserta a la BD el proveedor
        AlmacenModel model = new AlmacenModel();
        Almacen a = model.buscaAlmacen(Integer.parseInt(id));
        
        //Se almacena en memoria llamada request
        request.setAttribute("data", a);
        
        //Se reenvia el request (con los datos) al jsp listaAlumno.jsp
        ViewResolve.showMain("almacen/actualizaAlmacen.jsp", request, response);
    }
    
    public void elimina(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Se obtiene los parametros
        String id = request.getParameter("id");
        
        //Se elimina
        AlmacenModel model = new AlmacenModel();
        model.eliminaAlmacen(Integer.parseInt(id));
        //Se lista
        lista(request, response);
    } 
        
    public void ubica(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String descripcion = request.getParameter("descripcion");
        String direccion = request.getParameter("direccion");
        
        Almacen p = new Almacen();
        p.setDescripcion(descripcion);
        p.setDireccion(direccion);

        AlmacenModel model = new AlmacenModel();
        List<Almacen> data = model.listaUbicaAlmacen(p);
        
        //Se almacena en memoria llamada request
        request.setAttribute("data", data);
        
        //Se reenvia el request (con los datos) al jsp listaProveedor.jsp
        ViewResolve.showMain("almacen/listaAlmacen.jsp", request, response);
    }
}
