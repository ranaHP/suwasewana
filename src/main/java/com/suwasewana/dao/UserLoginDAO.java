package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.UserLoginModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserLoginDAO {
    @SuppressWarnings("SqlResolve")
    private static final String CHECK_LOGIN_VALIDATION = "SELECT * FROM `users` WHERE `mobile` = ? and `password` = ?";

    Connection connection;

    public UserLoginDAO() {
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
