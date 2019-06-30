/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.Proveedor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ProveedorModel;
import util.ViewResolve;

/**
 *
 * @author Jonatan
 */
public class ProveedorService {
    public void registra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Se obtiene los parametros
        String ruc = request.getParameter("ruc");
        String razonSocial = request.getParameter("razonSocial");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        
        //Se crea el objeto proveedor
        Proveedor a = new Proveedor();
        a.setRuc(ruc);
        a.setRazonSocial(razonSocial);
        a.setTelefono(telefono);
        a.setDireccion(direccion);

        //Se inserta a la BD el proveedor
        ProveedorModel model = new ProveedorModel();
        model.insertarProveedor(a);
        
        //Se lista todos los proveedores
        lista(request, response);
        
    }
    
    public void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProveedorModel model = new ProveedorModel();
        List<Proveedor> data = model.listaProveedor();
        
        //Se almacena en memoria llamada request
        request.setAttribute("data", data);
        
        //Se reenvia el request (con los datos) al jsp listaProveedor.jsp
        ViewResolve.showMain("proveedor/listaProveedor.jsp", request, response);
    }
    
    public void actualiza(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Se obtiene los parametros
        String ruc = request.getParameter("ruc");
        String razonSocial = request.getParameter("razonSocial");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        int id = Integer.parseInt(request.getParameter("id"));
        
        //Se crea el objeto proveedor
        Proveedor a = new Proveedor();
        a.setIdProveedor(id);
        a.setRuc(ruc);
        a.setRazonSocial(razonSocial);
        a.setTelefono(telefono);
        a.setDireccion(direccion);
        
        //Se inserta a la BD el proveedor
        ProveedorModel model = new ProveedorModel();
        model.actualizaProveedor(a);
        
        //Se lista todos los proveedores
        lista(request, response);
    }
    
    public void busca(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Se obtiene los parametros
        String id = request.getParameter("id");
        
        //Se inserta a la BD el proveedor
        ProveedorModel model = new ProveedorModel();
        Proveedor a = model.buscaProveedor(Integer.parseInt(id));
        
        //Se almacena en memoria llamada request
        request.setAttribute("data", a);
        
        //Se reenvia el request (con los datos) al jsp listaAlumno.jsp
        ViewResolve.showMain("proveedor/actualizaProveedor.jsp", request, response);
    }
    
    public void elimina(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Se obtiene los parametros
        String id = request.getParameter("id");
        
        //Se elimina
        ProveedorModel model = new ProveedorModel();
        model.eliminaProveedor(Integer.parseInt(id));
        //Se lista
        lista(request, response);
    } 
        
    public void ubica(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ruc = request.getParameter("ruc");
        String razonSocial = request.getParameter("razonSocial");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        
        Proveedor p = new Proveedor();
        p.setRuc(ruc);
        p.setRazonSocial(razonSocial);
        p.setTelefono(telefono);
        p.setDireccion(direccion);
        ProveedorModel model = new ProveedorModel();
        List<Proveedor> data = model.listaUbicaProveedor(p);
        
        //Se almacena en memoria llamada request
        request.setAttribute("data", data);
        
        //Se reenvia el request (con los datos) al jsp listaProveedor.jsp
        ViewResolve.showMain("proveedor/listaProveedor.jsp", request, response);
    }
    
}
