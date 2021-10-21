package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.AppointmentModel;
import com.suwasewana.model.AppointmentTypeModel;
import com.suwasewana.model.ComplainModel;
import com.suwasewana.model.UserLoginModel;
import com.suwasewana.model.UserRegistrationModel;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {
    @SuppressWarnings("SqlResolve")
    private static final String CHECK_LOGIN_VALIDATION = "SELECT * FROM `citizen` WHERE `uMobile` = ? and `uPassword` = ?";
    private static final String USER_REGISTRATION = "INSERT INTO `citizen` VALUES (?,?,?,?,?,?,?,?,?,?,?);";
    private static final String USER_CREATE_APPOINTMENT = "INSERT INTO `appointment` VALUES (?, ?, ?, ?, NULL, current_timestamp(), ?, ?, ?, ?, ?, ?, ?,?);";
    private static final String USER_GET_APPOINTMENT_TYPE_NAME = "SELECT * FROM `appointment_type`";
    private static final String USER_GET_APPOINTMENT = "SELECT * FROM `appointment` LEFT JOIN `appointment_type` ON appointment.appointmentType = appointment_type.appointment_type_no WHERE user = ?";
    private static final String USER_DELETE_APPOINTMENT = "DELETE FROM `appointment` WHERE `appointment`.`appointmentId` = ?";
    private static  final  String INSERT_COMPLAIN="INSERT INTO `suwaserwana_db`.`user_complains` " +
            "(`CType`, `UType`, `User`, `CTitle`, `CMessage`, `PHIId`, `Status`) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?);";
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
                String mobile = rs.getString("uMobile");
                String password = rs.getString("uPassword");
                String nic = rs.getString("uNic");
                if (mobile.equals(userLogin.getMobile()) && password.equals(userLogin.getPassword())) {
                    UserLoginModel userLoginDetails = new UserLoginModel(mobile, password, nic);
                    return userLoginDetails;
                }
            }
            return new UserLoginModel("", "", "");
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return userLogin;
    }

    public String UserRegistration(UserRegistrationModel userRegister) {
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

    public String UserMakeAppointment(AppointmentModel appointment) {
        System.out.println("data come to dao");
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_CREATE_APPOINTMENT)) {
            preparedStatement.setString(1, appointment.getaTitle());
            preparedStatement.setString(2, appointment.getAppointmentType());
            preparedStatement.setString(3, appointment.getPhi());
            preparedStatement.setString(4, appointment.getReason());
            preparedStatement.setString(5, String.valueOf(1));
            preparedStatement.setString(6, "");
            preparedStatement.setString(7, "");
            preparedStatement.setString(8, "");
            preparedStatement.setString(9, "");
            preparedStatement.setString(10, "pending");
            preparedStatement.setString(11, appointment.getUser());
            preparedStatement.setString(12, null);
            int rs = preparedStatement.executeUpdate();
            System.out.println("dao value" + rs);

            return "success";
        } catch (SQLException throwables) {
            printSQLException(throwables);
            ;
            return throwables.getMessage();
        }


    }

    public ArrayList<AppointmentModel> userGetAppointmentDetails(AppointmentModel appointmentDetails) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_GET_APPOINTMENT)) {
            preparedStatement.setString(1, appointmentDetails.getUser());
            System.out.println(appointmentDetails.getUser());
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<AppointmentModel> appointmentList = new ArrayList<AppointmentModel>();
            while (rs.next()) {
                String aTitle = rs.getString("aTitle");
                String AType = rs.getString("name");
                String phi = rs.getString("phi");
                String reason = rs.getString("reason");
                String aId = rs.getString("appointmentId");
                String p_date = rs.getString("posted_data");
                String round = rs.getString("round");
                String location = rs.getString("location");
                String ts1 = rs.getString("time_slot2");
                String ts2 = rs.getString("time_slot1");
                String spNote = rs.getString("special_notice");
                String status = rs.getString("status");
                String user = rs.getString("user");
                AppointmentModel temp = new AppointmentModel(
                        aTitle,
                        AType,
                        phi,
                        reason,
                        aId,
                        p_date,
                        round,
                        location,
                        ts1,
                        ts2,
                        spNote,
                        status,
                        user
                );
                appointmentList.add(temp);
            }
            return appointmentList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }

    public ArrayList<AppointmentTypeModel> userGetAppointmentTypes() {
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_GET_APPOINTMENT_TYPE_NAME)) {
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<AppointmentTypeModel> appointmentTypeList = new ArrayList<AppointmentTypeModel>();
            while (rs.next()) {
                String typeName = rs.getString("name");
                String typeNumber = rs.getString("appointment_type_no");

                AppointmentTypeModel temp = new AppointmentTypeModel(typeNumber, typeName);
                appointmentTypeList.add(temp);
            }
            return appointmentTypeList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }

    public String UserDeleteAppointment(String appointmentId) throws SQLException {
        boolean rowDeleted;
        try (
                PreparedStatement preparedStatement = connection.prepareStatement(USER_DELETE_APPOINTMENT)) {
            preparedStatement.setString(1, appointmentId);
            rowDeleted = preparedStatement.executeUpdate() > 0;
            System.out.println(preparedStatement);
            return "success";
        } catch (SQLException throwables) {
            return throwables.getMessage();
        }
    }
    public String UserMakeComplain(ComplainModel complainModel) {
        System.out.println("data come to dao");
        try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_COMPLAIN)) {
            preparedStatement.setString(1, complainModel.getCType());
            preparedStatement.setString(2, complainModel.getUType());
            preparedStatement.setString(3, complainModel.getUser());
            preparedStatement.setString(4, complainModel.getCTitle());
            preparedStatement.setString(5, complainModel.getCMessage());
            preparedStatement.setString(6, complainModel.getPHIId());
            preparedStatement.setString(7, complainModel.getStatus());

            int  rs = preparedStatement.executeUpdate();
            System.out.println("dao value" + rs);

            return  "success";
        } catch (SQLException throwables) {
            printSQLException(throwables);;
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
