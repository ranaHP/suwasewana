package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.PublicAnnouncementModel;

import java.sql.*;

public class PublicAnnouncementsDAO {
  private static final String CREATEA="INSERT INTO `health_announcement` VALUES (NULL, ?, ?, ?);";
    Connection connection;
    public PublicAnnouncementsDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }
    public int PublicAnnouncement(PublicAnnouncementModel publicAnnouncement) {
        int announcement_id =0;
        try (PreparedStatement preparedStatement=connection.prepareStatement(CREATEA, Statement.RETURN_GENERATED_KEYS)){
           preparedStatement.setString(1,publicAnnouncement.getTitle());
           preparedStatement.setString(2,publicAnnouncement.getDescription());
           preparedStatement.setString(3,publicAnnouncement.getBanner());
           int rs = preparedStatement.executeUpdate();
           ResultSet rs1= preparedStatement.getGeneratedKeys();
           if (rs1.next()) {
               announcement_id = rs1.getInt(1);
//               System.out.println(announcement_id);
           }

       } catch (SQLException throwables) {
           throwables.printStackTrace();
       }

        return announcement_id;
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
