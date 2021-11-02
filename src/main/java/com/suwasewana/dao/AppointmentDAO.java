package com.suwasewana.dao;

import com.google.gson.Gson;
import com.suwasewana.core.DB;
import com.suwasewana.model.AppointmentTypeModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AppointmentDAO {
    private Gson gson = new Gson();
    Connection connection;

    public AppointmentDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }
    private static final String CHECK_LOGIN_VALIDATION = "SELECT * FROM `user` WHERE `uMobile` = ? and `uPassword` = ?";
    private static final String APPOINTMENTS_TYPES = "SELECT * FROM `appointment_type` ;";
    private static final String ADD_APPOINTMENTS_TYPES = "INSERT INTO `appointment_type` (`apponitment_type_id`, `appointment_type`, `description`) VALUES (NULL, 'Grade 5 Scholarship', NULL),(NULL, 'To Discuss Complaint', NULL) , (NULL, 'Other', NULL)";


    public ArrayList<AppointmentTypeModel> getAppointmentTypes() {
        try (PreparedStatement preparedStatement = connection.prepareStatement(APPOINTMENTS_TYPES)) {
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<AppointmentTypeModel> appointmentTypeList = new ArrayList<AppointmentTypeModel>();
            while (rs.next()) {
                String typeName = rs.getString("appointment_type");
                String typeNumber = rs.getString("apponitment_type_id");
                AppointmentTypeModel temp = new AppointmentTypeModel(typeNumber, typeName);
                appointmentTypeList.add(temp);
            }
            return appointmentTypeList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return null;
    }

//    public ArrayList<AppointmentTypeModel> userGetAppointmentTypes() {
//        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_GET_APPOINTMENT_TYPE_NAME)) {
//            ResultSet rs = preparedStatement.executeQuery();
//            ArrayList<AppointmentTypeModel> appointmentTypeList = new ArrayList<AppointmentTypeModel>();
//            while (rs.next()) {
//                String typeName = rs.getString("name");
//                String typeNumber = rs.getString("appointment_type_no");
//
//                AppointmentTypeModel temp = new AppointmentTypeModel(typeNumber, typeName);
//                appointmentTypeList.add(temp);
//            }
//            return appointmentTypeList;
//        } catch (SQLException throwables) {
//            printSQLException(throwables);
//        }
//
//        return null;
//    }

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
