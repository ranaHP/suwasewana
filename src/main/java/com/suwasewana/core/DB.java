package com.suwasewana.core;

import java.sql.*;

public class DB {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/javaeemvc";
    private String jdbcUsername = "root";
    private String jdbcPassword = "cybertcc123";
    public Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }


}
