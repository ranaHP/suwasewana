package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AdminDAO {

    private static final String PHI_REGISTRATION = "INSERT INTO `suwaserwana_db`.`phi_officer` (`full_name`, `NIC`, `mobile`, `device_MAC`, `Address`, `City`, `District`, `phi_post`, `login_status`, `password`, `PostalCode`, `mohId`, `DP`,`suspended_time`)  VALUES (?, ?, ?, NULL , ?, ?, ?, ?, '0', ?, ?, ?, ?,current_timestamp());";
    private static final String Clinical_Officer_REGISTRATION="INSERT INTO `suwaserwana_db`.`clinical_officer`  VALUES (NULL, ?, ?, NULL, ?, ?, ?, ?, ?,'0',current_timestamp(),?);";
    private static final String MOH_REGISTRATION="INSERT INTO `suwaserwana_db`.`moh` (`MName`, `TpNo`, `MHead`, `Province`, `District`, `City`, `x`, `y`,`Allcities`) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?);";
    Connection connection;

    public AdminDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }

    public String mohRegistration(MOHRegModel mohRegModel) {
        System.out.println("data come to dao");

        try (PreparedStatement preparedStatement = connection.prepareStatement(MOH_REGISTRATION)) {
            preparedStatement.setString(1, mohRegModel.getMName() );
            preparedStatement.setString(2, mohRegModel.getTpNo() );
            preparedStatement.setString(3, mohRegModel.getMOHHead() );
            preparedStatement.setString(4, mohRegModel.getProvince() );
            preparedStatement.setString(5, mohRegModel.getDistrict() );
            preparedStatement.setString(6, mohRegModel.getCity() );
            preparedStatement.setString(7, mohRegModel.getX() );
            preparedStatement.setString(8, mohRegModel.getY() );
            preparedStatement.setString(9, mohRegModel.getCities() );
            System.out.println("qry: "+preparedStatement);
            int rs = preparedStatement.executeUpdate();
            return "success";

        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }


    }



    public String ClinicalOfficerRegistration(ClinicalOfficerModel clinicalOfficerModel) {
        System.out.println("data come to dao");

        try (PreparedStatement preparedStatement = connection.prepareStatement(Clinical_Officer_REGISTRATION)) {
            preparedStatement.setString(1, clinicalOfficerModel.getName() );
            preparedStatement.setString(2, clinicalOfficerModel.getNIC() );
            preparedStatement.setString(3, clinicalOfficerModel.getMobile() );
            preparedStatement.setString(4, clinicalOfficerModel.getCity() );
            preparedStatement.setString(5, clinicalOfficerModel.getDistrict() );
            preparedStatement.setString(6, clinicalOfficerModel.getAddress() );
            preparedStatement.setString(7, clinicalOfficerModel.getPass() );
            preparedStatement.setString(8, clinicalOfficerModel.getMOHAREA() );

            System.out.println("qry: "+preparedStatement);
            int rs = preparedStatement.executeUpdate();
            System.out.println("dao value" + rs);
            return "success";

        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }


    }


//    public String phiRegistration(PHIModel phiRegister) {
//        System.out.println("data come to dao");
//
//        try (PreparedStatement preparedStatement = connection.prepareStatement(PHI_REGISTRATION)) {
//            preparedStatement.setString(1, phiRegister.getFull_name() );
//            preparedStatement.setString(2, phiRegister.getNIC() );
//            preparedStatement.setString(3, phiRegister.getMobile());
//            preparedStatement.setString(4, phiRegister.getAddress());
//            preparedStatement.setString(5, phiRegister.getCity());
//            preparedStatement.setString(6, phiRegister.getDistrict());
//            preparedStatement.setString(7, phiRegister.getPhi_post());
//            preparedStatement.setString(8, phiRegister.getPassword() );
//            preparedStatement.setString(9, phiRegister.getPostalCode());
//            preparedStatement.setString(10,phiRegister.getMohId());
//            preparedStatement.setString(11, phiRegister.getDp());
//            System.out.println("SQL "+preparedStatement);
//            int rs = preparedStatement.executeUpdate();
//            System.out.println("dao value" + rs);
//
//            return "success";
//        } catch (SQLException throwables) {
//            printSQLException(throwables);
////            System.out.println(throwables.getErrorCode());
////            System.out.println(throwables.getSQLState());
////            System.out.println(throwables.getMessage());
////            System.out.println(throwables);
//            System.out.println("Error");
//            return throwables.getMessage();
//        }
//
//
//    }

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
