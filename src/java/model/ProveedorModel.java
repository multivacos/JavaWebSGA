/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Proveedor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.MysqlDBConexion;

/**
 *
 * @author Jonatan
 */
public class ProveedorModel {
    //Metodo insertar
    public int insertarProveedor(Proveedor obj){
        int salida = -1;
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = MysqlDBConexion.getConexion();
            String sql = "insert into proveedor values(null,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, obj.getRuc());
            pstm.setString(2, obj.getRazonSocial());
            pstm.setString(3, obj.getTelefono());
            pstm.setString(4, obj.getDireccion());
            salida = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProveedorModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salida;
    }
    
    //metodo 2 listar
    public ArrayList<Proveedor> listaProveedor(){
        ArrayList<Proveedor> data = new ArrayList<>();
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = MysqlDBConexion.getConexion();
            ResultSet rs;
            String sql = "select * from proveedor";
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            
            Proveedor obj;
            while(rs.next()){
                obj = new Proveedor();
                obj.setIdProveedor(rs.getInt("id_proveedor"));
                obj.setRuc(rs.getString("ruc"));
                obj.setRazonSocial(rs.getString("razon_social"));
                obj.setTelefono(rs.getString("telefono"));
                obj.setDireccion(rs.getString("direccion"));
                data.add(obj);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProveedorModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    //Metodo 3 actualizar
    public int actualizaProveedor(Proveedor obj){
        int salida = -1;
        try {
            Connection conn;
            PreparedStatement pstm;
            conn = MysqlDBConexion.getConexion();
            String sql = "update proveedor set ruc=?,razon_social=?, telefono=?, direccion=? where id_proveedor=?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, obj.getRuc());
            pstm.setString(2, obj.getRazonSocial());
            pstm.setString(3, obj.getTelefono());
            pstm.setString(4, obj.getDireccion());
            pstm.setInt(5, obj.getIdProveedor());
            salida = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProveedorModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salida;
    }
    
    //Metodo 4 buscar
    public Proveedor buscaProveedor(int idProveedor){
        Proveedor obj = null;
        try {
            Connection conn;
            PreparedStatement pstm;
            ResultSet rs;
            conn = MysqlDBConexion.getConexion();
            String sql = "select * from proveedor where id_proveedor=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idProveedor);
            rs = pstm.executeQuery();
            
            if (rs.next()) {
                obj = new Proveedor();
                obj.setIdProveedor(rs.getInt("id_proveedor"));
                obj.setRuc(rs.getString("ruc"));
                obj.setRazonSocial(rs.getString("razon_social"));
                obj.setTelefono(rs.getString("telefono"));
                obj.setDireccion(rs.getString("direccion"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProveedorModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }
    
    //Metodo 5 eliminar
    public int eliminaProveedor(int idProveedor){
        int salida = -1;
        try {
            Connection conn;
            PreparedStatement pstm;
            conn = MysqlDBConexion.getConexion();
            String sql = "delete from proveedor where id_proveedor=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idProveedor);
            salida = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProveedorModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salida;
    }
    
    public List<Proveedor> listaUbicaProveedor(Proveedor p){
        ArrayList<Proveedor> data = new ArrayList<>();
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = MysqlDBConexion.getConexion();
            ResultSet rs;
            String sql = "select * from proveedor  where ruc like '%" + p.getRuc() + "%' and razon_social like '%" + p.getRazonSocial()+ "%' and telefono like '%" + p.getTelefono()+ "%' and direccion like '%" + p.getDireccion()+ "%'";
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            
            Proveedor obj;
            while(rs.next()){
                obj = new Proveedor();
                obj.setIdProveedor(rs.getInt("id_proveedor"));
                obj.setRuc(rs.getString("ruc"));
                obj.setRazonSocial(rs.getString("razon_social"));
                obj.setTelefono(rs.getString("telefono"));
                obj.setDireccion(rs.getString("direccion"));
                data.add(obj);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProveedorModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
}
