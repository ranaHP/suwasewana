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
    private static final String CHECK_OFFICER_LOGIN_VALIDATION = "SELECT * FROM `phi_officer` WHERE mobile = ? AND password = ? AND device_MAC = ?";
    private static final String UPDATE_MAC = "UPDATE `phi_officer` SET `device_MAC` = ? WHERE mobile = ?;";
    Connection connection;

    public OfficerDAO(){
        DB db = new DB();
        connection = db.getConnection();
    }

    public OfficerLoginModel CheckLoginValidation(OfficerLoginModel officerLogin) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(CHECK_OFFICER_LOGIN_VALIDATION)) {
            preparedStatement.setString(1, officerLogin.getMobile());
            preparedStatement.setString(2, officerLogin.getPassword());
            preparedStatement.setString(3, "12-34-56-78");
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String phi_Id  = rs.getString("phi_Id ");
                String full_name = rs.getString("full_name");
                String NIC  = rs.getString("NIC ");
                String City = rs.getString("City");
                String phi_post = rs.getString("phi_post");
                String District = rs.getString("District");
                String password = rs.getString("password");
                String PostalCode = rs.getString("PostalCode");
                String mohId  = rs.getString("mohId ");
                String DP  =rs.getString("DP ");
                String mobile  =rs.getString("mobile");
                String device_MAC  =rs.getString("device_MAC");

                if (mobile.equals(officerLogin.getMobile()) && password.equals(officerLogin.getPassword()) && device_MAC==null ) {

                    String updateMAC=officerLogin.getDevice_MAC();
                    try (PreparedStatement UpdateStatement = connection.prepareStatement(UPDATE_MAC)){
                        UpdateStatement.setString(1,updateMAC);
                        UpdateStatement.setString(2,mobile);
                        UpdateStatement.executeUpdate();
                    }
                    catch (SQLException throwables) {
                        printSQLException(throwables);
                    }
                    OfficerLoginModel officerLogindetails = new OfficerLoginModel(mobile, password,updateMAC);
                    officerLogindetails.setPhi_Id(phi_Id);
                    officerLogindetails.setFull_name(full_name);
                    officerLogindetails.setNIC(NIC);
                    officerLogindetails.setCity(City);
                    officerLogindetails.setPhi_post(phi_post);
                    officerLogindetails.setDistrict(District);
                    officerLogindetails.setPostalCode(PostalCode);
                    officerLogindetails.setMohId(mohId);
                    officerLogindetails.setDP(DP);
                    return officerLogindetails;
                }
                if (mobile.equals(officerLogin.getMobile()) && password.equals(officerLogin.getPassword()) && device_MAC.equals(officerLogin.getDevice_MAC())) {

                    OfficerLoginModel officerLogindetails = new OfficerLoginModel(mobile, password,device_MAC);
                    officerLogindetails.setPhi_Id(phi_Id);
                    officerLogindetails.setFull_name(full_name);
                    officerLogindetails.setNIC(NIC);
                    officerLogindetails.setCity(City);
                    officerLogindetails.setPhi_post(phi_post);
                    officerLogindetails.setDistrict(District);
                    officerLogindetails.setPostalCode(PostalCode);
                    officerLogindetails.setMohId(mohId);
                    officerLogindetails.setDP(DP);
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
