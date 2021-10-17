package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.CreateClinicModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;

public class createClinicDAO {
  private  static final String CREATE_CLINIC ="INSERT INTO `clinics`  VALUES (NULL ,?,?,?,?,?,?,?,?,?,NULL );";
  private static final String VIEW_CLINICS = "SELECT * FROM `clinics`";
  
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
            preparedStatement.setString(8,createClinic.getConduct());
            preparedStatement.setString(9,createClinic.getDescription());
            int rs = preparedStatement.executeUpdate();
            return "sucsess";

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
                String disease =rs.getString("Disease");
                String title = rs.getString("ClinicTitle");
                String Location = rs.getString("Location");
                String TargetMOH = rs.getString("Target MOH");
                String DataTime = rs.getString("Data&Time");
                String Duration = rs.getString("Duration");
                String MaxPatient = rs.getString("MaxPatient");
                String Conduct = rs.getString("Conduct");
                String Description = rs.getString("Description");
                CreateClinicModel temp = new CreateClinicModel(
                        disease,
                        title,
                        Location,
                        TargetMOH,
                        DataTime,
                        Duration,
                        MaxPatient,
                        Conduct,
                        Description
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



