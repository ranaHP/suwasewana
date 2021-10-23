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
    private static final String USER_REGISTRATION = "INSERT INTO `citizen` VALUES (?,?,?,?,?,?,?,?,?,?,?,?);";
    private static final String USER_CREATE_APPOINTMENT = "INSERT INTO `appointment` VALUES (?, ?, ?, ?, NULL, current_timestamp(), ?, ?, ?, ?, ?, ?, ?,?);";
    private static final String USER_GET_APPOINTMENT_TYPE_NAME = "SELECT * FROM `appointment_type`";
    private static final String USER_GET_APPOINTMENT = "SELECT * FROM `appointment` LEFT JOIN `appointment_type` ON appointment.appointmentType = appointment_type.appointment_type_no WHERE user = ?";
    private static final String USER_DELETE_APPOINTMENT = "DELETE FROM `appointment` WHERE `appointment`.`appointmentId` = ?";
    private static  final  String INSERT_COMPLAIN="INSERT INTO `suwaserwana_db`.`user_complains` " +
            "(`CType`, `UType`, `User`, `CTitle`, `CMessage`, `PHIId`, `Status`) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?);";
    private static final  String USER_LOGIN_ATTEMPT = "SELECT login_status FROM `citizen` WHERE uMobile = ?";
    private static final  String USER_LOGIN_SUSPENDED_TIME = "SELECT suspended_time FROM `citizen` WHERE uMobile = ?; ";
    private static final  String USER_LOGIN_ATTEMPT_CHANGE = "UPDATE `citizen` SET `login_status` = ? WHERE `citizen`.`uMobile` = ?; ";
    Connection connection;

    public UserDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }
    public String GetLoginSuspendedTime(UserLoginModel userLogin) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_LOGIN_SUSPENDED_TIME)) {
            preparedStatement.setString(1, userLogin.getMobile());
            Integer rs = preparedStatement.executeUpdate();

        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return "";
    }

    public void GetLoginAttemptChange(UserLoginModel userLogin , String attempt) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_LOGIN_ATTEMPT_CHANGE)) {
            preparedStatement.setString(1, attempt);
            preparedStatement.setString(2, userLogin.getMobile());
            System.out.println(preparedStatement);

            Integer rs = preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        System.out.println("in to chnage out");

    }

    public void GetLoginAttemptChangeSupport(UserLoginModel userLogin) {
        String loginStatus = new String(CheckLoginAttempt(userLogin));
        System.out.println("in to support");
        switch(loginStatus){
            case "0":
                GetLoginAttemptChange(userLogin, "1");
                return;
            case "1":
                GetLoginAttemptChange(userLogin, "2");
                return;
            case "2":
                GetLoginAttemptChange(userLogin, "3");
                return;
            case "3":
                GetLoginAttemptChange(userLogin,"-1");
                return;
            default:
                return;
        }
    }
    public String CheckLoginAttempt(UserLoginModel userLogin) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_LOGIN_ATTEMPT)) {
            preparedStatement.setString(1, userLogin.getMobile());
            ResultSet rs = preparedStatement.executeQuery();
            String mobile = "";
            while (rs.next()) {
                mobile = rs.getString("login_status");
            }
            return mobile;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return "";
    }

    public UserLoginModel CheckLoginValidationStatus(UserLoginModel userLogin) {
        String loginStatus = new String(CheckLoginAttempt(userLogin));
        switch(loginStatus){
            case "0":
            case "1":
            case "2":
            case "3":
                return  CheckLoginValidation(userLogin);
            case "-1":
                UserLoginModel loginModel = new UserLoginModel("", "", "");
                loginModel.setMessage("User account temporarily suspended. Please try again after 5 minutes");
                return  loginModel;
            case "4":
                UserLoginModel loginModel1 = new UserLoginModel("", "", "");
                loginModel1.setMessage("User Already logged into the system. Please logout from another device and try again");
                return  loginModel1;
            default:
                break;
        }
        return new UserLoginModel("", "", "");
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
                System.out.println(mobile + " - " + password + " - " + nic );
                if (mobile.equals(userLogin.getMobile()) && password.equals(userLogin.getPassword())) {
                    UserLoginModel userLoginDetails = new UserLoginModel(mobile, password, nic);
                    GetLoginAttemptChange(userLogin, "4");
                    return userLoginDetails;
                }else{
                    GetLoginAttemptChangeSupport(userLogin);
                }
            }
            return new UserLoginModel("", "", "");
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return new UserLoginModel("", "", "");
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
