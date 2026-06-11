package com.lab;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static String url = "jdbc:mysql://localhost:3306/careassist";
    private static String user = "root";
    private static String pass = "Janeesha@02";
    private static Connection con;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
        } catch(Exception e) {
            System.out.println("Database is not connected!!");
        }
        return con;  
    }
}
