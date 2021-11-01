package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.CreateClinicModel;
import com.suwasewana.model.vaccineClinicModel;

import java.lang.annotation.Target;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;

public class createClinicDAO {
  private  static final String CREATE_CLINIC ="INSERT INTO `normal_clinic_session`  VALUES (NULL ,?,?,?,?,?,?,?,?,?,?,?);";
  private static final String VIEW_CLINICS = "SELECT * FROM `normal_clinic_session`";
  private static final String SELECT_CLINICS = "SELECT * FROM `normal_clinic_session` WHERE `normal_clinic_session`.`ncs_id` = ?";
  private static final String DELETE_CLINICS ="DELETE FROM `normal_clinic_session` WHERE `normal_clinic_session`.`ncs_id` = ?";
  private static final String UPDATE_CLINICS =  "UPDATE `normal_clinic_session` SET `disease` = ?, `title` = ? , `location` = ?,  `target_moh` = ?, `Data&Time` = ?,  `duration` = ?,  `max-sheet` = ?, `target_people` = ?, `conduct-by` = ?, `description` = ? WHERE `clinics`.`ncs_id` = ?;";

  private static final String CREATE_VACCINE_CLINIC ="INSERT INTO `vaccine_clinic_session` VALUES (NULL,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
  private static final String VIEW_VACCINE_CLINICS ="SELECT * FROM `vaccine_clinic_session`";
    Connection connection;
    public createClinicDAO(){
        DB db = new DB();
        connection = db.getConnection();
    }
    public String createClinic(CreateClinicModel createClinic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(CREATE_CLINIC)) {
//            preparedStatement.setString(1,"");
            preparedStatement.setString(2,createClinic.getTitle());
            preparedStatement.setString(5,createClinic.getDatetime());
            preparedStatement.setString(6,createClinic.getDuration());
            preparedStatement.setString(1,createClinic.getDisease());
            preparedStatement.setString(10,createClinic.getDescription());
            preparedStatement.setString(7,createClinic.getMaxpatient());
            preparedStatement.setString(9,createClinic.getConduct());
            preparedStatement.setString(4,createClinic.getMOH());
            preparedStatement.setString(8,createClinic.getTarget());
            preparedStatement.setString(3,createClinic.getLocation());
            preparedStatement.setString(11,"12");

            int rs = preparedStatement.executeUpdate();
            return "sucsess";

        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }

    }


    public String updateClinic(CreateClinicModel updateClinic) {
        boolean rowUpdate;
        try (PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CLINICS)) {
            System.out.println("came to update");
//            preparedStatement.setString(1,"");
            preparedStatement.setString(1,updateClinic.getDisease());
            preparedStatement.setString(2,updateClinic.getTitle());
            preparedStatement.setString(3,updateClinic.getLocation());
            preparedStatement.setString(4,updateClinic.getMOH());
            preparedStatement.setString(5,updateClinic.getDatetime());
            preparedStatement.setString(6,updateClinic.getDuration());
            preparedStatement.setString(7,updateClinic.getMaxpatient());
            preparedStatement.setString(8,updateClinic.getTarget());
            preparedStatement.setString(9,updateClinic.getConduct());
            preparedStatement.setString(10,updateClinic.getDescription());
            preparedStatement.setString(11,updateClinic.getClinicID());

            rowUpdate = preparedStatement.executeUpdate() > 0;
            System.out.println(rowUpdate);
            return "success";


        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }

    }
    public ArrayList<CreateClinicModel> ViewClinics(CreateClinicModel viewClinic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(VIEW_CLINICS)){
//            System.out.println("came to dao");
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<CreateClinicModel> viewClinicList = new ArrayList<CreateClinicModel>();
            while (rs.next()){
                String clinicID =rs.getString("ncs_id");
                String disease =rs.getString("title");
                String title = rs.getString("start_date_time");
                String Location = rs.getString("duration");
                String TargetMOH = rs.getString("disease");
                String DataTime = rs.getString("description");
                String Duration = rs.getString("max_sheet");
                String MaxPatient = rs.getString("conduct_by");
                String Target=rs.getString("target_moh");
                String Conduct = rs.getString("target_people");
                String Description = rs.getString("location");
                String cNic = rs.getString("clinical_officer");
                CreateClinicModel temp = new CreateClinicModel(
                        clinicID,
                        disease,
                        title,
                        Location,
                        TargetMOH,
                        DataTime,
                        Duration,
                        MaxPatient,
                        Target,
                        Conduct,
                        Description,
                        cNic
                );
                 viewClinicList.add(temp);
//                System.out.println(title+"--"+disease+"--"+Location);
        };
        return viewClinicList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
}

    public ArrayList<CreateClinicModel> selectClinics(CreateClinicModel viewClinic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CLINICS)){
            System.out.println("jjj");
            preparedStatement.setString(1, viewClinic.getClinicID());
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<CreateClinicModel> selectClinicList = new ArrayList<CreateClinicModel>();
            while (rs.next()){
                String clinicID =rs.getString("ncs_id");
                String disease =rs.getString("title");
                String title = rs.getString("start_date_time");
                String Location = rs.getString("duration");
                String TargetMOH = rs.getString("disease");
                String DataTime = rs.getString("description");
                String Duration = rs.getString("max_sheet");
                String MaxPatient = rs.getString("conduct_by");
                String Target=rs.getString("target_moh");
                String Conduct = rs.getString("target_people");
                String Description = rs.getString("location");
                String cNic = rs.getString("clinical_officer");
                CreateClinicModel temp = new CreateClinicModel(
                        clinicID,
                        disease,
                        title,
                        Location,
                        TargetMOH,
                        DataTime,
                        Duration,
                        MaxPatient,
                        Target,
                        Conduct,
                        Description,
                        cNic


                );
                selectClinicList.add(temp);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return selectClinicList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }

    public String deleteClinic(CreateClinicModel deleteClinic) {
        boolean rowDeleted;
        try (PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CLINICS)) {
                 preparedStatement.setString(1,deleteClinic.getClinicID());
                rowDeleted = preparedStatement.executeUpdate() > 0;
                return "success";
        } catch (SQLException throwables) {
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


    public String vaccineClinic(vaccineClinicModel vaccineclinic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(CREATE_VACCINE_CLINIC)) {
            preparedStatement.setString(1,vaccineclinic.getTittle());
            preparedStatement.setString(2,vaccineclinic.getStart_date_time());
            preparedStatement.setString(3,vaccineclinic.getDuration());
            preparedStatement.setString(4,vaccineclinic.getDescription());
            preparedStatement.setString(5,vaccineclinic.getMax_patient());
            preparedStatement.setString(6,vaccineclinic.getTarget_moh());
            preparedStatement.setString(7,vaccineclinic.getTarget_people());
            preparedStatement.setString(8,vaccineclinic.getTarget_age_limit());
            preparedStatement.setString(9,"12");
            preparedStatement.setString(10,vaccineclinic.getV_id());
            preparedStatement.setString(11,vaccineclinic.getLocation());
            preparedStatement.setString(12,vaccineclinic.getDose_count());

            int rs = preparedStatement.executeUpdate();
            return "sucsess";

        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }

    }

    public ArrayList<CreateClinicModel> ViewVaccineClinics(vaccineClinicModel vaccineClinicView) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(VIEW_VACCINE_CLINICS)){
            System.out.println("came to dao");
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<CreateClinicModel> viewClinicList = new ArrayList<CreateClinicModel>();
            while (rs.next()){
//                String vcs_id =rs.getString("vcs_id");
                String title =rs.getString("tittle");
                String DataTime = rs.getString("start_date_time");
                String Duration = rs.getString("duration");
                String Description = rs.getString("description");
                String MaxPatient = rs.getString("max_patient");
                String TargetMOH = rs.getString("target_moh");
                String Target = rs.getString("target_people");
                String age_limit=rs.getString("target_age_limit");
                String clinical_officer = rs.getString("clinical_officer");
                String v_id = rs.getString("v_id");
                String location = rs.getString("location");
                String dose_count = rs.getString("dose_count");
                CreateClinicModel temp = new CreateClinicModel(
//                        vcs_id,
                        title,
                        DataTime,
                        Duration,
                        Description,
                        MaxPatient,
                        TargetMOH,
                        Target,
                        age_limit,
                        clinical_officer,
                        v_id,
                        location,
                        dose_count
                );
                viewClinicList.add(temp);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return viewClinicList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }

}



