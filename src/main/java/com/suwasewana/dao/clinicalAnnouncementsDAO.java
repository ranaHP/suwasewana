package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.CreateClinicAnnouncementsModel;
import com.suwasewana.model.VaccineClinicAnnouncementsModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class clinicalAnnouncementsDAO {
    private static final String INSERT_ANNOUNCEMENT="INSERT INTO `clinic_announcement`  VALUES (NULL ,?,?);";
    private static final String VIEW_ANNOUNCEMENTS="SELECT * FROM clinic_announcement INNER JOIN normal_clinic_session ON clinic_announcement.clinic_id=normal_clinic_session.ncs_id";
    private static final String DELETE_ANNOUNCEMENTS="DELETE FROM `clinic_announcement` WHERE `clinic_announcement`.`clinic_id` = ?;";

    private static final String INSERT_VANNOUNCEMENT=   "INSERT INTO `vaccine_clinic_announcement` VALUES (NULL,?,?)";
    private static final String VIEW_VANNOUNCEMENT="SELECT * FROM vaccine_clinic_announcement INNER JOIN vaccine_clinic_session ON vaccine_clinic_announcement.vcs_id =vaccine_clinic_session.vcs_id";
    private static final String DELETE_VANNOUNCEMENT="DELETE FROM `vaccine_clinic_announcement` WHERE `vaccine_clinic_announcement`.`vcs_id`=?;";
    Connection connection;
    public clinicalAnnouncementsDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }

    public String createClinicA(CreateClinicAnnouncementsModel createClinicAnnouncements) {
   try(PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ANNOUNCEMENT)) {
//       System.out.println("came to dao");
       preparedStatement.setString(1,createClinicAnnouncements.getImage());
       preparedStatement.setString(2,createClinicAnnouncements.getClinicID());

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
            System.out.println("came to dao");
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<CreateClinicAnnouncementsModel> ViewclinicAnnouncements = new ArrayList<CreateClinicAnnouncementsModel>();
            while (rs.next()){
                String AID=rs.getString("announcemet_id");
                String CId= rs.getString("clinic_id");
                String title = rs.getString("title");
                String disease =rs.getString("disease");
                String location=rs.getString("location");
                String TargetMOH = rs.getString("target_moh");
                String DataTime = rs.getString("date");
                String Duration = rs.getString("duration");
                String MaxPatient = rs.getString("max_sheet");
                String Target=rs.getString("target_people");
                String Conduct = rs.getString("conduct_by");
                String Description = rs.getString("description");
                String banner=rs.getString("banner");
                String cNic = rs.getString("clinical_officer");
                CreateClinicAnnouncementsModel temp = new CreateClinicAnnouncementsModel(
                        AID,
                        CId,
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

    public String deleteAnnouncements(CreateClinicAnnouncementsModel deleteAnnouncements) {
        System.out.println("came to dlete dao");
            boolean rowDeleted;
            try (PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ANNOUNCEMENTS)) {
                preparedStatement.setString(1,deleteAnnouncements.getClinicID());
                rowDeleted = preparedStatement.executeUpdate() > 0;
                System.out.println(rowDeleted);
                return "success";
            } catch (SQLException throwables) {
                return throwables.getMessage();
            }
        }

    public String createVClinicA(VaccineClinicAnnouncementsModel vaccineClinicAnnouncement) {
        try(PreparedStatement preparedStatement = connection.prepareStatement(INSERT_VANNOUNCEMENT)) {
            preparedStatement.setString(1,vaccineClinicAnnouncement.getBanner());
            preparedStatement.setString(2,vaccineClinicAnnouncement.getVcs_id());

            int rs = preparedStatement.executeUpdate();
            return "sucsess";
        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }
    }

    public ArrayList<VaccineClinicAnnouncementsModel> ViewVAnnouncements(VaccineClinicAnnouncementsModel viewVAnnouncements) {

        try (PreparedStatement preparedStatement = connection.prepareStatement(VIEW_VANNOUNCEMENT)){
//            System.out.println("came to dao");
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<VaccineClinicAnnouncementsModel> ViewVAnnouncements = new ArrayList<VaccineClinicAnnouncementsModel>();
            while (rs.next()){
                String vcs_id =rs.getString("vcs_id");
                String title =rs.getString("tittle");
                String DataTime = rs.getString("start_date_time");
                String Duration = rs.getString("duration");
                String MaxPatient = rs.getString("max_patient");
                String TargetMOH = rs.getString("target_moh");
                String Lage_limit=rs.getString("lower_age_limit");
                String Uage_limit=rs.getString("upper_age_limit");
                String clinical_officer = rs.getString("clinical_officer");
                String vname = rs.getString("name");
                String location = rs.getString("location");
                String dose_count = rs.getString("dose_count");
                VaccineClinicAnnouncementsModel temp = new VaccineClinicAnnouncementsModel(
                        "",
                        vcs_id,
                        title,
                        DataTime,
                        Duration,
                        MaxPatient,
                        TargetMOH,
                        Lage_limit,
                        Uage_limit,
                        clinical_officer,
                        "",
                        vname,
                        location,
                        dose_count
                );
                ViewVAnnouncements.add(temp);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return ViewVAnnouncements;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }

    public String deleteVAnnouncements(VaccineClinicAnnouncementsModel deleteVAnnouncements) {
        System.out.println("came to dlete dao");
        boolean rowDeleted;
        try (PreparedStatement preparedStatement = connection.prepareStatement(DELETE_VANNOUNCEMENT)) {
            preparedStatement.setString(1,deleteVAnnouncements.getVcs_id());
            rowDeleted = preparedStatement.executeUpdate() > 0;
            System.out.println(rowDeleted);
            return "success";
        } catch (SQLException throwables) {
            return throwables.getMessage();
        }
    }
}



