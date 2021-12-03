package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.HealthAnnouncementTargetDistrictModel;
import com.suwasewana.model.HealthAnnouncementTargetProvinceModel;
import com.suwasewana.model.PublicAnnouncementModel;

import java.sql.*;

public class PublicAnnouncementsDAO {
  private static final String CREATEA="INSERT INTO `health_announcement` VALUES (NULL, ?, ?, ?,?);";
  private static final String AddTargetP="INSERT INTO `health_announcement_target_province` VALUES (?,?)";
  private static final String AddTargetD="INSERT INTO `health_announcement_target_districts` VALUES (?,?)";
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
           preparedStatement.setString(4,publicAnnouncement.getExpire_date());
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


    public String addTargetDistricts(HealthAnnouncementTargetDistrictModel district) {
     try (PreparedStatement preparedStatement=connection.prepareStatement(AddTargetD)){
         preparedStatement.setString(1,district.getAnnouncement_id());
         preparedStatement.setString(2,district.getDistrict_id());
         int rs = preparedStatement.executeUpdate();
         return "sucsess";
     } catch (SQLException throwables) {
         throwables.printStackTrace();
     }
        return null;
    }

    public String addTargetProvince(HealthAnnouncementTargetProvinceModel targetProvince) {
        try (PreparedStatement preparedStatement=connection.prepareStatement(AddTargetP)){
            preparedStatement.setString(2,targetProvince.getAnnouncement_id());
            preparedStatement.setString(1,targetProvince.getProvince_id());
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
