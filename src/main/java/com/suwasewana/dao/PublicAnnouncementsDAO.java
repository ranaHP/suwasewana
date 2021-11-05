package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.PublicAnnouncementModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PublicAnnouncementsDAO {
  private static final String CREATEA="INSERT INTO `health_announcement` VALUES (NULL, ?, ?, ?);";
    Connection connection;
    public PublicAnnouncementsDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }

    public String PublicAnnouncement(PublicAnnouncementModel publicAnnouncement) {
       try (PreparedStatement preparedStatement=connection.prepareStatement(CREATEA)){
           preparedStatement.setString(1,publicAnnouncement.getTitle());
           preparedStatement.setString(2,publicAnnouncement.getDescription());
           preparedStatement.setString(3,publicAnnouncement.getBanner());

           int rs = preparedStatement.executeUpdate();
           return "sucsess";
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
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
