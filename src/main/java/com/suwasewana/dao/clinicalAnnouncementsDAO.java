package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.CreateClinicAnnouncementsModel;
import com.suwasewana.model.CreateClinicModel;

import javax.xml.stream.Location;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class clinicalAnnouncementsDAO {
    private static final String INSERT_ANNOUNCEMENT="INSERT INTO `clinic_announcement`  VALUES (NULL ,?,?,?,?,?,?,?,?,?,?,?,?,?);";
    private static final String VIEW_ANNOUNCEMENTS="SELECT * FROM `clinic_announcement`";
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

    public ArrayList<CreateClinicAnnouncementsModel> ViewclinicAnnouncements(CreateClinicAnnouncementsModel viewAnnouncement) {

        try (PreparedStatement preparedStatement = connection.prepareStatement(VIEW_ANNOUNCEMENTS)){
//            System.out.println("came to dao");
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<CreateClinicAnnouncementsModel> ViewclinicAnnouncements = new ArrayList<CreateClinicAnnouncementsModel>();
            while (rs.next()){
                String title = rs.getString("title");
                String disease =rs.getString("disease");
                String location=rs.getString("location");
                String TargetMOH = rs.getString("target_moh");
                String DataTime = rs.getString("date&time");
                String Duration = rs.getString("duration");
                String MaxPatient = rs.getString("max_sheet");
                String Target=rs.getString("target_people");
                String Conduct = rs.getString("conduct");
                String Description = rs.getString("description");
                String banner=rs.getString("banner");
                String cNic = rs.getString("clinical_officer");
                CreateClinicAnnouncementsModel temp = new CreateClinicAnnouncementsModel(
                        "",
                        title,
                        disease,
                        location,
                        TargetMOH,
                        DataTime,
                        Duration,
                        MaxPatient,
                        Target,
                        Conduct,
                        Description,
                        banner,
                        cNic
                );
                ViewclinicAnnouncements.add(temp);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return ViewclinicAnnouncements;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }
}



