package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.ClinicalOfficerModel;
import com.suwasewana.model.MOHRegModel;
import com.suwasewana.model.VaccineForHospitalModel;
import com.suwasewana.model.VaccineModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class VaccineDAO {

    private static final String uservaccineRegistration = "SELECT uv.nic,v.name,u.uname,vcs.location,vcs.Start_date_time FROM suwasewana_db.user_vaccine uv  left join suwasewana_db.vaccine v on v.v_id= uv.vaccine_id left join suwasewana_db.user u on u.uNic=uv.nic left join suwasewana_db.vaccine_clinic_session vcs on vcs.vcs_id=uv.clinic_id;";

    Connection connection;

    public VaccineDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }

    public ArrayList<VaccineForHospitalModel> GetuserVaccineDetail() {

        try (PreparedStatement preparedStatement = connection.prepareStatement(uservaccineRegistration)) {
            System.out.println("sql in vqccin "+preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<VaccineForHospitalModel> vaccineModelsList = new ArrayList<VaccineForHospitalModel>();
            while (rs.next()) {

                String userName=rs.getString("uname");
                String userNic=rs.getString("nic");
                String VaccineName=rs.getString("name");
                String Date=rs.getString("Start_date_time");
                String Location=rs.getString("location");

                VaccineForHospitalModel temp = new VaccineForHospitalModel(
                        userName,
                        userNic,
                        VaccineName,
                        Date,
                        Location
                );

                vaccineModelsList.add(temp);
            }
            return vaccineModelsList;

        } catch (SQLException throwables) {
            printSQLException(throwables);
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
