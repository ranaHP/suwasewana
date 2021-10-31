package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.CreateClinicAnnouncementsModel;
import com.suwasewana.model.CreateClinicModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class clinicalAnnouncementsDAO {
    private static final String INSERT_ANNOUNCEMENT="INSERT INTO `clinic_announcements`  VALUES (NULL ,?,?,?,?,?,?,?,?,?,?,?,?,?);";
    Connection connection;
    public clinicalAnnouncementsDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }

    public String createClinicA(CreateClinicAnnouncementsModel createClinicAnnouncements) {
   try(PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ANNOUNCEMENT)) {
       System.out.println("came to dao");
       preparedStatement.setString(1,createClinicAnnouncements.getTitle());
       preparedStatement.setString(2,createClinicAnnouncements.getDisease());
       preparedStatement.setString(3,createClinicAnnouncements.getLocation());
       preparedStatement.setString(4,createClinicAnnouncements.getMOH());
       preparedStatement.setString(5,createClinicAnnouncements.getDatetime());
       preparedStatement.setString(6,createClinicAnnouncements.getDuration());
       preparedStatement.setString(7,createClinicAnnouncements.getMaxpatient());
       preparedStatement.setString(8,createClinicAnnouncements.getTarget());
       preparedStatement.setString(9,createClinicAnnouncements.getConduct());
       preparedStatement.setString(10,createClinicAnnouncements.getDescription());
       preparedStatement.setString(11,createClinicAnnouncements.getImage());
       preparedStatement.setString(12,"12");
       preparedStatement.setString(13,createClinicAnnouncements.getClinicID());

       int rs = preparedStatement.executeUpdate();
       return "sucsess";
   } catch (SQLException throwables) {
       printSQLException(throwables);
       return throwables.getMessage();
    }

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



