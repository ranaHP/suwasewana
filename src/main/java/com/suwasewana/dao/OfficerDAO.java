package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.OfficerLoginModel;
import com.suwasewana.model.User;
import com.suwasewana.model.UserLoginModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OfficerDAO {
    @SuppressWarnings("SqlResolve")
    private static final String CHECK_OFFICER_LOGIN_VALIDATION = "SELECT * FROM `officer_table` WHERE `mobile` = ? and `password` = ?";
    private static final String UPDATE_MAC = "UPDATE `officer_table` SET `mac`=? WHERE `mobile` = ? and `password` = ?";
    Connection connection;

    public OfficerDAO(){
        DB db = new DB();
        connection = db.getConnection();
    }

    public OfficerLoginModel CheckLoginValidation(OfficerLoginModel officerLogin) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(CHECK_OFFICER_LOGIN_VALIDATION)) {
            preparedStatement.setString(1, officerLogin.getMobile());
            preparedStatement.setString(2, officerLogin.getPassword());
            ResultSet rs = preparedStatement.executeQuery();


            System.out.println("rs -DAO "+rs+"/");
            while (rs.next()) {
                String mobile = rs.getString("mobile");
                String password = rs.getString("password");
                String mac=rs.getString("mac");
                System.out.println("mobile "+mobile+"/");
                System.out.println("pass "+password+"/");
                if (mobile.equals(officerLogin.getMobile()) && password.equals(officerLogin.getPassword()) && mac==null ) {
                    System.out.println("null mach");
                    String updateMAC=officerLogin.getMAC();
                    try (PreparedStatement UpdateStatement = connection.prepareStatement(UPDATE_MAC)){
                        UpdateStatement.setString(1,updateMAC);
                        UpdateStatement.setString(2,mobile);
                        UpdateStatement.setString(3,password);
                        System.out.println("update work"+UpdateStatement);
                        UpdateStatement.executeUpdate();
                    }
                    catch (SQLException throwables) {
                        printSQLException(throwables);
                    }
                    OfficerLoginModel officerLogindetails = new OfficerLoginModel(mobile, password,updateMAC);
                    return officerLogindetails;
                }
                if (mobile.equals(officerLogin.getMobile()) && password.equals(officerLogin.getPassword()) && mac.equals(officerLogin.getMAC())) {
                    System.out.println("valid mach");
                    OfficerLoginModel officerLogindetails = new OfficerLoginModel(mobile, password,mac);
                    return officerLogindetails;
                }
            }
            return new OfficerLoginModel("","","");
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return new OfficerLoginModel("","","");
//        why is that
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
