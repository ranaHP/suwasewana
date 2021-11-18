package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.CreateClinicAnnouncementsModel;
import com.suwasewana.model.RPHIAnnouncementsModel;
import com.suwasewana.model.VaccineClinicAnnouncementsModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

public class RPHIAnnouncementsDAO {
   private static final String CREATEA="INSERT INTO `staff_announcement`  VALUES (NULL ,?,?,?,?,NULL,?,?);";
   private static final String SELECTA="SELECT * FROM `staff_announcement` ";
    private static final String SELECTMOHAnnouncement="SELECT * FROM `staff_announcement` where target_moh=?";
    private static final String DeleteA = "DELETE FROM `staff_announcement` where announcement_id=?";
   Connection connection;
    public RPHIAnnouncementsDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }
    public ArrayList<RPHIAnnouncementsModel> ViewMOHAnnouncement(RPHIAnnouncementsModel selectA) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECTMOHAnnouncement)){
            preparedStatement.setString(1,selectA.getTarget_moh() );
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<RPHIAnnouncementsModel> ViewVAnnouncements = new ArrayList<RPHIAnnouncementsModel>();
            while (rs.next()){
                String announcement_id=rs.getString("announcement_id");
                String title=rs.getString("title");
                String description=rs.getString("description");
                String banner=rs.getString("banner");
                String target_moh=rs.getString("target_moh");
                String posted_date=rs.getString("posted_date");

                RPHIAnnouncementsModel temp= new RPHIAnnouncementsModel(
                        announcement_id,
                        title,
                        description,
                        banner,
                        target_moh,
                        posted_date,
                        "",
                        ""
                );
                ViewVAnnouncements.add(temp);

            }
            return ViewVAnnouncements;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }


    public ArrayList<RPHIAnnouncementsModel> ViewA(RPHIAnnouncementsModel selectA) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECTA)){
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<RPHIAnnouncementsModel> ViewVAnnouncements = new ArrayList<RPHIAnnouncementsModel>();
            while (rs.next()){
                String announcement_id=rs.getString("announcement_id");
                String title=rs.getString("title");
                String description=rs.getString("description");
                String banner=rs.getString("banner");
                String target_moh=rs.getString("target_moh");
                String posted_date=rs.getString("posted_date");
                String phi_officer=rs.getString("phi_officer");

                RPHIAnnouncementsModel temp= new RPHIAnnouncementsModel(
                        announcement_id,
                        title,
                        description,
                        banner,
                        target_moh,
                        posted_date,
                        phi_officer,
                        ""
                );
                ViewVAnnouncements.add(temp);

            }
            return ViewVAnnouncements;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }


    public String createA(RPHIAnnouncementsModel RPHIAnnouncements) {
        System.out.println("came to dao");
     try (PreparedStatement preparedStatement=connection.prepareStatement(CREATEA)) {
         preparedStatement.setString(1,RPHIAnnouncements.getTitle());
         preparedStatement.setString(2,RPHIAnnouncements.getDescription());
         preparedStatement.setString(3,RPHIAnnouncements.getBanner());
         preparedStatement.setString(4,RPHIAnnouncements.getTarget_moh());
         preparedStatement.setString(5,"12");
         preparedStatement.setString(6,RPHIAnnouncements.getExpire_date());

         int rs = preparedStatement.executeUpdate();
         System.out.println(rs);
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

    public String updateAnnstatus(RPHIAnnouncementsModel updateAstatus) {

        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECTMOHAnnouncement)){
            preparedStatement.setString(1,updateAstatus.getTarget_moh() );
            ResultSet rs = preparedStatement.executeQuery();

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            String today=dtf.format(now);

            SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
            Date d1 = sdformat.parse(today);
            while (rs.next()){
                String announcement_id=rs.getString("announcement_id");
                String expire_date= rs.getString("expire_date");
                String date2=expire_date;
                Date d2 = sdformat.parse(date2);

//                System.out.println("The date 1 is: " + sdformat.format(d1));
//                System.out.println("The date 2 is: " + sdformat.format(d2));

                if(d1.compareTo(d2) > 0) {
                    System.out.println("Task id "+announcement_id+ " Overdue");
                    try (PreparedStatement preparedStatementforupdate = connection.prepareStatement(DeleteA)){
                        preparedStatementforupdate.setString(1, announcement_id);
                        int response = preparedStatementforupdate.executeUpdate();
                    }
                    catch (SQLException throwables) {
                        printSQLException(throwables);
                    }
                }

            }
        } catch (SQLException | ParseException throwables) {
            throwables.printStackTrace();
        }
        return "sucsess";
    }
}
