package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.PHIRegisterModel;
import com.suwasewana.model.UserRegistrationModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AdminDAO {

    private static final String PHI_REGISTRATION = "INSERT INTO `phi_officer` VALUES (?,?,?,?,?,?,?,?,?,?,?);";

    Connection connection;

    public AdminDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }
    public String phiRegistration(PHIRegisterModel phiRegister) {
        System.out.println("data come to dao");

        try (PreparedStatement preparedStatement = connection.prepareStatement(PHI_REGISTRATION)) {
            preparedStatement.setString(1, phiRegister.getFull_name());
            preparedStatement.setString(2, phiRegister.getNIC());
            preparedStatement.setString(3, phiRegister.getC_officer_no());
            preparedStatement.setString(4, phiRegister.getDevice_MAC());
            preparedStatement.setString(5, phiRegister.getMobile());
            preparedStatement.setString(6, phiRegister.getStreet_no());
            preparedStatement.setString(7, phiRegister.getState());
            preparedStatement.setString(8, phiRegister.getCity());
            preparedStatement.setString(9, phiRegister.getPassword());
            preparedStatement.setString(10,phiRegister.getLogin_status());
            preparedStatement.setString(11, phiRegister.getPhi_post());
            int rs = preparedStatement.executeUpdate();
            System.out.println("dao value" + rs);

            return "success";
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            System.out.println(throwables.getErrorCode());
//            System.out.println(throwables.getSQLState());
//            System.out.println(throwables.getMessage());
//            System.out.println(throwables);
            return throwables.getMessage();
        }


    }

    private void printSQLException(SQLException throwables) {


    }
}
