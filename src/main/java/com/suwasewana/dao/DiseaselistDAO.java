package com.suwasewana.dao;

import com.google.gson.Gson;
import com.suwasewana.core.DB;
import com.suwasewana.model.UserDiseaseModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DiseaselistDAO {
    @SuppressWarnings("SqlResolve")
    private Gson gson = new Gson();
    Connection connection;
    public DiseaselistDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }
    private static final String diseaselist="SELECT  count(u.UNic),name,date FROM suwasewana_db.user_register_disease urd left join suwasewana_db.user u on urd.UNic= u.uNic where (u.uMoh=?) AND (urd.name=?) AND (date BETWEEN ? AND ?) ";
    public ArrayList<UserDiseaseModel> diseaseList() {
        try (PreparedStatement preparedStatement = connection.prepareStatement(diseaselist)) {
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<UserDiseaseModel> diseaseList = new ArrayList<UserDiseaseModel>();
            while (rs.next()) {
                String name = rs.getString("aTitle");
                UserDiseaseModel temp = new UserDiseaseModel(
                        name,
                        ""
                        );
                diseaseList.add(temp);
            }
            return diseaseList;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
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
//                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

}