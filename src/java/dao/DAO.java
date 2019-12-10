package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO {
    public static Connection con;
    public DAO(){
    }
    public void getDBConnection() {
        if (con == null) {
            String dbUrl = "jdbc:mysql://localhost:3306/laptrinhweb";
            String dbDriver = "com.mysql.jdbc.Driver";
            try {
                Class.forName(dbDriver);
                con = DriverManager.getConnection(dbUrl, "root", "Ngohung98vn");
            } catch (Exception e) {
                e.printStackTrace();
            }
            
        }
    }
}


