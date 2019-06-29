/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Clase;
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
public class ClaseModel {

    public List<Clase> listaClase() {

        List<Clase> data = new ArrayList<>();
        try {
            Connection conn;
            PreparedStatement pstm;
            ResultSet rs;
            conn = MysqlDBConexion.getConexion();
            String sql = "select * from clase";
            pstm = conn.prepareStatement(sql);
            rs = pstm.executeQuery();
            Clase c;

            while (rs.next()) {
                c = new Clase();
                c.setIdClase(rs.getInt("id_clase"));
                c.setDescripcion(rs.getString("descripcion"));
                c.setIdClasePadre(rs.getInt("id_clase_padre"));

                data.add(c);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ClaseModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return data;

    }

  
}
