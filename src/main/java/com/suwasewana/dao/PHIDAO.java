package com.suwasewana.dao;


import com.suwasewana.core.DB;
import com.suwasewana.model.ComplainModel;
import com.suwasewana.model.ComplainTypeModel;
import com.suwasewana.model.PHIModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PHIDAO {
    @SuppressWarnings("SqlResolve")
    private static final String SELECT_phi="SELECT * FROM suwaserwana_db.phi_officer;";
    Connection connection;

    public PHIDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }

    public ArrayList<PHIModel> GetPHIDetails() {
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_phi)) {
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<PHIModel>phiList = new ArrayList<PHIModel>();
            while (rs.next()) {
                String name = rs.getString("full_name");
                String id = rs.getString("mohId");
                String pid=rs.getString("phi_Id");
                PHIModel temp = new PHIModel(
                        id,
                        name,
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        pid
                );
//
                phiList.add(temp);
            }
            return phiList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }


    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }





}
