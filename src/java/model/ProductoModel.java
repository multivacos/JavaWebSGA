/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Producto;
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
 * @author MELANY
 */
public class ProductoModel {

    public int insertProducto(Producto p) {
        int salida = -1;
        try {
            Connection conn;
            PreparedStatement pstm;
            conn = MysqlDBConexion.getConexion();
            String sql = "insert into producto values(null,?,?,?,?,?,?)";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, p.getDescripcion());

            pstm.setString(2, p.getTamanio());
            pstm.setString(3, p.getColor());
            pstm.setString(4, p.getForma());
            pstm.setString(5, p.getMaterial());
            pstm.setInt(6, p.getIdClase());
            salida = pstm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductoModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salida;
    }

    public List<Producto> listaProducto(Producto p) {

        List<Producto> data = new ArrayList<>();
        try {
            Connection conn;
            PreparedStatement pstm;
            ResultSet rs;
            conn = MysqlDBConexion.getConexion();
            String sql = "select p.*,c.descripcion as nom_clase\n"
                    + "from producto p\n"
                    + "inner join clase c on p.id_clase=c.id_clase\n"
                    + "where 1=1 ";

            if (p.getDescripcion() != null && p.getDescripcion() != "") {
                sql += " and p.descripcion like '%" + p.getDescripcion() + "%'";
            }
            if (p.getForma() != null && p.getForma() != "") {
                sql += " and p.forma like '%" + p.getForma() + "%'";
            }
            if (p.getMaterial() != null && p.getMaterial() != "") {
                sql += " and p.material like '%" + p.getMaterial() + "%'";
            }
            if (p.getIdClase() != null && p.getIdClase() != 0) {
                sql += " and p.id_clase=" + p.getIdClase();
            }
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            Producto regProd;

            while (rs.next()) {
                regProd = new Producto();
                regProd.setIdProducto(rs.getInt("id_producto"));
                regProd.setDescripcion(rs.getString("descripcion"));
                regProd.setForma(rs.getString("forma"));
                regProd.setMaterial(rs.getString("material"));
                regProd.setTamanio(rs.getString("tamanio"));
                regProd.setColor(rs.getString("color"));
                regProd.setIdClase(rs.getInt("id_clase"));
                regProd.setNomClase(rs.getString("nom_clase"));
                data.add(regProd);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductoModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;

    }

    public int actualizarProdcuto(Producto p) {
        int salida = -1;
        try {
            Connection conn;
            PreparedStatement pstm;
            conn = MysqlDBConexion.getConexion();
            String sql = "update  producto set descripcion=?, forma=?, material=?,tamanio=?, color=?, id_clase=? where id_producto=?";
            pstm = conn.prepareStatement(sql);

            pstm.setString(1, p.getDescripcion());
            pstm.setString(2, p.getForma());
            pstm.setString(3, p.getMaterial());
            pstm.setString(4, p.getTamanio());
            pstm.setString(5, p.getColor());
            pstm.setInt(6, p.getIdClase());
            pstm.setInt(7, p.getIdProducto());
            salida = pstm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductoModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salida;
    }

    public Producto buscaProducto(int id) {

        Producto p = null;
        try {
            Connection conn;
            PreparedStatement pstm;
            ResultSet rs;
            conn = MysqlDBConexion.getConexion();
            String sql = "select * from producto where id_producto=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();

            if (rs.next()) {
                p = new Producto();
                p.setIdProducto(rs.getInt("id_producto"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setForma(rs.getString("forma"));
                p.setMaterial(rs.getString("material"));
                p.setTamanio(rs.getString("tamanio"));
                p.setColor(rs.getString("color"));
                p.setIdClase(rs.getInt("id_clase"));

            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductoModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;

    }

    public int eliminarProducto(int id) {
        int salida = -1;
        try {
            Connection conn;
            PreparedStatement pstm;
            conn = MysqlDBConexion.getConexion();
            String sql = "delete from producto where id_producto=?";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, id);
            salida = pstm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductoModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salida;
    }
}
