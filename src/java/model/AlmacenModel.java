/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import entity.Almacen;
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
 * @author Joseph
 */
public class AlmacenModel {
    public int insertarAlmacen(Almacen obj){
        int salida = -1;
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = MysqlDBConexion.getConexion();
            String sql = "insert into almacen values(null,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, obj.getDescripcion());
            pstm.setString(2, obj.getDireccion());

            salida = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AlmacenModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salida;
    }
    
    //metodo 2 listar
    public ArrayList<Almacen> listaAlmacen(){
        ArrayList<Almacen> data = new ArrayList<>();
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = MysqlDBConexion.getConexion();
            ResultSet rs;
            String sql = "select * from almacen";
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            
            Almacen obj;
            while(rs.next()){
                obj = new Almacen();
                obj.setIdAlmacen(rs.getInt("id_almacen"));
                obj.setDescripcion(rs.getString("descripcion"));
                obj.setDireccion(rs.getString("direccion"));

                data.add(obj);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AlmacenModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
    
    //Metodo 3 actualizar
    public int actualizaAlmacen(Almacen obj){
        int salida = -1;
        try {
            Connection conn;
            PreparedStatement pstm;
            conn = MysqlDBConexion.getConexion();
            String sql = "update almacen set descripcion=?,direccion=?  where id_almacen=?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, obj.getDescripcion());
            pstm.setString(2, obj.getDireccion());
            pstm.setInt(3, obj.getIdAlmacen());

            salida = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AlmacenModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salida;
    }
    
    //Metodo 4 buscar
    public Almacen buscaAlmacen(int idAlmacen){
        Almacen obj = null;
        try {
            Connection conn;
            PreparedStatement pstm;
            ResultSet rs;
            conn = MysqlDBConexion.getConexion();
            String sql = "select * from almacen where id_almacen=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idAlmacen);
            rs = pstm.executeQuery();
            
            if (rs.next()) {
                obj = new Almacen();
                obj.setIdAlmacen(rs.getInt("id_almacen"));
                obj.setDescripcion(rs.getString("descripcion"));
                obj.setDireccion(rs.getString("direccion"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AlmacenModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }
    
    //Metodo 5 eliminar
    public int eliminaAlmacen(int idProveedor){
        int salida = -1;
        try {
            Connection conn;
            PreparedStatement pstm;
            conn = MysqlDBConexion.getConexion();
            String sql = "delete from almacen where id_almacen=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idProveedor);
            salida = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AlmacenModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salida;
    }
    
    public List<Almacen> listaUbicaAlmacen(Almacen p){
        ArrayList<Almacen> data = new ArrayList<>();
        try {
            PreparedStatement pstm;
            Connection conn;
            conn = MysqlDBConexion.getConexion();
            ResultSet rs;
            String sql = "select * from almacen  where descripcion like '%" + p.getDescripcion()+ "%' and direccion like '%" + p.getDireccion()+ "%' ";
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            
            Almacen obj;
            while(rs.next()){
                obj = new Almacen();
                obj.setIdAlmacen(rs.getInt("id_almacen"));
                obj.setDescripcion(rs.getString("descripcion"));
                obj.setDireccion(rs.getString("direccion"));
                data.add(obj);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AlmacenModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;
    }
}
