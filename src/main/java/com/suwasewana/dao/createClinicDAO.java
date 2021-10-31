package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.CreateClinicModel;

import java.lang.annotation.Target;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;

public class createClinicDAO {
  private  static final String CREATE_CLINIC ="INSERT INTO `clinics`  VALUES (NULL ,?,?,?,?,?,?,?,?,?,?,?);";
  private static final String VIEW_CLINICS = "SELECT * FROM `clinics`";
  private static final String SELECT_CLINICS = "SELECT * FROM `clinics` WHERE `clinics`.`clinic-no` = ?";
  private static final String DELETE_CLINICS ="DELETE FROM `clinics` WHERE `clinics`.`clinic-no` = ?";
  private static final String UPDATE_CLINICS =  "UPDATE `clinics` SET `Disease` = ?, `ClinicTitle` = ? , `Location` = ?,  `Target MOH` = ?, `Data&Time` = ?,  `Duration` = ?,  `MaxPatient` = ?, `Target` = ?, `Conduct` = ?, `Description` = ? WHERE `clinics`.`clinic-no` = ?;";
    Connection connection;
    public createClinicDAO(){
        DB db = new DB();
        connection = db.getConnection();
    }
    public String createClinic(CreateClinicModel createClinic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(CREATE_CLINIC)) {
//            preparedStatement.setString(1,"");
            preparedStatement.setString(1,createClinic.getDisease());
            preparedStatement.setString(2,createClinic.getTitle());
            preparedStatement.setString(3,createClinic.getLocation());
            preparedStatement.setString(4,createClinic.getMOH());
            preparedStatement.setString(5,createClinic.getDatetime());
            preparedStatement.setString(6,createClinic.getDuration());
            preparedStatement.setString(7,createClinic.getMaxpatient());
            preparedStatement.setString(8,createClinic.getTarget());
            preparedStatement.setString(9,createClinic.getConduct());
            preparedStatement.setString(10,createClinic.getDescription());
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
                String clinicID =rs.getString("clinic-no");
                String disease =rs.getString("Disease");
                String title = rs.getString("ClinicTitle");
                String Location = rs.getString("Location");
                String TargetMOH = rs.getString("Target MOH");
                String DataTime = rs.getString("Data&Time");
                String Duration = rs.getString("Duration");
                String MaxPatient = rs.getString("MaxPatient");
                String Target=rs.getString("Target");
                String Conduct = rs.getString("Conduct");
                String Description = rs.getString("Description");
                String cNic=rs.getString("cNic");
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
                String clinicID =rs.getString("clinic-no");
                String disease =rs.getString("Disease");
                String title = rs.getString("ClinicTitle");
                String Location = rs.getString("Location");
                String TargetMOH = rs.getString("Target MOH");
                String DataTime = rs.getString("Data&Time");
                String Duration = rs.getString("Duration");
                String MaxPatient = rs.getString("MaxPatient");
                String Target=rs.getString("Target");
                String Conduct = rs.getString("Conduct");
                String Description = rs.getString("Description");
                String cNic = rs.getString("cNic");
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


}



