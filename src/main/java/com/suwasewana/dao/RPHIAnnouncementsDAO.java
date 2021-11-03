package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.RPHIAnnouncementsModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RPHIAnnouncementsDAO {
   private static final String CREATEA="INSERT INTO `clinic_announcement`  VALUES (NULL ,?,?,?,?,NULL,?);";
    Connection connection;
    public RPHIAnnouncementsDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }

    public String createA(RPHIAnnouncementsModel rphiAnnouncements) {
        System.out.println("came to dao");
     try (PreparedStatement preparedStatement=connection.prepareStatement(CREATEA)) {
         preparedStatement.setString(1,rphiAnnouncements.getTitle());
         preparedStatement.setString(2,rphiAnnouncements.getDescription());
         preparedStatement.setString(3,rphiAnnouncements.getBanner());
         preparedStatement.setString(4,rphiAnnouncements.getTarget_moh());
         preparedStatement.setString(5,rphiAnnouncements.getPhi_officer());

         int rs = preparedStatement.executeUpdate();
         return "sucsess";

     }catch (SQLException throwables) {
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
