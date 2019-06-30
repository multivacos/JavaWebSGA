package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MysqlDBConexion 
{
    public static Connection getConexion() throws SQLException{
        Connection conn;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MysqlDBConexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bdsga","root","");
        return conn;
    }		
}