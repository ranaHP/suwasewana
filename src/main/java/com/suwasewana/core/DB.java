package com.suwasewana.core;

import java.sql.*;
public class DB {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/suwasewana_final?allowMultiQueries=true";
    //   private String jdbcUsername = "root";
    //    private String jdbcPassword = "cybertcc123";
    //    private final String jdbcURL = "Mysql@127.0.0.1:3306/suwasewana_db";
   //private String jdbcUsername = "root";
   // private String jdbcPassword = "";


    private String jdbcUsername = "root";

    private String jdbcPassword = "";
//    private String jdbcPassword = "1234@Akila";

//    private String jdbcPassword = "";




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
