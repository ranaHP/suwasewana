package com.suwasewana.dao;

import com.google.gson.Gson;
import com.suwasewana.core.DB;
import com.suwasewana.core.ResponseType;
import com.suwasewana.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AppointmentDAO {
    private Gson gson = new Gson();
    Connection connection;

    public AppointmentDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }
    private static final String CHECK_LOGIN_VALIDATION = "SELECT * FROM `user` WHERE `uMobile` = ? and `uPassword` = ?";
    private static final String APPOINTMENTS_TYPES = "SELECT * FROM `appointment_type` ;";
    private static final String ADD_APPOINTMENTS_TYPES = "INSERT INTO `appointment_type` (`apponitment_type_id`, `appointment_type`, `description`) VALUES (NULL, 'Grade 5 Scholarship', NULL),(NULL, 'To Discuss Complaint', NULL) , (NULL, 'Other', NULL)";
    private static final String GET_APPOINTMENTS_FOR_PHI = "SELECT * FROM (SELECT * FROM (SELECT * FROM `user_appoinmnet` WHERE `user_appoinmnet`.`aPhi` = ?)  AS phi_appointment\n" +
            "LEFT JOIN `user` ON `user`.`uNic` = `phi_appointment`.`user_nic`) AS user_appointment LEFT JOIN `appointment_type`\t ON `appointment_type`.`apponitment_type_id` = `user_appointment`.`aType`";
    private static final String SELECT_APPOINTMENTS_FOR_PHI="SELECT * FROM (SELECT * FROM (SELECT * FROM `user_appoinmnet` WHERE `user_appoinmnet`.`aPhi` = ? and `user_appoinmnet`.`status` ='pending')  AS phi_appointment LEFT JOIN `user` ON `user`.`uNic` = `phi_appointment`.`user_nic`) AS user_appointment LEFT JOIN `appointment_type` ON `appointment_type`.`apponitment_type_id` = `user_appointment`.`aType`;";
    private static final String APPOINTMENTS_GIVE_TIME_SLOT = "UPDATE `user_appoinmnet` SET `phi_message` = ? , `user_appoinmnet`.`time_slot_1` = STR_TO_DATE(?, '%Y-%m-%d %T') , `user_appoinmnet`.`time_slot_2` = STR_TO_DATE(?, '%Y-%m-%d %T') , `user_appoinmnet`.`time_slot_1_end` = STR_TO_DATE(?, '%Y-%m-%d %T') ,`user_appoinmnet`.`time_slot_2_end` = STR_TO_DATE(?, '%Y-%m-%d %T'), `user_appoinmnet`.`status` = ? ,`user_appoinmnet`.`alocation` = ? WHERE `user_appoinmnet`.`app_id` = ?";
    private static final String USER_CHOOSE_TIME_SLOT = "UPDATE `user_appoinmnet` SET `status` = ? WHERE `user_appoinmnet`.`app_id` = ?;";
    private static final String USER_REQUEST_TIME_SLOT_AGAIN = "UPDATE `user_appoinmnet` SET `status` = ? , `round` = ?  WHERE `user_appoinmnet`.`app_id` = ?;";
    private static final String REJECT_APPOINTMENT = "UPDATE `user_appoinmnet` SET `status` = ? , `user_appoinmnet`.`phi_message` = ? WHERE `user_appoinmnet`.`app_id` = ?;";


    public ArrayList<AppointmentForPHIModel> GetAppoinment_For_PHI_Dashboard(String uNic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_APPOINTMENTS_FOR_PHI)) {
            preparedStatement.setString(1, uNic);
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<AppointmentForPHIModel> appointmentList = new ArrayList<AppointmentForPHIModel>();
            while (rs.next()) {

                AppointmentModel appointment = new AppointmentModel(
                        rs.getString("aTitle"),
                        rs.getString("aType"),
                        rs.getString("aPhi"),
                        rs.getString("aReason"),
                        rs.getString("app_id"),
                        rs.getString("posted_date_time"),
                        rs.getString("round"),
                        rs.getString("alocation"),
                        rs.getString("time_slot_1"),
                        rs.getString("time_slot_2"),
                        rs.getString("phi_message"),
                        rs.getString("status"),
                        rs.getString("user_nic"),
                        rs.getString("time_slot_1_end"),
                        rs.getString("time_slot_2_end")
                );
                AppointmentTypeModel appointmentType = new AppointmentTypeModel(
                        rs.getString("apponitment_type_id"),
                        rs.getString("appointment_type")
                );

                User user = new User(
                        rs.getString("uMobile"),
                        rs.getString("uname"),
                        rs.getString("uPassword"),
                        rs.getString("uNic"),
                        rs.getString("uProvince"),
                        rs.getString("uDistrict"),
                        rs.getString("uCity"),
                        rs.getString("uMoh"),
                        rs.getString("location"),
                        rs.getString("login_status"),
                        rs.getString("suspended_time"),
                        rs.getString("street_no"),
                        rs.getString("address_line1"),
                        rs.getString("zip_code")
                );

                AppointmentForPHIModel temp = new AppointmentForPHIModel(appointment,appointmentType,user);
                appointmentList.add(temp);
            }
            return appointmentList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }

    public ArrayList<AppointmentTypeModel> getAppointmentTypes() {
        try (PreparedStatement preparedStatement = connection.prepareStatement(APPOINTMENTS_TYPES)) {

            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<AppointmentTypeModel> appointmentTypeList = new ArrayList<AppointmentTypeModel>();
            while (rs.next()) {
                String typeName = rs.getString("appointment_type");
                String typeNumber = rs.getString("apponitment_type_id");
                AppointmentTypeModel temp = new AppointmentTypeModel(typeNumber, typeName);
                appointmentTypeList.add(temp);
            }
            return appointmentTypeList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return null;
    }
    public ArrayList<AppointmentForPHIModel> getAppointmentForPHI(String nic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(GET_APPOINTMENTS_FOR_PHI)) {
            preparedStatement.setString(1, nic);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println("preparedStatement");
            System.out.println(preparedStatement);
            ArrayList<AppointmentForPHIModel> appointmentList = new ArrayList<AppointmentForPHIModel>();
            while (rs.next()) {
                System.out.println( rs.getString("aTitle"));
                AppointmentModel appointment = new AppointmentModel(
                        rs.getString("aTitle"),
                        rs.getString("aType"),
                        rs.getString("aPhi"),
                        rs.getString("aReason"),
                        rs.getString("app_id"),
                        rs.getString("posted_date_time"),
                        rs.getString("round"),
                        rs.getString("alocation"),
                        rs.getString("time_slot_1"),
                        rs.getString("time_slot_2"),
                        rs.getString("phi_message"),
                        rs.getString("status"),
                        rs.getString("user_nic"),
                        rs.getString("time_slot_1_end"),
                        rs.getString("time_slot_2_end")
                );
                AppointmentTypeModel appointmentType = new AppointmentTypeModel(
                        rs.getString("apponitment_type_id"),
                        rs.getString("appointment_type")
                );

                User user = new User(
                        rs.getString("uMobile"),
                        rs.getString("uname"),
                        rs.getString("uPassword"),
                        rs.getString("uNic"),
                        rs.getString("uProvince"),
                        rs.getString("uDistrict"),
                        rs.getString("uCity"),
                        rs.getString("uMoh"),
                        rs.getString("location"),
                        rs.getString("login_status"),
                        rs.getString("suspended_time"),
                        rs.getString("street_no"),
                        rs.getString("address_line1"),
                        rs.getString("zip_code")
                );

                AppointmentForPHIModel temp = new AppointmentForPHIModel(appointment,appointmentType,user);
                appointmentList.add(temp);
            }
            return appointmentList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return null;
    }


    public ResponseType appointmentChangeTimeSlot(AppointmentModel appointment) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(APPOINTMENTS_GIVE_TIME_SLOT)) {
            preparedStatement.setString(1, appointment.getPhi_message());
            preparedStatement.setString(2, appointment.getTime_slot_1());
            preparedStatement.setString(3, appointment.getTime_slot_2());
            preparedStatement.setString(4, appointment.getTime_slot_1_end());
            preparedStatement.setString(5, appointment.getTime_slot_2_end());
            preparedStatement.setString(6, appointment.getStatus());
            preparedStatement.setString(7, appointment.getAlocation());
            preparedStatement.setString(8   , appointment.getApp_id()  );
            int rs = preparedStatement.executeUpdate();
            if(rs == 1){
                return new ResponseType("success" ,"Update Successful");
            }else{
                return new ResponseType("error" ,"Update Unsuccessful");
            }

        } catch (SQLException throwables) {
            return new ResponseType("error" ,throwables.getMessage());
        }
    }
    public ResponseType chooseTimeSlot(AppointmentModel appointment) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_CHOOSE_TIME_SLOT)) {
            preparedStatement.setString(1, appointment.getStatus());
            preparedStatement.setString(2, appointment.getApp_id());
            int rs = preparedStatement.executeUpdate();
            if(rs == 1){
                return new ResponseType("success" ,"Successful Time Slot Booked");
            }else{
                return new ResponseType("error" ,"Time Slot Selection Unsuccessful");
            }

        } catch (SQLException throwables) {
            return new ResponseType("error" ,throwables.getMessage());
        }
    }
    public ResponseType requestTimeSlotAgain(AppointmentModel appointment) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_REQUEST_TIME_SLOT_AGAIN)) {
            preparedStatement.setString(1, appointment.getStatus());
            preparedStatement.setString(2, appointment.getRound());
            preparedStatement.setString(3, appointment.getApp_id());
            int rs = preparedStatement.executeUpdate();
            if(rs == 1){
                return new ResponseType("success" ,"Successful Time Slot Booked");
            }else{
                return new ResponseType("error" ,"Time Slot Selection Unsuccessful");
            }

        } catch (SQLException throwables) {
            return new ResponseType("error" ,throwables.getMessage());
        }
    }
    public ResponseType rejectAppointment(AppointmentModel appointment) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(REJECT_APPOINTMENT)) {
            preparedStatement.setString(1, appointment.getStatus());
            preparedStatement.setString(2, appointment.getPhi_message());
            preparedStatement.setString(3, appointment.getApp_id());
            int rs = preparedStatement.executeUpdate();
            if(rs == 1){
                return new ResponseType("success" ,"Appointment Successful Rejected");
            }else{
                return new ResponseType("error" ,"Appointment Rejection Fail");
            }

        } catch (SQLException throwables) {
            return new ResponseType("error" ,throwables.getMessage());
        }
    }

//    public ArrayList<AppointmentTypeModel> userGetAppointmentTypes() {
//        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_GET_APPOINTMENT_TYPE_NAME)) {
//            ResultSet rs = preparedStatement.executeQuery();
//            ArrayList<AppointmentTypeModel> appointmentTypeList = new ArrayList<AppointmentTypeModel>();
//            while (rs.next()) {
//                String typeName = rs.getString("name");
//                String typeNumber = rs.getString("appointment_type_no");
//
//                AppointmentTypeModel temp = new AppointmentTypeModel(typeNumber, typeName);
//                appointmentTypeList.add(temp);
//            }
//            return appointmentTypeList;
//        } catch (SQLException throwables) {
//            printSQLException(throwables);
//        }
//
//        return null;
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
