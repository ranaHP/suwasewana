package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.UserLoginModel;
import com.suwasewana.model.UserRegistrationModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    @SuppressWarnings("SqlResolve")
    private static final String CHECK_LOGIN_VALIDATION = "SELECT * FROM `users` WHERE `mobile` = ? and `password` = ?";
    private static  final  String USER_REGISTRATION = "INSERT INTO `citizen` VALUES (?,?,?,?,?,?,?,?,?,?,?);";
    Connection connection;

    public UserDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }

    public UserLoginModel CheckLoginValidation(UserLoginModel userLogin) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(CHECK_LOGIN_VALIDATION)) {
            preparedStatement.setString(1, userLogin.getMobile());
            preparedStatement.setString(2, userLogin.getPassword());
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String mobile = rs.getString("mobile");
                String password = rs.getString("password");
                if (mobile.equals(userLogin.getMobile()) && password.equals(userLogin.getPassword())) {
                    UserLoginModel userLoginDetails = new UserLoginModel(mobile, password);
                    return userLoginDetails;
                }
            }
            return new UserLoginModel("", "");
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return userLogin;
    }

    public Integer UserRegistration(UserRegistrationModel userRegister) {
        System.out.println("data come to dao");

        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_REGISTRATION)) {
            preparedStatement.setString(1, userRegister.getuNic());
            preparedStatement.setString(2, userRegister.getuMobile());
            preparedStatement.setString(3, userRegister.getuMoh());
            preparedStatement.setString(4, userRegister.getuPassword());
            preparedStatement.setString(5, userRegister.getUname());
            preparedStatement.setString(6, userRegister.getuDistrict());
            preparedStatement.setString(7, userRegister.getuProvince());
            preparedStatement.setString(8, userRegister.getuCity());
            preparedStatement.setString(9, userRegister.getUlocation());
            preparedStatement.setString(10, userRegister.getUaddress());
            preparedStatement.setString(11, "");
            int  rs = preparedStatement.executeUpdate();
            System.out.println("dao value" + rs);

            return  rs;
        } catch (SQLException throwables) {
            printSQLException(throwables);
            return 0;
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
