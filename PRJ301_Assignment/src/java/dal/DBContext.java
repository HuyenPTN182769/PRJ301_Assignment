/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mạc Huyền
 */
public abstract class DBContext<T> {
    protected Connection connection;
    
    public DBContext() {
        try {
            String user = "HuyenPTN";
            String pass = "182769";
            String url = "jdbc:sqlserver://localhost\\\\SQLEXPRESS:1433;databaseName=PRJ301_Assignment";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public abstract T get(String id); //SELECT * FROM WHERE id =
    public abstract ArrayList<T> schedule();//SELECT * FROM
}
