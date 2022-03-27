package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.core.SuwasewanaHashing;
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
    private static final String UPDATE_MAC_IN_PHI = "UPDATE `phi` SET `device_mac`=? WHERE `mobile_number` = ? and `password` = ?";
    private static final String CHECK_pOST_WITH_VALIDATION = "SELECT * FROM `phi` WHERE `Mobile` = ? and `Password` = ? and `Post`=?";

    private static final String UpdateNewtoOld = "Update `phi` set `Password`=?,block='0'   WHERE `mobile_number` = ? and `Password` =  ? ";
    private static final String BlockPhiuser = "UPDATE `suwasewana_db`.`phi` SET `block` = '1' WHERE  (`mobile_number` = ?);";

    private static final String Check_PHI = "SELECT * FROM `phi` WHERE `mobile_number` = ? and `Password` =  ? ";
    private static final String Check_Clinical_Officer = "SELECT * FROM `clinicalofficer` WHERE mobile_number = ? and password = ? ";
    private static final String UPDATE_MAC_IN_Clinical_Officer = "UPDATE `clinicalofficer` SET `device_mac`=? WHERE `mobile_number` = ? and `password` = ?";
    private static final String Check_Admin  = "SELECT * FROM `admin` WHERE user_code = ? and password = ?";

    Connection connection;

    public OfficerDAO(){
        DB db = new DB();
        connection = db.getConnection();
    }
    public String updateToOld(String u,String op,String np){
        try (PreparedStatement UpdateStatement = connection.prepareStatement(UpdateNewtoOld)){

            SuwasewanaHashing hashingold = new SuwasewanaHashing(op);
            SuwasewanaHashing hashingnew = new SuwasewanaHashing(np);

            UpdateStatement.setString(2,u);
            UpdateStatement.setString(3,hashingold.getHashValue());
            UpdateStatement.setString(1,hashingnew.getHashValue());
                            System.out.println("update work for new user "+UpdateStatement);
            UpdateStatement.executeUpdate();
            return "success";
        }
        catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return "success";
    }
    public String blockUser(String u){
        try (PreparedStatement UpdateStatement = connection.prepareStatement(BlockPhiuser)){
            UpdateStatement.setString(1,u);
            UpdateStatement.executeUpdate();
            return "success";
        }
        catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return "success";
    }
    public String CheckNewOrOld(String mobile,String password) {
//        System.out.println("data come to create complain dao");
        try (PreparedStatement preparedStatement = connection.prepareStatement(Check_PHI)) {
            preparedStatement.setString(1, mobile);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();
                System.out.println(" --------------------- " + preparedStatement.toString());

            while (rs.next()) {

                String status = rs.getString("block");

                if(status.equals("-1")){
                    return "success";
                }
            }

            return "0";
        } catch (SQLException throwables) {
            printSQLException(throwables);
            ;
            return throwables.getMessage();
        }


    }

    public OfficerLoginModel CheckLoginValidation(OfficerLoginModel officerLogin , String post) {
        if(post.equals("phi")){
            System.out.println("This is a PHI");
            try (PreparedStatement preparedStatement = connection.prepareStatement(Check_PHI)) {
                SuwasewanaHashing hashing = new SuwasewanaHashing(officerLogin.getPassword());

                preparedStatement.setString(1, officerLogin.getMobile());
                preparedStatement.setString(2, officerLogin.getPassword());
                ResultSet rs = preparedStatement.executeQuery();
                System.out.println(" #--------------------- " + preparedStatement.toString());

                while (rs.next()) {

//                    System.out.println(" --------------------- ");
//                    System.out.println(rs.getString("mobile_number"));
//                    System.out.println(" --------------------- ");
                    String mobile = rs.getString("mobile_number");
                    String password = rs.getString("password");
                    String mac=rs.getString("device_mac");
                    String officerpost=rs.getString("phi_post");
                    String assignCity=rs.getString("assignCity");
                    String assignMOH=rs.getString("assignMOH");
                    String full_name=rs.getString("full_name");
                    String nic=rs.getString("nic");
                    String block=rs.getString("block");


                    System.out.println("mobile " + mobile+" - " +officerLogin.getMobile());
                    System.out.println("password "+password +" - "+officerLogin.getPassword());
                    if (mobile.equals(officerLogin.getMobile())){
                        System.out.println("valid mobile no");
                    }
                    if(password.equals(officerLogin.getPassword())){
                        System.out.println("VAlid password ");
                    }






                    if (mobile.equals(officerLogin.getMobile()) && password.equals(officerLogin.getPassword()) &&  ( mac==null || mac.equals("") )) {
                        System.out.println("null mach with correct us ps in phi");
                        String updateMAC=officerLogin.getMAC();
                        try (PreparedStatement UpdateStatement = connection.prepareStatement(UPDATE_MAC_IN_PHI)){
                            UpdateStatement.setString(1,updateMAC);
                            UpdateStatement.setString(2,mobile);
                            UpdateStatement.setString(3,password);
//                            System.out.println("update work"+UpdateStatement);
                            UpdateStatement.executeUpdate();
                        }
                        catch (SQLException throwables) {
                            printSQLException(throwables);
                        }
                        OfficerLoginModel officerLogindetails = new OfficerLoginModel(mobile, password,updateMAC , post);
                        officerLogindetails.setMessage("new user");
                        officerLogindetails.setFull_name(full_name);
                        officerLogindetails.setMohId(assignMOH);
                        officerLogindetails.setCity(assignCity);
                        officerLogindetails.setPost(officerpost);
                        officerLogindetails.setMAC(updateMAC);
                        officerLogindetails.setNIC(nic);
                        officerLogindetails.setPostalCode(block);
                        officerLogindetails.setCity("");
                        return officerLogindetails;
                    }
                    if (mobile.equals(officerLogin.getMobile()) && password.equals(officerLogin.getPassword()) && mac.equals(officerLogin.getMAC()) ) {
                        System.out.println("valid mach");
                        OfficerLoginModel officerLogindetails = new OfficerLoginModel(mobile, password, mac ,post  );
                        officerLogindetails.setMessage("mac is OK");
                        officerLogindetails.setFull_name(full_name);
                        officerLogindetails.setMohId(assignMOH);
                        officerLogindetails.setCity(assignCity);
                        officerLogindetails.setPost(officerpost);
                        officerLogindetails.setMAC(mac);
                        officerLogindetails.setNIC(nic);
                        officerLogindetails.setPostalCode(block);
//                        System.out.println("Mobile "+ mobile);
//                        System.out.println("password "+ password);
//                        System.out.println("mac "+ mac);
                        return officerLogindetails;
                    }
                    if (mobile.equals(officerLogin.getMobile()) && password.equals(officerLogin.getPassword()) && !mac.equals(officerLogin.getMAC())) {
                        System.out.println("mac is wrong");
                        System.out.println("officerLogin.getMAC() "+officerLogin.getMAC());
                        System.out.println("mac "+mac);
                        OfficerLoginModel officerLogindetails = new OfficerLoginModel(mobile, password, mac ,post  );
                        return officerLogindetails;
                    }
                }
//                System.out.println("Invalid Us Ps");
                return new OfficerLoginModel("","","" , post);
            } catch (SQLException throwables) {
                printSQLException(throwables);
            }
            return new OfficerLoginModel("","","" , post);
        }
        else if(post.equals("rphi")){
//            System.out.println("inside RPHI if");
            try (PreparedStatement preparedStatement = connection.prepareStatement(CHECK_pOST_WITH_VALIDATION)) {
                preparedStatement.setString(1, officerLogin.getMobile());
                preparedStatement.setString(2, officerLogin.getPassword());
                preparedStatement.setString(3, post);
                ResultSet rs = preparedStatement.executeQuery();

//                System.out.println("mobile "+officerLogin.getMobile()+"/");
//                System.out.println("pass "+officerLogin.getPassword()+"/");
//                System.out.println("mac "+officerLogin.getMAC()+"/");
//                System.out.println("officerpost "+post+"/");
//                System.out.println("rs -DAO "+rs+"/");
                while (rs.next()) {
                    String mobile = rs.getString("Mobile");
                    String password = rs.getString("Password");
                    String mac=rs.getString("MAC");
                    String officerpost=rs.getString("Post");

//                    System.out.println("mobile "+mobile+"/");
//                    System.out.println("pass "+password+"/");
//                    System.out.println("mac "+mac+"/");
//                    System.out.println("officerpost "+officerpost+"/");
//                    System.out.println("Model data");
//                    System.out.println("mobile "+officerLogin.getMobile()+"/");
//                    System.out.println("pass "+officerLogin.getPassword()+"/");
//                    System.out.println("mac "+officerLogin.getMAC()+"/");
//                    System.out.println("officerpost "+officerpost+"/");


                    if (mobile.equals(officerLogin.getMobile()) && password.equals(officerLogin.getPassword()) && ( mac==null || mac.equals("") ) && (officerpost.equals(post) || officerpost.equals("")) ) {
//                        System.out.println("null mach with correct us ps in Rphi");
                        String updateMAC=officerLogin.getMAC();
                        try (PreparedStatement UpdateStatement = connection.prepareStatement(UPDATE_MAC_IN_PHI)){
                            UpdateStatement.setString(1,updateMAC);
                            UpdateStatement.setString(2,mobile);
                            UpdateStatement.setString(3,password);
//                            System.out.println("update work"+UpdateStatement);
                            UpdateStatement.executeUpdate();
                        }
                        catch (SQLException throwables) {
                            printSQLException(throwables);
                        }
                        OfficerLoginModel officerLogindetails = new OfficerLoginModel(mobile, password,updateMAC,post);
                        return officerLogindetails;
                    }
                    if (mobile.equals(officerLogin.getMobile()) && password.equals(officerLogin.getPassword()) && mac.equals(officerLogin.getMAC())) {
//                        System.out.println("valid mach");
                        OfficerLoginModel officerLogindetails = new OfficerLoginModel(mobile, password,mac,post);
                        return officerLogindetails;
                    }
                }
                return new OfficerLoginModel("","","" ,post);
            } catch (SQLException throwables) {
                printSQLException(throwables);
            }
            return new OfficerLoginModel("","","", post);
        }
        else if(post.equals("co")){
            try (PreparedStatement preparedStatement = connection.prepareStatement(Check_Clinical_Officer)) {
                preparedStatement.setString(1, officerLogin.getMobile());
                preparedStatement.setString(2, officerLogin.getPassword());
                ResultSet rs = preparedStatement.executeQuery();
//                System.out.println(" --------------------- " + preparedStatement.toString());

                while (rs.next()) {
                    String mobile = rs.getString("mobile_number");
                    String password = rs.getString("password");
                    String mac=rs.getString("device_mac");
                    String officerpost= officerLogin.getPost();
                    String assignCity=rs.getString("city");
                    String assignMOH=rs.getString("assignMOH");
                    String full_name=rs.getString("full_name");
                    String nic=rs.getString("nic");



                    if (mobile.equals(officerLogin.getMobile()) && password.equals(officerLogin.getPassword()) &&  ( mac==null || mac.equals("") )) {
//                        System.out.println("null mach with correct us ps in co");
                        String updateMAC=officerLogin.getMAC();
                        try (PreparedStatement UpdateStatement = connection.prepareStatement(UPDATE_MAC_IN_Clinical_Officer)){
                            UpdateStatement.setString(1,updateMAC);
                            UpdateStatement.setString(2,mobile);
                            UpdateStatement.setString(3,password);
//                            System.out.println("update work"+UpdateStatement);
                            UpdateStatement.executeUpdate();
                        }
                        catch (SQLException throwables) {
                            printSQLException(throwables);
                        }
                        OfficerLoginModel officerLogindetails = new OfficerLoginModel(mobile, password,updateMAC , post);
                        officerLogindetails.setMessage("new user");
                        officerLogindetails.setFull_name(full_name);
                        officerLogindetails.setMohId(assignMOH);
                        officerLogindetails.setCity(assignCity);
                        officerLogindetails.setPost(officerpost);
                        officerLogindetails.setMAC(mac);
                        officerLogindetails.setNIC(nic);
                        return officerLogindetails;
                    }
                    if (mobile.equals(officerLogin.getMobile()) && password.equals(officerLogin.getPassword()) && mac.equals(officerLogin.getMAC())) {
//                        System.out.println("valid mach");
                        OfficerLoginModel officerLogindetails = new OfficerLoginModel(mobile, password, mac ,post  );
                        officerLogindetails.setMessage("mac is OK");
                        officerLogindetails.setFull_name(full_name);
                        officerLogindetails.setMohId(assignMOH);
                        officerLogindetails.setCity(assignCity);
                        officerLogindetails.setPost(officerpost);
                        officerLogindetails.setMAC(mac);
                        officerLogindetails.setNIC(nic);
                        return officerLogindetails;
                    }
                    if (mobile.equals(officerLogin.getMobile()) && password.equals(officerLogin.getPassword()) && !mac.equals(officerLogin.getMAC())) {
//                        System.out.println("valid mach");
                        OfficerLoginModel officerLogindetails = new OfficerLoginModel(mobile, password, mac ,post  );
                        officerLogindetails.setMessage("mac is wrong");
                        return officerLogindetails;
                    }
                }
                return new OfficerLoginModel("","","" , post);
            } catch (SQLException throwables) {
                printSQLException(throwables);
            }
            return new OfficerLoginModel("","","" , post);

        }
        else if(post.equals("admin")){
            try (PreparedStatement preparedStatement = connection.prepareStatement(Check_Admin)) {
                preparedStatement.setString(1, officerLogin.getMobile());
                preparedStatement.setString(2, officerLogin.getPassword());
                ResultSet rs = preparedStatement.executeQuery();
//                System.out.println(" --------------------- " + preparedStatement.toString());

                while (rs.next()) {
                    String user_code = rs.getString("user_code");
                    String password = rs.getString("password");
                    String mac=rs.getString("device_mac");
                    String officerpost= officerLogin.getPost();
                    String full_name=rs.getString("full_name");
                    String nic=rs.getString("nic");



                    if (user_code.equals(officerLogin.getMobile()) && password.equals(officerLogin.getPassword()) &&  ( mac==null || mac.equals("") )) {
//                        System.out.println("null mach with correct us ps in co");
                        String updateMAC=officerLogin.getMAC();
                        try (PreparedStatement UpdateStatement = connection.prepareStatement(UPDATE_MAC_IN_Clinical_Officer)){
                            UpdateStatement.setString(1,updateMAC);
                            UpdateStatement.setString(2,user_code);
                            UpdateStatement.setString(3,password);
//                            System.out.println("update work"+UpdateStatement);
                            UpdateStatement.executeUpdate();
                        }
                        catch (SQLException throwables) {
                            printSQLException(throwables);
                        }
                        OfficerLoginModel officerLogindetails = new OfficerLoginModel(user_code, password,updateMAC , post);
                        officerLogindetails.setMessage("new user");
                        officerLogindetails.setFull_name(full_name);
                        officerLogindetails.setPost(officerpost);
                        officerLogindetails.setMAC(mac);
                        officerLogindetails.setNIC(nic);
                        return officerLogindetails;
                    }
                    if (user_code.equals(officerLogin.getMobile()) && password.equals(officerLogin.getPassword()) && mac.equals(officerLogin.getMAC())) {
                        System.out.println("valid mach");
                        OfficerLoginModel officerLogindetails = new OfficerLoginModel(user_code, password, mac ,post  );
                        officerLogindetails.setMessage("mac is OK");
                        officerLogindetails.setFull_name(full_name);
                        officerLogindetails.setPost(officerpost);
                        officerLogindetails.setMAC(mac);
                        officerLogindetails.setNIC(nic);
                        return officerLogindetails;
                    }
                    if (user_code.equals(officerLogin.getMobile()) && password.equals(officerLogin.getPassword()) && !mac.equals(officerLogin.getMAC())) {
//                        System.out.println("valid mach");
                        OfficerLoginModel officerLogindetails = new OfficerLoginModel(user_code, password, mac ,post  );
                        officerLogindetails.setMessage("mac is wrong");
                        return officerLogindetails;
                    }
                }
                return new OfficerLoginModel("","","" , post);
            } catch (SQLException throwables) {
                printSQLException(throwables);
            }
            return new OfficerLoginModel("","","" , post);
        }
        else if(post.equals("COfficer")){
//            System.out.println("inside clinic if");
            try (PreparedStatement preparedStatement = connection.prepareStatement(CHECK_pOST_WITH_VALIDATION)) {
                preparedStatement.setString(1, officerLogin.getMobile());
                preparedStatement.setString(2, officerLogin.getPassword());
                preparedStatement.setString(3, post);
                ResultSet rs = preparedStatement.executeQuery();

//                System.out.println("mobile "+officerLogin.getMobile()+"/");
//                System.out.println("pass "+officerLogin.getPassword()+"/");
//                System.out.println("mac "+officerLogin.getMAC()+"/");
//                System.out.println("officerpost "+post+"/");
//                System.out.println("rs -DAO "+rs+"/");
                while (rs.next()) {
                    String mobile = rs.getString("Mobile");
                    String password = rs.getString("Password");
                    String mac=rs.getString("MAC");
                    String officerpost=rs.getString("Post");

//                    System.out.println("mobile "+mobile+"/");
//                    System.out.println("pass "+password+"/");
//                    System.out.println("mac "+mac+"/");
//                    System.out.println("officerpost "+officerpost+"/");
//                    System.out.println("Model data");
//                    System.out.println("mobile "+officerLogin.getMobile()+"/");
//                    System.out.println("pass "+officerLogin.getPassword()+"/");
//                    System.out.println("mac "+officerLogin.getMAC()+"/");
//                    System.out.println("officerpost "+officerpost+"/");


                    if (mobile.equals(officerLogin.getMobile()) && password.equals(officerLogin.getPassword()) && ( mac==null || mac.equals("") ) && (officerpost.equals(post) || officerpost.equals("")) ) {
//                        System.out.println("null mach with correct us ps in Rphi");
                        String updateMAC=officerLogin.getMAC();
                        try (PreparedStatement UpdateStatement = connection.prepareStatement(UPDATE_MAC_IN_PHI)){
                            UpdateStatement.setString(1,updateMAC);
                            UpdateStatement.setString(2,mobile);
                            UpdateStatement.setString(3,password);
                            System.out.println("update work"+UpdateStatement);
                            UpdateStatement.executeUpdate();
                        }
                        catch (SQLException throwables) {
                            printSQLException(throwables);
                        }
                        OfficerLoginModel officerLogindetails = new OfficerLoginModel(mobile, password,updateMAC,post);
                        return officerLogindetails;
                    }
                    if (mobile.equals(officerLogin.getMobile()) && password.equals(officerLogin.getPassword()) && mac.equals(officerLogin.getMAC())) {
//                        System.out.println("valid mach");
                        OfficerLoginModel officerLogindetails = new OfficerLoginModel(mobile, password,mac,post);
                        return officerLogindetails;
                    }
                }
                return new OfficerLoginModel("","","",post);
            } catch (SQLException throwables) {
                printSQLException(throwables);
            }
            return new OfficerLoginModel("","","",post);
        }
        else{
//            System.out.println("inside else");
            return new OfficerLoginModel("","","",post);
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
