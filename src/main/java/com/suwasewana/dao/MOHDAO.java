package com.suwasewana.dao;


import com.suwasewana.core.DB;
import com.suwasewana.model.ComplainModel;
import com.suwasewana.model.ComplainTypeModel;
import com.suwasewana.model.MOHModel;
import com.suwasewana.model.MOHRegModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MOHDAO {
//    @SuppressWarnings("SqlResolve")

    private static final String MOH_Detail="SELECT * FROM suwaserwana_db.moh;";
    Connection connection;

    public MOHDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }

    public ArrayList<MOHModel> GetMOHDetails() {

        try (PreparedStatement preparedStatement = connection.prepareStatement(MOH_Detail)) {

            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<MOHModel> mohList = new ArrayList<MOHModel>();
            while (rs.next()) {

                String id = rs.getString("idMOH");
                String name = rs.getString("MName");
                MOHModel temp = new MOHModel(
                        id,
                        name,
                        "",
                        ""

                );
//
                mohList.add(temp);
            }
            return mohList;

        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }


    public ArrayList<MOHRegModel> GetallMOHDetails() {

        try (PreparedStatement preparedStatement = connection.prepareStatement(MOH_Detail)) {

            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<MOHRegModel> mohList = new ArrayList<MOHRegModel>();
            while (rs.next()) {

                String name = rs.getString("MName");
                String District = rs.getString("District");
                String Head = rs.getString("MHead");
                String Mobile = rs.getString("TpNo");

                MOHRegModel temp = new MOHRegModel(
                        name,
                        Mobile,
                        Head,
                        "",
                        "",
                        District,
                        "",
                        "",
                        ""
                );
                System.out.println("Moh district "+ temp.getDistrict());
                mohList.add(temp);
            }
            return mohList;

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
