
package com.suwasewana.dao;

import com.google.gson.Gson;
import com.suwasewana.core.DB;
import com.suwasewana.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

public class UserDAO {
    @SuppressWarnings("SqlResolve")
    private Gson gson = new Gson();
    private static final String CHECK_LOGIN_VALIDATION = "SELECT * FROM `user` WHERE `uMobile` = ? and `uPassword` = ?";
    private static final String USER_REGISTRATION = "INSERT INTO `user` VALUES (?,?,?,?,?,?,?,?,?,?,?,current_timestamp());";
    private static final String USER_CREATE_APPOINTMENT = "INSERT INTO `user_appoinmnet` " +
            "(`app_id`, `aTitle`, `aType`, `aReason`, `status`, `user_nic`, `posted_date_time`, `phi_message`, `aPhi`, `time_slot_1`, `time_slot_2`, `round`, `alocation`, `time_slot_2_end`, `time_slot_1_end`) "
            + "VALUES (NULL, ?, ?, ?, ?, ?, current_timestamp(), ?, ?,  current_timestamp(),  current_timestamp(), ? , ? ,  current_timestamp(),  current_timestamp());";
    private static final String USER_GET_APPOINTMENT_TYPE_NAME = "SELECT * FROM `appointment_type`";
    private static final String USER_DELETE_APPOINTMENT = "DELETE FROM `appointment` WHERE `appointment`.`appointmentId` = ?";


    private static final String USER_GET_Complain = "SELECT * FROM suwasewana_db.user_complaint left JOIN (SELECT nic,full_name FROM suwasewana_db.phi) AS PT ON user_complaint.phi_id=PT.nic WHERE user=?;";

    //    private static final String SEARCH_COMPLAIN_both = "SELECT * FROM user_complains left JOIN (SELECT phi_Id,full_name FROM phi_officer) AS PT ON user_complains.PHIId=PT.phi_Id  where CType=? and CTitle like ?;";
    private static final String SEARCH_COMPLAIN_both = "SELECT * FROM suwasewana_db.user_complaint left JOIN (SELECT nic,full_name FROM suwasewana_db.phi) AS PT ON user_complaint.phi_id=PT.nic  where complaint_type_id=? and tittle like ? and user=?;";

    //    private static final String SEARCH_COMPLAIN_type="SELECT * FROM user_complains  left JOIN (SELECT phi_Id,full_name FROM phi_officer) AS PT ON user_complains.PHIId=PT.phi_Id where CType = ?;";
    private static final String SEARCH_COMPLAIN_type="SELECT * FROM suwasewana_db.user_complaint  left JOIN (SELECT nic,full_name FROM suwasewana_db.phi) AS PT ON user_complaint.phi_id=PT.nic where complaint_type_id = ? and user=?;";


    //    private static final String SEARCH_COMPLAIN_title="SELECT * FROM user_complains  left JOIN (SELECT phi_Id,full_name FROM phi_officer) AS PT ON user_complains.PHIId=PT.phi_Id where CTitle like ?;";
    private static final String SEARCH_COMPLAIN_title="SELECT * FROM suwasewana_db.user_complaint  left JOIN (SELECT nic,full_name FROM suwasewana_db.phi) AS PT ON user_complaint.phi_id=PT.nic where tittle like ? and user=?;";


    private static final  String USER_LOGIN_ATTEMPT = "SELECT login_status FROM `user` WHERE uMobile = ?";
    private static final  String USER_LOGIN_SUSPENDED_TIME = "SELECT DATE_ADD(suspended_time, INTERVAL 5 minute) AS suspended_time FROM `user` WHERE uMobile = ? AND DATE_ADD(suspended_time, INTERVAL 5 minute) > current_timestamp(); ";
    private static final  String USER_LOGOUT = "UPDATE `user` SET `login_status` = '0' WHERE `user`.`uNic` = ?; ";
    private static final  String USER_LOGIN_ATTEMPT_CHANGE = "UPDATE `user` SET `login_status` = ? , `suspended_time` = current_timestamp() WHERE `user`.`uMobile` = ?; ";
    private static  final  String INSERT_COMPLAIN="INSERT INTO `suwasewana_db`.`user_complaint` " +
            "(`tittle`, `description`, `user`, `status`, `phi_message`, `phi_id`, `complaint_type_id`, `moh`, `img1`, `img2`, `img3`) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);\n";

    private static final  String USER_GET_Vaccine_clinic_Details = "SELECT * FROM suwasewana_db.vaccine_clinic_session vc  left join suwasewana_db.vaccine v on v.v_id=vc.v_id where vc.target_moh=?; ";
    private static final  String CheckVaccineRegistration = "SELECT * FROM suwasewana_db.user_vaccine where nic=? and clinic_id=?; ";
    private static final  String UpdateVAccineClinicData="UPDATE `suwasewana_db`.`vaccine_clinic_session` SET `max_patient` = ?, `next_Available_time_slote` = ? WHERE (`vcs_id` = ?);\n";
    private static final  String Insert_Vaccine_User_Registreation="BEGIN;INSERT INTO `suwasewana_db`.`user_vaccine` (`nic`, `vaccine_id`, `clinic_id`, `allocate_date_time`,`Tpno`) VALUES (?, ?, ?, ?,?); COMMIT;";
    private static final  String selectRegisterdVaccineClinic="SELECT * FROM suwasewana_db.user_vaccine uv left join suwasewana_db.vaccine v on uv.vaccine_id=v.v_id left join suwasewana_db.vaccine_clinic_session vc on vc.vcs_id=uv.clinic_id where nic=?;";
    private static final  String CancleClinic="BEGIN;DELETE FROM `suwasewana_db`.`user_vaccine` WHERE (`reg_No` = ?) ; UPDATE `suwasewana_db`.`vaccine_clinic_session` SET `max_patient` = ? WHERE (`vcs_id` = ?); COMMIT;";
//    private static final  String updateClinicdosge = "UPDATE `suwasewana_db`.`vaccine_clinic_session` SET `max_patient` = ? WHERE (`vcs_id` = ?);\n";

    private static final  String getUserTpMohIt="SELECT uMobile,uMoh FROM suwasewana_db.user where uNic=?;";

    private static final  String USER_VIEW_CLINIC_ANNOUNCEMENT = "SELECT * FROM clinic_announcement ca left join normal_clinic_session ncs on ncs.ncs_id=ca.clinic_id where ncs.target_moh=?; ";

    private static final String  USERREGISTERCLINC ="INSERT INTO `clinic_registered_patient`  VALUES (?,?,?,NULL);";

    private static final String  USER_CANCEL_REGISTER_CLINIC ="DELETE FROM `suwasewana_db`.`clinic_registered_patient` WHERE `u_nic`  = ? AND `ncs_id` = ?;";

    private static final String USER_HOME_VIEW_ANNOUNCEMENTS="SELECT * FROM `normal_clinic_session` AS cs LEFT JOIN `clinic_registered_patient` AS cp ON cs.ncs_id=cp.ncs_id WHERE u_nic IS NULL OR `u_nic` !=? AND `target_moh`=?;";
//    private static final  String getUserTpMohIt="SELECT uMobile,uMoh FROM suwasewana_db.user where uNic=?;";

    Connection connection;


    private static final String USER_VIEW_GOVERMENT_ANNOUNCEMENT = "SELECT * FROM `health_announcement` LEFT JOIN `health_announcement_target_districts` ON health_announcement.announcement_id=health_announcement_target_districts.announcement_id LEFT JOIN `user` ON user.uDistrict=health_announcement_target_districts.district_id WHERE `Unic`=?;";



    //    /fixed
    private static final String USER_GET_APPOINTMENT = "SELECT * FROM `user_appoinmnet` LEFT JOIN `appointment_type` ON `user_appoinmnet`.`aType` = `appointment_type`.`apponitment_type_id` WHERE `user_nic` = ?";

    private static final String USER_VIEW_ANNOUNCEMENTS="SELECT * FROM `normal_clinic_session` AS cs LEFT JOIN `clinic_registered_patient` AS cp ON cs.ncs_id=cp.ncs_id WHERE u_nic IS NULL OR `u_nic` !=? AND `target_moh`=?;";

    private static final String USER_VIEW_REGISTERED_CLINICS ="SELECT * FROM `normal_clinic_session` AS cs LEFT JOIN `clinic_registered_patient` AS cp ON cs.ncs_id=cp.ncs_id  where u_nic= ?";;



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

    public String checkVacccinRegstration(String nic, String cId) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(CheckVaccineRegistration)) {
            preparedStatement.setString(1, nic);
            preparedStatement.setString(2, cId);
            ResultSet rs = preparedStatement.executeQuery();

            if(rs.next()){

                return "alreadyHave";
            }else{

                return "notyet";
            }
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return "";
    }
    //cancle registerd clinics


    public String CancleRegisterdVaccineClinic(String Regno,String availabledose,String clinicid) {

        try (PreparedStatement preparedStatement = connection.prepareStatement(CancleClinic)) {
            preparedStatement.setString(1, Regno );
            preparedStatement.setString(2, availabledose );
            preparedStatement.setString(3, clinicid );

            int  rs = preparedStatement.executeUpdate();
            System.out.println("Prepare statment in cancle cilic: "+preparedStatement);


            return  "success";
        }  catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return "";

    }

    //Register for vaccine clinic - user



    public String UserRegisterForVaccineClinic(String new_next_sloat,
                                               String Set_sloat,
                                               String avalabel_seats,
                                               String vaccine_clinic_id,
                                               String date,
                                               String vaccine_id,
                                               String nic,
                                               String Tp
    ) {
        System.out.println("data come to create complain dao");
        try (PreparedStatement preparedStatement = connection.prepareStatement(UpdateVAccineClinicData)) {
            preparedStatement.setString(1, avalabel_seats );
            preparedStatement.setString(2, new_next_sloat );
            preparedStatement.setString(3, vaccine_clinic_id );
            int rs = preparedStatement.executeUpdate();
            updateUserVaccineDetails(nic,vaccine_id,date,Set_sloat,vaccine_clinic_id,Tp);

            return  "success";
        } catch (SQLException | ParseException throwables) {
            printSQLException((SQLException) throwables);
        }
        return "";

    }
    //update vaccine details of user
    public String updateUserVaccineDetails(String nic,String vaccine_id,String date,String Set_sloat,String vaccine_clinic_id, String Tp) throws ParseException {

        String dateFoVaccination=date+" "+Set_sloat;

        try (PreparedStatement preparedStatement = connection.prepareStatement(Insert_Vaccine_User_Registreation)) {
            preparedStatement.setString(1, nic);
            preparedStatement.setString(2, vaccine_id);
            preparedStatement.setString(3, vaccine_clinic_id);
            preparedStatement.setString(4, (dateFoVaccination));
            preparedStatement.setString(5, (Tp));

            System.out.println(preparedStatement);
            int rs = preparedStatement.executeUpdate();
            return "success";
        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }


    }

    public ArrayList<VaccineClinicAnnouncementsModelForUser> GetRegisterdVaccineClinicDetail(String nic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(selectRegisterdVaccineClinic)) {

            preparedStatement.setString(1, nic);
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<VaccineClinicAnnouncementsModelForUser> VaccineClinictList = new ArrayList<VaccineClinicAnnouncementsModelForUser>();
            while (rs.next()) {

                String regno=rs.getString("reg_No");

                String vaccine_name=rs.getString("name");
                String allocate_date_time=rs.getString("allocate_date_time");
                String max_sheet=rs.getString("max_patient");
                String location=rs.getString("location");
                String clinicid=rs.getString("clinic_id");

                VaccineClinicAnnouncementsModelForUser temp = new VaccineClinicAnnouncementsModelForUser(
                        regno,
                        "",
                        vaccine_name,
                        max_sheet,
                        location,
                        allocate_date_time,
                        allocate_date_time,
                        "",
                        "",
                        "",
                        clinicid,
                        "",
                        "",
                        ""

                );
                VaccineClinictList.add(temp);
            }
            return VaccineClinictList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }

    public ArrayList<User> GetUserMOHIdTpno(String nic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(getUserTpMohIt)) {
            preparedStatement.setString(1, nic);
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<User> UserDetails = new ArrayList<User>();
            while (rs.next()) {
                String mobile=rs.getString("uMobile");
                String mohid=rs.getString("uMoh");
                User temp = new User(
                        mobile,
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        mohid,
                        "",
                        "",
                        "",
                        "",
                        "",
                        ""

                );
                UserDetails.add(temp);
            }
            return UserDetails;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return null;
    }

    //    get vaccine clinic details for user to view available vaccine clinic
    public ArrayList<VaccineClinicAnnouncementsModelForUser> GetVaccineClinicDetail(String mohid,String nic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_GET_Vaccine_clinic_Details)) {


            preparedStatement.setString(1, mohid);
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<VaccineClinicAnnouncementsModelForUser> VaccineClinictList = new ArrayList<VaccineClinicAnnouncementsModelForUser>();
            while (rs.next()) {

                String vaccine_clinic_id=rs.getString("vcs_id");
                String vaccine_id=rs.getString("v_id");
                String vaccine_name=rs.getString("name");
                String max_sheet=rs.getString("max_patient");
                String location=rs.getString("location");
                String date=rs.getString("Start_date_time");
                String time=rs.getString("Start_date_time");
                String Low_age=rs.getString("lower_age_limit");
                String upper_age=rs.getString("upper_age_limit");
                String Dosage=rs.getString("dose_count");
                String Next_sloat=rs.getString("next_Available_time_slote");

                String status=checkVacccinRegstration(nic,vaccine_clinic_id);


                VaccineClinicAnnouncementsModelForUser temp = new VaccineClinicAnnouncementsModelForUser(
                        vaccine_clinic_id,
                        vaccine_id,
                        vaccine_name,
                        max_sheet,
                        location,
                        date,
                        time,
                        Low_age,
                        upper_age,
                        "",
                        "",
                        Dosage,
                        Next_sloat,
                        status

                );
                VaccineClinictList.add(temp);
            }
            return VaccineClinictList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
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
                    return userResponse;
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

    public Integer UserLogout(UserLoginModel userLogin) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_LOGOUT)) {
            preparedStatement.setString(1, userLogin.getUnic());
            Integer rs = preparedStatement.executeUpdate();
            System.out.println(rs);
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
            preparedStatement.setString(2, appointment.getaType());
            preparedStatement.setString(3, appointment.getaReason());
            preparedStatement.setString(4, "pending");
            preparedStatement.setString(5, appointment.getUser_nic());
            preparedStatement.setString(6, "");
            preparedStatement.setString(7, appointment.getaPhi());
            preparedStatement.setInt(8, 0);
            preparedStatement.setString(9, "");

            int rs = preparedStatement.executeUpdate();
            return "success";
        } catch (SQLException throwables) {
            printSQLException(throwables);
            ;
            return throwables.getMessage();
        }


    }

    public ArrayList<AppointmentModel> userGetAppointmentDetails(AppointmentModel appointmentDetails) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_GET_APPOINTMENT)) {
            preparedStatement.setString(1, appointmentDetails.getUser_nic());
            System.out.println(appointmentDetails.getUser_nic());
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<AppointmentModel> appointmentList = new ArrayList<AppointmentModel>();
            while (rs.next()) {
                String aTitle = rs.getString("aTitle");
                String aType  = rs.getString("aType");
                String aPhi  = rs.getString("aPhi");
                String aReason = rs.getString("aReason");
                String app_id = rs.getString("app_id");
                String posted_date_time = rs.getString("posted_date_time");
                String round = rs.getString("round");
                String alocation = rs.getString("alocation");
                String time_slot_1 = rs.getString("time_slot_1");
                String time_slot_2 = rs.getString("time_slot_2");
                String phi_message = rs.getString("phi_message");
                String status = rs.getString("status");
                String user_nic  = rs.getString("user_nic");
                String time_slot_2_end  = rs.getString("time_slot_2_end");
                String time_slot_1_end  = rs.getString("time_slot_1_end");
                AppointmentModel temp = new AppointmentModel(
                        aTitle,
                        aType ,
                        aPhi ,
                        aReason,
                        app_id,
                        posted_date_time,
                        round,
                        alocation,
                        time_slot_1,
                        time_slot_2,
                        phi_message,
                        status,
                        user_nic ,
                        time_slot_2_end ,
                        time_slot_1_end
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
        System.out.println("data come to create complain dao");
        try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_COMPLAIN)) {
            preparedStatement.setString(1, complainModel.getCTitle() );
            preparedStatement.setString(2, complainModel.getCMessage() );

            System.out.println("user type in dao "+ complainModel.getUType());
            if (complainModel.getUType().equals("0")) {
                System.out.println("Dont view user detail ");
                preparedStatement.setString(3, null);
            }
            else{
                System.out.println("view user detail ");
                preparedStatement.setString(3, complainModel.getUser() );
            }


            preparedStatement.setString(4, "Pending" );
            preparedStatement.setString(5, "" );
            preparedStatement.setString(6, complainModel.getPHIId() );
            preparedStatement.setString(7, complainModel.getCType() );
            preparedStatement.setString(8, complainModel.getMOH() );
            preparedStatement.setString(9, complainModel.getImg1() );
            preparedStatement.setString(10, complainModel.getImg2() );
            preparedStatement.setString(11, complainModel.getImg3() );
            System.out.println("SQL "+preparedStatement);
            int  rs = preparedStatement.executeUpdate();
            System.out.println("dao value" + rs);

            return  "success";
        } catch (SQLException throwables) {
            printSQLException(throwables);;
            return throwables.getMessage();
        }


    }

    public ArrayList<ComplainModel> SearchComplainDetails(String title, String type,String nic) {
        try {
            PreparedStatement preparedStatement;
            PreparedStatement preparedStatementboth ;
            PreparedStatement preparedStatementtitle;
            PreparedStatement preparedStatementtype ;
            ResultSet rs = null;
            if(type==null && title==""){
                preparedStatement = connection.prepareStatement(USER_GET_Complain);
                preparedStatement.setString(1, nic);
                rs = preparedStatement.executeQuery();
            }
            if(type!=null && title!=""){
                System.out.println("both have");
                preparedStatementboth = connection.prepareStatement(SEARCH_COMPLAIN_both);
                preparedStatementboth.setString(1, type);
                preparedStatementboth.setString(2,"%"+ title + "%");
                preparedStatementboth.setString(3, nic);
                System.out.println("SQL - "+preparedStatementboth);
                rs = preparedStatementboth.executeQuery();
            }
            if(type==null && title!=""){
                System.out.println("only title");
                preparedStatementtitle = connection.prepareStatement(SEARCH_COMPLAIN_title);
                preparedStatementtitle.setString(1, "%"+title+"%");
                preparedStatementtitle.setString(2, nic);
                System.out.println("SQL - "+preparedStatementtitle);
                rs = preparedStatementtitle.executeQuery();
            }
            if(type!=null && title==""){
                System.out.println("only type");
                preparedStatementtype = connection.prepareStatement(SEARCH_COMPLAIN_type);
                preparedStatementtype.setString(1, type);
                preparedStatementtype.setString(2, nic);
                System.out.println("SQL - "+preparedStatementtype);
                rs = preparedStatementtype.executeQuery();
            }


            ArrayList<ComplainModel> ComplainList = new ArrayList<ComplainModel>();
            System.out.println("come to view detail");
            while (rs.next()) {


                String CTitle = rs.getString("tittle");
                String Cmessage = rs.getString("description");
                String user = rs.getString("user");
                String Poster_Date = rs.getString("posted_date_time");
                String Status = rs.getString("status");
                String response = rs.getString("phi_message");
                String PID=rs.getString("phi_id");
                String Pname = rs.getString("full_name");
                String Ctype = rs.getString("complaint_type_id");
                String Utype = rs.getString("user");
                String MOH = rs.getString("moh");
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
                        img3,
                        response,
                        MOH

                );
                ComplainList.add(temp);
            }
            return ComplainList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return null;
    }

    public ArrayList<ComplainModel> userGetComplainDetails(ComplainModel complainDetails , String nic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_GET_Complain)) {
            preparedStatement.setString(1, nic );
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<ComplainModel> ComplainList = new ArrayList<ComplainModel>();
//            System.out.println("come to view detail");
            while (rs.next()) {


                String CTitle = rs.getString("tittle");
                String Cmessage = rs.getString("description");
                String user = rs.getString("user");
                String Poster_Date = rs.getString("posted_date_time");
                String Status = rs.getString("status");
                String response = rs.getString("phi_message");
                String PID=rs.getString("phi_id");
                String Pname = rs.getString("full_name");
                String Ctype = rs.getString("complaint_type_id");
                String Utype = rs.getString("user");
                String MOH = rs.getString("moh");
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
                        img3,
                        response,
                        MOH

                );

                ComplainList.add(temp);
            }
            return ComplainList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return null;
    }


    public ArrayList<UserViewClinicsModel> UserViewclinic(String unic, UserViewClinicsModel viewAnnouncement) {

        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_VIEW_ANNOUNCEMENTS)){
            System.out.println("came to dao");
            preparedStatement.setString(2,viewAnnouncement.getMOH());
            preparedStatement.setString(1,unic);
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<UserViewClinicsModel> ViewclinicAnnouncements = new ArrayList<UserViewClinicsModel>();
            while (rs.next()){
                String ncs_id = rs.getString("ncs_id");
                String title = rs.getString("title");
                String disease =rs.getString("disease");
                String location=rs.getString("location");
//                String TargetMOH = rs.getString("name");
                String DataTime = rs.getString("date");
                String time=rs.getString("time");
                String Duration = rs.getString("duration");
                String MaxPatient = rs.getString("max_sheet");
                String 	Avail_seats=rs.getString("Avail_seats");
                String Target=rs.getString("target_people");
                String Conduct = rs.getString("conduct_by");
                String Description = rs.getString("description");
                String cNic = rs.getString("clinical_officer");
                UserViewClinicsModel temp = new UserViewClinicsModel(

                        ncs_id,
                        title,
                        disease,
                        location,
                        "",
                        DataTime,
                        time,
                        Duration,
                        MaxPatient,
                        Avail_seats,
                        Target,
                        Conduct,
                        Description,
                        cNic

                );
                ViewclinicAnnouncements.add(temp);
                System.out.println(title+"--"+disease+"--"+location);
            };
            return ViewclinicAnnouncements;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }

    public ArrayList<UserViewRegisteredclinicsModel> userViewregisteredclinics(UserViewRegisteredclinicsModel viewregisteredclinics ,String nic) {

        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_VIEW_REGISTERED_CLINICS)){
            System.out.println("came to dao");
            preparedStatement.setString(1,viewregisteredclinics.getUNic());
            System.out.println(nic);
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<UserViewRegisteredclinicsModel> ViewclinicAnnouncements = new ArrayList<UserViewRegisteredclinicsModel>();
            while (rs.next()){
                String ncs_id = rs.getString("ncs_id");
                String title = rs.getString("title");
                String disease =rs.getString("disease");
                String location=rs.getString("location");
                String TargetMOH = rs.getString("avail_seats");
                String DataTime = rs.getString("date");
                String time=rs.getString("time");
                String Duration = rs.getString("duration");
                String MaxPatient = rs.getString("max_sheet");
                String Target=rs.getString("target_people");
                String Conduct = rs.getString("conduct_by");
                String Description = rs.getString("description");
                UserViewRegisteredclinicsModel temp = new UserViewRegisteredclinicsModel(

                        ncs_id,
                        title,
                        disease,
                        location,
                        TargetMOH,
                        DataTime,
                        time,
                        Duration,
                        MaxPatient,
                        Target,
                        Conduct,
                        Description


                );
                ViewclinicAnnouncements.add(temp);
                System.out.println(title+"--"+disease+"--"+location);
            };
            return ViewclinicAnnouncements;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
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

    public ArrayList<UserVIewClinicAnnouncementModel> UserviewrclinicAnnouncemet(UserVIewClinicAnnouncementModel clinicannouncement) {

        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_VIEW_CLINIC_ANNOUNCEMENT)){
            preparedStatement.setString(1,clinicannouncement.getMoh_id());
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<UserVIewClinicAnnouncementModel> ViewVAnnouncements = new ArrayList<UserVIewClinicAnnouncementModel>();
            while (rs.next()){
                String banner=rs.getString("banner");
                String title=rs.getString("title");
                String date=rs.getString("date");
                String description=rs.getString("description");
                String moh_id =rs.getString("target_moh");

                UserVIewClinicAnnouncementModel temp= new UserVIewClinicAnnouncementModel(
                        banner,
                        title,
                        date,
                        description,
                        moh_id

                );
                ViewVAnnouncements.add(temp);

            }
            return ViewVAnnouncements;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return null;
    }



    public String Userregisterclinic(UserViewRegisteredclinicsModel registerclinic, String ncs_id) {


        try (PreparedStatement preparedStatement = connection.prepareStatement(USERREGISTERCLINC)) {
            preparedStatement.setString(2, ncs_id );
            preparedStatement.setString(3, registerclinic.getDatetime());
            preparedStatement.setString(1, registerclinic.getUNic());
            int rs = preparedStatement.executeUpdate();


            return  "success";
        } catch (SQLException throwables) {
            printSQLException((SQLException) throwables);
        }

        return null;
    }


    public String Usercancellinic(String unic, UserViewClinicsModel cancelclinic) {


        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_CANCEL_REGISTER_CLINIC)) {
            preparedStatement.setString(2, cancelclinic.ncs_id );
            preparedStatement.setString(1, unic);
            int rs = preparedStatement.executeUpdate();


            return  "success";
        } catch (SQLException throwables) {
            printSQLException((SQLException) throwables);
        }

        return null;
    }


    public ArrayList<UserHomeViewClinicModel> UserHomeViewclinic(String unic, UserHomeViewClinicModel viewhomeclinic) {

        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_HOME_VIEW_ANNOUNCEMENTS)){
            System.out.println("came to dao");
            preparedStatement.setString(2,viewhomeclinic.getMOH());
            preparedStatement.setString(1,unic);
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<UserHomeViewClinicModel> ViewclinicAnnouncements = new ArrayList<UserHomeViewClinicModel>();
            while (rs.next()){
                String ncs_id = rs.getString("ncs_id");
                String title = rs.getString("title");
                String disease =rs.getString("disease");
                String location=rs.getString("location");
//                String TargetMOH = rs.getString("name");
                String DataTime = rs.getString("date");
                String time=rs.getString("time");
                String Duration = rs.getString("duration");
                String MaxPatient = rs.getString("max_sheet");
                String 	Avail_seats=rs.getString("Avail_seats");
                String Target=rs.getString("target_people");
                String Conduct = rs.getString("conduct_by");
                String Description = rs.getString("description");
                String cNic = rs.getString("clinical_officer");
                UserHomeViewClinicModel temp = new UserHomeViewClinicModel(

                        ncs_id,
                        title,
                        disease,
                        location,
                        "",
                        DataTime,
                        time,
                        Duration,
                        MaxPatient,
                        Avail_seats,
                        Target,
                        Conduct,
                        Description,
                        cNic

                );
                ViewclinicAnnouncements.add(temp);
                System.out.println(title+"--"+disease+"--"+location);
            };
            return ViewclinicAnnouncements;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;

    }

    public ArrayList<UserGovermentAnnouncementModel> UserGovermentannouncement(String Unic, UserGovermentAnnouncementModel govermentAnnouncement) {

//        System.out.println("data come to goverment 2 dao");

        try (PreparedStatement preparedStatement = connection.prepareStatement(USER_VIEW_GOVERMENT_ANNOUNCEMENT)){
            preparedStatement.setString(1,Unic);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println("data come to goverment dao");

            ArrayList<UserGovermentAnnouncementModel> ViewVAnnouncements = new ArrayList<UserGovermentAnnouncementModel>();
            while (rs.next()){
                String announcement_id=rs.getString("announcement_id");
                String title=rs.getString("title");
                String description=rs.getString("description");
                String banner=rs.getString("banner");
                String expire_date =rs.getString("expire_date");

                UserGovermentAnnouncementModel temp= new UserGovermentAnnouncementModel(
                        announcement_id,
                        title,
                        description,
                        banner,
                        expire_date

                );
                ViewVAnnouncements.add(temp);

            }
            return ViewVAnnouncements;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return null;
    }
}
