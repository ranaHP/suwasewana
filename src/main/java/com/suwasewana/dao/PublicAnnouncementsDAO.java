package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.core.ResponseType;
import com.suwasewana.model.AppointmentModel;
import com.suwasewana.model.HealthAnnouncementTargetDistrictModel;
import com.suwasewana.model.HealthAnnouncementTargetProvinceModel;
import com.suwasewana.model.PublicAnnouncementModel;

import java.sql.*;
import java.util.ArrayList;

public class PublicAnnouncementsDAO {
  private static final String CREATEA="INSERT INTO `health_announcement` VALUES (NULL, ?, ?, ?,?,'Not-verified')";
  private static final String AddTargetP="INSERT INTO `health_announcement_target_province` VALUES (?,?)";
    private static final String AddTargetD="INSERT INTO `health_announcement_target_districts` VALUES (?,?)";
    private static final String getAppoinments="SELECT * FROM `health_announcement`";
    private static final String block_announcement="UPDATE `health_announcement` SET `Status` = ? WHERE `health_announcement`.`announcement_id` = ?;";
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
           System.out.println(preparedStatement.toString());
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
    public ArrayList<PublicAnnouncementModel> GetAllPublicAnnouncement() {
        try (PreparedStatement preparedStatement = connection.prepareStatement(getAppoinments)) {
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<PublicAnnouncementModel> publicAnnouncementTemp = new ArrayList<PublicAnnouncementModel>();
            while (rs.next()) {

               PublicAnnouncementModel temp = new PublicAnnouncementModel(
                       rs.getString("announcement_id"),
                       rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("banner"),
                        rs.getString("expire_date"),
                       rs.getString("Status")
                );
                publicAnnouncementTemp.add(temp);
            }
            return publicAnnouncementTemp;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }
    public ResponseType block_announcement(String id , String status) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(block_announcement)) {
            String temp = "";
            if(status.equals("block") ){
                temp = "active";
            }else {
                temp = "block";
            }
            preparedStatement.setString(1, temp);
            preparedStatement.setString(2, id);
            int rs = preparedStatement.executeUpdate();
            if(rs == 1){
                return new ResponseType("success" ,"Announcement Blocked Successful");
            }else{
                return new ResponseType("error" ,"Announcement Blocked Unsuccessful");
            }

        } catch (SQLException throwables) {
            return new ResponseType("error" ,throwables.getMessage());
        }
    }

}
