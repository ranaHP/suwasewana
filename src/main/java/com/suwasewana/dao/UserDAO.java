package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.*;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class UserDAO {
    @SuppressWarnings("SqlResolve")
    private static final String CHECK_LOGIN_VALIDATION = "SELECT * FROM `citizen` WHERE `uMobile` = ? and `uPassword` = ?";
    private static final String USER_REGISTRATION = "INSERT INTO `citizen` VALUES (?,?,?,?,?,?,?,?,?,?,?,current_timestamp());";
    private static final String USER_CREATE_APPOINTMENT = "INSERT INTO `appointment` VALUES (?, ?, ?, ?, NULL, current_timestamp(), ?, ?, ?, ?, ?, ?, ?,?);";
    private static final String USER_GET_APPOINTMENT_TYPE_NAME = "SELECT * FROM `appointment_type`";
    private static final String USER_GET_APPOINTMENT = "SELECT * FROM `appointment` LEFT JOIN `appointment_type` ON appointment.appointmentType = appointment_type.appointment_type_no WHERE user = ?";
    private static final String USER_DELETE_APPOINTMENT = "DELETE FROM `appointment` WHERE `appointment`.`appointmentId` = ?";


    private static final String USER_GET_Complain = "SELECT * FROM user_complains left JOIN (SELECT phi_Id,full_name FROM phi_officer) AS PT ON user_complains.PHIId=PT.phi_Id;";
    private static final String SEARCH_COMPLAIN_both = "SELECT * FROM user_complains left JOIN (SELECT phi_Id,full_name FROM phi_officer) AS PT ON user_complains.PHIId=PT.phi_Id  where CType=? and CTitle like ?;";
    private static final String SEARCH_COMPLAIN_type="SELECT * FROM user_complains  left JOIN (SELECT phi_Id,full_name FROM phi_officer) AS PT ON user_complains.PHIId=PT.phi_Id where CType = ?;";
    private static final String SEARCH_COMPLAIN_title="SELECT * FROM user_complains  left JOIN (SELECT phi_Id,full_name FROM phi_officer) AS PT ON user_complains.PHIId=PT.phi_Id where CTitle like ?;";

    private static final  String USER_LOGIN_ATTEMPT = "SELECT login_status FROM `citizen` WHERE uMobile = ?";
    private static final  String USER_LOGIN_SUSPENDED_TIME = "SELECT DATE_ADD(suspended_time, INTERVAL 5 minute) AS suspended_time FROM `citizen` WHERE uMobile = ? AND DATE_ADD(suspended_time, INTERVAL 5 minute) > current_timestamp(); ";
    private static final  String USER_LOGOUT = "UPDATE `citizen` SET `login_status` = '0' WHERE `citizen`.`uMobile` = ?; ";
    private static final  String USER_LOGIN_ATTEMPT_CHANGE = "UPDATE `citizen` SET `login_status` = ? , `suspended_time` = current_timestamp() WHERE `citizen`.`uMobile` = ?; ";
    private static  final  String INSERT_COMPLAIN="INSERT INTO `suwaserwana_db`.`user_complains` " +
            "(`CType`, `UType`, `User`, `CTitle`, `CMessage`, `PHIId`, `Status`,`img1`,`img2`,`img3`) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?,?,?,?);";


    private static final String USER_GET_HOME_ANNOUNCEMENT = "SELECT * FROM `normal_clinic_session` ";
    private static final String USER_GET_HOME_DISEASE = "SELECT * FROM `disease_cases` ";

    Connection connection;

    public UserDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }
    public String GetLoginSuspendedTime(UserLoginModel userLogin) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_LOGIN_SUSPENDED_TIME)) {
            preparedStatement.setString(1, userLogin.getMobile());
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(preparedStatement);

            if(rs.next()){
                System.out.println(rs.getString("suspended_time"));
                return rs.getString("suspended_time");
            }else{
                System.out.println("unblocked");
                GetLoginAttemptChange(userLogin, "0");
                return "unblocked";
            }
//            while (rs.next()) {
//                String suspended_time = rs.getString("suspended_time");
//                System.out.println("suspended_time");
//            }
//            System.out.println("unblocked");
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return "";
    }

    public UserLoginModel GetLoginAttemptChange(UserLoginModel userLogin , String attempt) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_LOGIN_ATTEMPT_CHANGE)) {
            preparedStatement.setString(1, attempt);
            preparedStatement.setString(2, userLogin.getMobile());
            System.out.println(preparedStatement);
            Integer rs = preparedStatement.executeUpdate();
            return new UserLoginModel("", "", "");
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        System.out.println("in to chnage out");
        return new UserLoginModel("", "", "");
    }

    public UserLoginModel GetLoginAttemptChangeSupport(UserLoginModel userLogin) {
        String loginStatus = new String(CheckLoginAttempt(userLogin));
        System.out.println("in to support");
        switch(loginStatus){
            case "0":
                return GetLoginAttemptChange(userLogin, "1");
            case "1":
                return GetLoginAttemptChange(userLogin, "2");
            case "2":
                return GetLoginAttemptChange(userLogin, "3");
            case "3":
                return GetLoginAttemptChange(userLogin,"-1");
            default:
                new UserLoginModel("", "", "");
        }
        return new UserLoginModel("", "", "");
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
                String getSuspendTime = GetLoginSuspendedTime(userLogin);
                if(getSuspendTime == "unblocked"){
                    return  CheckLoginValidationStatus(userLogin);
                }
                UserLoginModel loginModel = new UserLoginModel("", "", "");
                loginModel.setMessage("User account temporarily suspended. Please try again after " + getSuspendTime );
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
                UserLoginModel userResponse = new UserLoginModel(mobile, password , nic);
                userResponse.setuCity(rs.getString("uCity"));
                userResponse.setuProvince(rs.getString("uProvince"));
                userResponse.setuDistrict(rs.getString("uDistrict"));
                userResponse.setuMoh(rs.getString("uMoh"));
                userResponse.setUname(rs.getString("uname"));
                if (mobile.equals(userLogin.getMobile()) && password.equals(userLogin.getPassword())) {
                    UserLoginModel userLoginDetails = new UserLoginModel(mobile, password, nic);
                    GetLoginAttemptChange(userLogin, "4");
                    return userLoginDetails;
                }
            }
            System.out.println("in to support to 1");
            GetLoginAttemptChangeSupport(userLogin);
            return new UserLoginModel("", "", "");
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return new UserLoginModel("", "", "");
    }

    public Integer UserLogout(String uMobile) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_LOGOUT)) {
            preparedStatement.setString(1, uMobile);
            Integer rs = preparedStatement.executeUpdate();
            return rs;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return 0;
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
            preparedStatement.setString(11, "0");
            System.out.println(preparedStatement);
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
            preparedStatement.setString(8, complainModel.getImg1());
            preparedStatement.setString(9, complainModel.getImg2());
            preparedStatement.setString(10, complainModel.getImg3());

            int  rs = preparedStatement.executeUpdate();
            System.out.println("dao value" + rs);

            return  "success";
        } catch (SQLException throwables) {
            printSQLException(throwables);;
            return throwables.getMessage();
        }


    }

    public ArrayList<ComplainModel> SearchComplainDetails(String title, String type) {




        try {
            PreparedStatement preparedStatement;
            PreparedStatement preparedStatementboth ;
            PreparedStatement preparedStatementtitle;
            PreparedStatement preparedStatementtype ;
            ResultSet rs = null;
            if(type==null && title==""){
                preparedStatement = connection.prepareStatement(USER_GET_Complain);
                rs = preparedStatement.executeQuery();
            }
            if(type!=null && title!=""){
                System.out.println("both have");
                preparedStatementboth = connection.prepareStatement(SEARCH_COMPLAIN_both);
                preparedStatementboth.setString(1, type);
                preparedStatementboth.setString(2,"%"+ title + "%");
                rs = preparedStatementboth.executeQuery();
            }
            if(type==null && title!=""){
                System.out.println("only title");
                preparedStatementtitle = connection.prepareStatement(SEARCH_COMPLAIN_title);
                preparedStatementtitle.setString(1, "%"+title+"%");
                rs = preparedStatementtitle.executeQuery();
            }
            if(type!=null && title==""){
                System.out.println("only type");
                preparedStatementtype = connection.prepareStatement(SEARCH_COMPLAIN_type);
                preparedStatementtype.setString(1, type);
                rs = preparedStatementtype.executeQuery();
            }


            ArrayList<ComplainModel> ComplainList = new ArrayList<ComplainModel>();
            System.out.println("come to view detail");
            while (rs.next()) {
                String Ctype = rs.getString("CType");
                String Utype = rs.getString("UType");
                String user = rs.getString("User");
                String Poster_Date = rs.getString("Posted_Date");
                String CTitle = rs.getString("CTitle");
                String Cmessage = rs.getString("CMessage");
                String Status = rs.getString("Status");
                String Pname = rs.getString("full_name");
                String PID=rs.getString("PHIId");
                String img1=rs.getString("img1");
                String img2=rs.getString("img2");
                String img3=rs.getString("img3");

                ComplainModel temp = new ComplainModel(
                        CTitle,
                        Ctype,
                        Utype,
                        PID,
                        Cmessage,
                        Pname,
                        user,
                        Poster_Date,
                        Status,
                        img1,
                        img2,
                        img3
                );
                ComplainList.add(temp);
            }
            return ComplainList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return null;
    }

    public ArrayList<ComplainModel> userGetComplainDetails(ComplainModel complainDetails) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_GET_Complain)) {
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<ComplainModel> ComplainList = new ArrayList<ComplainModel>();
//            System.out.println("come to view detail");
            while (rs.next()) {
                String Ctype = rs.getString("CType");
                String Utype = rs.getString("UType");
                String user = rs.getString("User");
                String Poster_Date = rs.getString("Posted_Date");
                String CTitle = rs.getString("CTitle");
                String Cmessage = rs.getString("CMessage");
                String Status = rs.getString("Status");
                String Pname = rs.getString("full_name");
                String PID=rs.getString("PHIId");
                String img1=rs.getString("img1");
                String img2=rs.getString("img2");
                String img3=rs.getString("img3");

//                System.out.println("view detail"+CTitle);
                ComplainModel temp = new ComplainModel(
                        CTitle,
                        Ctype,
                        Utype,
                        PID,
                        Cmessage,
                        Pname,
                        user,
                        Poster_Date,
                        Status,
                        img1,
                        img2,
                        img3
                );
                ComplainList.add(temp);
            }
            return ComplainList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return null;
    }


    public ArrayList<UserHomeModel> userGethome(UserHomeModel homeDetails) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_GET_HOME_ANNOUNCEMENT )) {
//            preparedStatement.setString(1, homeDetails.getUser());
//            System.out.println(homeDetails.getUser());
            System.out.println("data come to dao");
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<UserHomeModel> homeList = new ArrayList<UserHomeModel>();
            while (rs.next()) {
                String ncs_id = rs.getString("ncs_id");
                String title = rs.getString("title");
                String start_time = rs.getString("start_time");
                String end_time = rs.getString("end_time");
                String date = rs.getString("date");
                String description = rs.getString("description");
                String max_sheet = rs.getString("max_sheet");
                String conduct_by = rs.getString("conduct_by");
                String target_moh = rs.getString("target_moh");
                String target_people = rs.getString("target_people");
                String location = rs.getString("location");
                String clinical_officer = rs.getString("clinical_officer");
                String banner = rs.getString("banner");
                UserHomeModel temp = new UserHomeModel(
                         ncs_id,
                         title,
                         start_time,
                         end_time,
                         date,
                         description,
                         max_sheet,
                         conduct_by,
                         target_moh,
                         target_people,
                         location,
                         clinical_officer,
                         banner
                );
                homeList.add(temp);
            }
            return homeList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }

    public ArrayList<UserHomeDiseaseModel> userGethomedisease(UserHomeDiseaseModel homediseaseDetails) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_GET_HOME_DISEASE )) {
//            preparedStatement.setString(1, homeDetails.getUser());
//            System.out.println(homeDetails.getUser());
            System.out.println("data come to disease dao");
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<UserHomeDiseaseModel> homediseaseList = new ArrayList<UserHomeDiseaseModel>();
            while (rs.next()) {
                String cases_record_id = rs.getString("cases_record_id");
                String district_id = rs.getString("district_id");
                String disease_id = rs.getString("disease_id");
                String city_id = rs.getString("city_id");
                String active_cases = rs.getString("active_cases");
                String death_cases = rs.getString("death_cases");
                String recovered_cases = rs.getString("recovered_cases");
                String date_time = rs.getString("date_time");
                String isVerified = rs.getString("isVerified");

                UserHomeDiseaseModel temp = new UserHomeDiseaseModel(
                        cases_record_id,
                        district_id,
                        disease_id,
                        city_id,
                        active_cases,
                        death_cases,
                        recovered_cases,
                        date_time,
                        isVerified

                );
                homediseaseList.add(temp);
            }
            return homediseaseList;
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
