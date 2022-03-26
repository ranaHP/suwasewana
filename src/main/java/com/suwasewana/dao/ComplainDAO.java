package com.suwasewana.dao;


import com.suwasewana.core.DB;
import com.suwasewana.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ComplainDAO {
    @SuppressWarnings("SqlResolve")
    private static final String INSERT_COMPLAIN = "INSERT INTO `suwaserwana_db`.`complain` (`idcomplain`, `Title`, `ComplainType`, `UserDetailType`, `AreaPHI`, `Des`, `Img1`, `Img2`, `Img3`) VALUES (null , ?, ?, ?, ?, ?,? , ?, ?);";
    private static final String COMPLAIN_TYPE = "SELECT * FROM suwasewana_db.complaint_type;";
    private static final String Complain_For_PHI = "SELECT * FROM suwasewana_db.user_complaint uc LEFT JOIN suwasewana_db.user u ON u.uNic = uc.user LEFT JOIN suwasewana_db.complaint_type ct ON uc.complaint_type_id = ct.complaint_type_id WHERE phi_id=? AND status != 'Done';";
    private static final String Complain_For_PHI_sideBar = "SELECT * FROM suwasewana_db.user_complaint uc LEFT JOIN suwasewana_db.user u ON u.uNic = uc.user LEFT JOIN suwasewana_db.complaint_type ct ON uc.complaint_type_id = ct.complaint_type_id WHERE (phi_id=?) AND (posted_date_time BETWEEN ? AND ?);";
    private static final String Complain_For_PHI_title_type = "SELECT * FROM suwasewana_db.user_complaint uc LEFT JOIN suwasewana_db.user u ON u.uNic = uc.user LEFT JOIN suwasewana_db.complaint_type ct ON uc.complaint_type_id = ct.complaint_type_id WHERE phi_id=? and uc.complaint_type_id=? and uc.tittle like ? ;";
    private static final String Complain_For_PHI_title = "SELECT * FROM suwasewana_db.user_complaint uc LEFT JOIN suwasewana_db.user u ON u.uNic = uc.user LEFT JOIN suwasewana_db.complaint_type ct ON uc.complaint_type_id = ct.complaint_type_id WHERE phi_id=? and tittle LIKE ?;";
    private static final String Complain_For_PHI_type = "SELECT * FROM suwasewana_db.user_complaint uc LEFT JOIN suwasewana_db.user u ON u.uNic = uc.user LEFT JOIN suwasewana_db.complaint_type ct ON uc.complaint_type_id = ct.complaint_type_id WHERE phi_id=? and uc.complaint_type_id=? ;";
    private static final String Change_Status = "UPDATE `suwasewana_db`.`user_complaint` SET `status` = 'Done' WHERE (`comp_id` = ?);";
    private static final String Change_Status_to_progress = "UPDATE `suwasewana_db`.`user_complaint` SET `status` = 'In Progress' WHERE (`comp_id` = ?);";
    private static final String Change_Complain_Response = "UPDATE `suwasewana_db`.`user_complaint` SET `phi_message` = ? WHERE (`comp_id` = ?);\n";
    private static final String Complain_For_MOH = "SELECT * FROM suwasewana_db.user_complaint uc LEFT JOIN suwasewana_db.user u ON u.uNic = uc.user LEFT JOIN suwasewana_db.complaint_type ct ON uc.complaint_type_id = ct.complaint_type_id WHERE moh=?;";
    private static final String Complain_types = "SELECT * FROM suwasewana_db.user_complaint uc LEFT JOIN suwasewana_db.user u ON u.uNic = uc.user LEFT JOIN suwasewana_db.complaint_type ct ON uc.complaint_type_id = ct.complaint_type_id WHERE moh=?;";


    Connection connection;

    public ComplainDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }

    public ArrayList<CommanForCompalinAndUser> SearchComplainDetailsPHI(String title, String type, String nic) {
        try {
            PreparedStatement preparedStatement;
            PreparedStatement preparedStatementboth;
            PreparedStatement preparedStatementtitle;
            PreparedStatement preparedStatementtype;
            ResultSet rs = null;
            if (type == null && title == "") {
                preparedStatement = connection.prepareStatement(Complain_For_PHI);

                preparedStatement.setString(1, nic);
                System.out.println("both null : " + preparedStatement);
                rs = preparedStatement.executeQuery();
            }
            if (type != null && title != "") {
                System.out.println("both have");
                preparedStatementboth = connection.prepareStatement(Complain_For_PHI_title_type);
                preparedStatementboth.setString(2, type);
                preparedStatementboth.setString(3, "%" + title + "%");
                preparedStatementboth.setString(1, nic);
                System.out.println("SQL - " + preparedStatementboth);
                rs = preparedStatementboth.executeQuery();
            }
            if (type == null && title != "") {
                System.out.println("only title");
                preparedStatementtitle = connection.prepareStatement(Complain_For_PHI_title);
                preparedStatementtitle.setString(2, "%" + title + "%");
                preparedStatementtitle.setString(1, nic);
                System.out.println("SQL - " + preparedStatementtitle);
                rs = preparedStatementtitle.executeQuery();
            }
            if (type != null && title == "") {
                System.out.println("only type");
                preparedStatementtype = connection.prepareStatement(Complain_For_PHI_type);
                preparedStatementtype.setString(2, type);
                preparedStatementtype.setString(1, nic);
                System.out.println("SQL - " + preparedStatementtype);
                rs = preparedStatementtype.executeQuery();
            }


            ArrayList<ComplainModel> ComplainList = new ArrayList<ComplainModel>();
            System.out.println("come to view detail");
            ArrayList<CommanForCompalinAndUser> complainListForPHI = new ArrayList<CommanForCompalinAndUser>();
            while (rs.next()) {


                String comp_id = rs.getString("comp_id");
                String CType = rs.getString("complaint_type_id");
                String User = rs.getString("user");
                String Posted_Date = rs.getString("posted_date_time");
                String CTitle = rs.getString("tittle");
                String CMessage = rs.getString("description");
                String PHIId = rs.getString("phi_id");
                String Status = rs.getString("status");
                String img1 = rs.getString("img1");
                String img2 = rs.getString("img2");
                String img3 = rs.getString("img3");
                String PHIResponse = rs.getString("phi_message");

                String uname = rs.getString("uname");
                String uNic = rs.getString("uNic");
                String uMobile = rs.getString("uMobile");
                String address_line1 = rs.getString("address_line1");
                String street_nou = rs.getString("street_no");
                String City = rs.getString("uCity");

                String ComplainType = rs.getString("ctittle");

                ComplainModel complaintemp = new ComplainModel(
                        CTitle,
                        CType,
                        comp_id,
                        PHIId,
                        CMessage,
                        "",
                        User,
                        Posted_Date,
                        Status,
                        img1,
                        img2,
                        img3,
                        PHIResponse,
                        ""

                );

                User usertemp = new User(
                        uMobile,
                        uname,
                        "",
                        uNic,
                        "",
                        "",
                        City,
                        "",
                        "",
                        "",
                        "",
                        street_nou,
                        address_line1,
                        ""
                );

                CommanForCompalinAndUser commanForCompalinAndUsertemp = new CommanForCompalinAndUser(complaintemp, usertemp, ComplainType);

//
                complainListForPHI.add(commanForCompalinAndUsertemp);
            }
            return complainListForPHI;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }
        return null;
    }

    public String setResponse(String complainId, String message) {
        System.out.println("data come to create complain dao");
        try (PreparedStatement preparedStatement = connection.prepareStatement(Change_Complain_Response)) {
            preparedStatement.setString(2, complainId);
            preparedStatement.setString(1, message);
            System.out.println("SQL " + preparedStatement);
            int rs = preparedStatement.executeUpdate();
            return "success";
        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }


    }


    public String ChangeStatus(String complainId) {
        System.out.println("data come to create complain dao");
        try (PreparedStatement preparedStatement = connection.prepareStatement(Change_Status)) {
            preparedStatement.setString(1, complainId);
            System.out.println("SQL " + preparedStatement);
            int rs = preparedStatement.executeUpdate();
            return "success";
        } catch (SQLException throwables) {
            printSQLException(throwables);
            ;
            return throwables.getMessage();
        }


    }

    public String ChangeStatustpProgress(String complainId) {
        System.out.println("data come to create complain dao");
        try (PreparedStatement preparedStatement = connection.prepareStatement(Change_Status_to_progress)) {
            preparedStatement.setString(1, complainId);
            System.out.println("SQL " + preparedStatement);
            int rs = preparedStatement.executeUpdate();
            return "success";
        } catch (SQLException throwables) {
            printSQLException(throwables);
            ;
            return throwables.getMessage();
        }


    }


    public ArrayList<CommanForCompalinAndUser> SearchComplainBydate(String date1, String date2, String nic) {
//        try {
//            PreparedStatement preparedStatement;
//            PreparedStatement preparedStatementboth ;
//            PreparedStatement preparedStatementtitle;
//            PreparedStatement preparedStatementtype ;
//            ResultSet rs = null;
//            if(date1=="" && date2==""){
//                preparedStatement = connection.prepareStatement(Complain_For_PHI);
//
//                preparedStatement.setString(1, nic);
//                System.out.println("both null : "+ preparedStatement);
//                rs = preparedStatement.executeQuery();
//            }
//            if(date1!="" && date2==""){
//                System.out.println("date 2 null");
//                preparedStatementboth = connection.prepareStatement(Complain_For_PHI_title_type);
//                preparedStatementboth.setString(2, type);
//                preparedStatementboth.setString(3,"%"+ title + "%");
//                preparedStatementboth.setString(1, nic);
//                System.out.println("SQL - "+preparedStatementboth);
//                rs = preparedStatementboth.executeQuery();
//            }
//            if(date1=="" && date2!=""){
//                System.out.println("date 1 null");
//                preparedStatementtitle = connection.prepareStatement(Complain_For_PHI_title);
//                preparedStatementtitle.setString(2, "%"+title+"%");
//                preparedStatementtitle.setString(1, nic);
//                System.out.println("SQL - "+preparedStatementtitle);
//                rs = preparedStatementtitle.executeQuery();
//            }
//            if(date1!="" && date2!=""){
//                System.out.println("both dates");
//                preparedStatementtype = connection.prepareStatement(Complain_For_PHI_type);
//                preparedStatementtype.setString(2, type);
//                preparedStatementtype.setString(1, nic);
//                rs = preparedStatementtype.executeQuery();
//            }
//
//
//            ArrayList<ComplainModel> ComplainList = new ArrayList<ComplainModel>();
//            ArrayList<CommanForCompalinAndUser> complainListForPHI = new ArrayList<CommanForCompalinAndUser>();
//            while (rs.next()) {
//
//
//                String comp_id=rs.getString("comp_id");
//                String CType=rs.getString("complaint_type_id");
//                String User=rs.getString("user");
//                String Posted_Date=rs.getString("posted_date_time");
//                String CTitle=rs.getString("tittle");
//                String CMessage=rs.getString("description");
//                String PHIId=rs.getString("phi_id");
//                String Status=rs.getString("status");
//                String img1=rs.getString("img1");
//                String img2=rs.getString("img2");
//                String img3=rs.getString("img3");
//                String PHIResponse=rs.getString("phi_message");
//
//                String uname=rs.getString("uname");
//                String uNic=rs.getString("uNic");
//                String uMobile=rs.getString("uMobile");
//                String address_line1=rs.getString("address_line1");
//                String street_nou=rs.getString("street_no");
//                String City=rs.getString("uCity");
//
//                String ComplainType=rs.getString("ctittle");
//
//                ComplainModel complaintemp = new ComplainModel(
//                        CTitle,
//                        CType,
//                        comp_id,
//                        PHIId,
//                        CMessage,
//                        "",
//                        User,
//                        Posted_Date,
//                        Status,
//                        img1,
//                        img2,
//                        img3,
//                        PHIResponse,
//                        ""
//
//                );
//
//                User usertemp = new User(
//                        uMobile,
//                        uname,
//                        "",
//                        uNic,
//                        "",
//                        "",
//                        City,
//                        "",
//                        "",
//                        "",
//                        "",
//                        street_nou,
//                        address_line1,
//                        ""
//                );
//
//                CommanForCompalinAndUser commanForCompalinAndUsertemp=new CommanForCompalinAndUser(complaintemp,usertemp,ComplainType);
//
////
//                complainListForPHI.add(commanForCompalinAndUsertemp);
//            }
//            return complainListForPHI;
//        } catch (SQLException throwables) {
//            printSQLException(throwables);
//        }
        return null;
    }

    public ArrayList<CommanForCompalinAndUser> userGetComplainDetailsForPHI(String nic, String d1, String d2) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(Complain_For_PHI)) {
            preparedStatement.setString(1, nic);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println("preparedStatement "+preparedStatement);
            ArrayList<CommanForCompalinAndUser> complainListForPHI = new ArrayList<CommanForCompalinAndUser>();
            while (rs.next()) {
                String comp_id = rs.getString("comp_id");
                String CType = rs.getString("complaint_type_id");
                String User = rs.getString("user");
                String Posted_Date = rs.getString("posted_date_time");
                String CTitle = rs.getString("tittle");
                String CMessage = rs.getString("description");
                String PHIId = rs.getString("phi_id");
                String Status = rs.getString("status");
                String img1 = rs.getString("img1");
                String img2 = rs.getString("img2");
                String img3 = rs.getString("img3");
                String PHIResponse = rs.getString("phi_message");
                String uname = rs.getString("uname");
                String uNic = rs.getString("uNic");
                System.out.println("user nic : " + uNic);
                String uMobile = rs.getString("uMobile");
                String address_line1 = rs.getString("address_line1");
                String street_nou = rs.getString("street_no");
                String City = rs.getString("uCity");

                String ComplainType = rs.getString("ctittle");

                ComplainModel complaintemp = new ComplainModel(
                        CTitle,
                        CType,
                        comp_id,
                        PHIId,
                        CMessage,
                        "",
                        User,
                        Posted_Date,
                        Status,
                        img1,
                        img2,
                        img3,
                        PHIResponse,
                        ""

                );

                User usertemp = new User(
                        uMobile,
                        uname,
                        "",
                        uNic,
                        "",
                        "",
                        City,
                        "",
                        "",
                        "",
                        "",
                        street_nou,
                        address_line1,
                        ""
                );

                CommanForCompalinAndUser commanForCompalinAndUsertemp = new CommanForCompalinAndUser(complaintemp, usertemp, ComplainType);

//
                complainListForPHI.add(commanForCompalinAndUsertemp);
            }
            return complainListForPHI;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }

    public ArrayList<CommanForCompalinAndUser> userGetComplainDetailsForPHIForSideBar(String nic, String d1, String d2) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(Complain_For_PHI_sideBar)) {
            preparedStatement.setString(1, nic);
            preparedStatement.setString(2, d1);
            preparedStatement.setString(3, d2);

            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(" Qry for Complain " + preparedStatement);
            ArrayList<CommanForCompalinAndUser> complainListForPHI = new ArrayList<CommanForCompalinAndUser>();
            while (rs.next()) {
                String comp_id = rs.getString("comp_id");
                String CType = rs.getString("complaint_type_id");
                String User = rs.getString("user");
                String Posted_Date = rs.getString("posted_date_time");
                String CTitle = rs.getString("tittle");
                String CMessage = rs.getString("description");
                String PHIId = rs.getString("phi_id");
                String Status = rs.getString("status");
                String img1 = rs.getString("img1");
                String img2 = rs.getString("img2");
                String img3 = rs.getString("img3");
                String PHIResponse = rs.getString("phi_message");
                String uname = rs.getString("uname");
                String uNic = rs.getString("uNic");
//                System.out.println("user nic : "+uNic);
                String uMobile = rs.getString("uMobile");
                String address_line1 = rs.getString("address_line1");
                String street_nou = rs.getString("street_no");
                String City = rs.getString("uCity");

                String ComplainType = rs.getString("ctittle");

                ComplainModel complaintemp = new ComplainModel(
                        CTitle,
                        CType,
                        comp_id,
                        PHIId,
                        CMessage,
                        "",
                        User,
                        Posted_Date,
                        Status,
                        img1,
                        img2,
                        img3,
                        PHIResponse,
                        ""

                );

                User usertemp = new User(
                        uMobile,
                        uname,
                        "",
                        uNic,
                        "",
                        "",
                        City,
                        "",
                        "",
                        "",
                        "",
                        street_nou,
                        address_line1,
                        ""
                );

                CommanForCompalinAndUser commanForCompalinAndUsertemp = new CommanForCompalinAndUser(complaintemp, usertemp, ComplainType);

//
                complainListForPHI.add(commanForCompalinAndUsertemp);
            }
            return complainListForPHI;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }

    public ArrayList<CommanForCompalinAndUser> userGetComplainDetailsForMOH(String moh) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(Complain_For_MOH)) {
            preparedStatement.setString(1, moh);
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<CommanForCompalinAndUser> complainListForPHI = new ArrayList<CommanForCompalinAndUser>();
            while (rs.next()) {
                String comp_id = rs.getString("comp_id");
                String CType = rs.getString("complaint_type_id");
                String User = rs.getString("user");
                String Posted_Date = rs.getString("posted_date_time");
                String CTitle = rs.getString("tittle");
                String CMessage = rs.getString("description");
                String PHIId = rs.getString("phi_id");
                String Status = rs.getString("status");
                String img1 = rs.getString("img1");
                String img2 = rs.getString("img2");
                String img3 = rs.getString("img3");
                String PHIResponse = rs.getString("phi_message");

                String uname = rs.getString("uname");
                String uNic = rs.getString("uNic");
                String uMobile = rs.getString("uMobile");
                String address_line1 = rs.getString("address_line1");
                String street_nou = rs.getString("street_no");
                String City = rs.getString("uCity");

                String ComplainType = rs.getString("ctittle");

                ComplainModel complaintemp = new ComplainModel(
                        CTitle,
                        CType,
                        comp_id,
                        PHIId,
                        CMessage,
                        "",
                        User,
                        Posted_Date,
                        Status,
                        img1,
                        img2,
                        img3,
                        PHIResponse,
                        ""

                );

                User usertemp = new User(
                        uMobile,
                        uname,
                        "",
                        uNic,
                        "",
                        "",
                        City,
                        "",
                        "",
                        "",
                        "",
                        street_nou,
                        address_line1,
                        ""
                );

                CommanForCompalinAndUser commanForCompalinAndUsertemp = new CommanForCompalinAndUser(complaintemp, usertemp, ComplainType);

//
                complainListForPHI.add(commanForCompalinAndUsertemp);
            }
            return complainListForPHI;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }

    public ArrayList<ComplainTypeModel> GetComplainTypeDetails() {
        try (PreparedStatement preparedStatement = connection.prepareStatement(COMPLAIN_TYPE)) {
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<ComplainTypeModel> complainList = new ArrayList<ComplainTypeModel>();
            while (rs.next()) {
                String id = rs.getString("complaint_type_id");
                String Type = rs.getString("ctittle");
                ComplainTypeModel temp = new ComplainTypeModel(
                        id,
                        Type
                );
//
                complainList.add(temp);
            }
            return complainList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }


    public String AddComplain(ComplainModel cm) {

        try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_COMPLAIN)) {
//            preparedStatement.setString(1, cm.getTitle() );
            preparedStatement.setString(2, cm.getCType());
            preparedStatement.setString(3, cm.getUType());
//            preparedStatement.setString(4, cm.getPhi() );
//            preparedStatement.setString(5, cm.getReason() );
            preparedStatement.setString(6, "");
            preparedStatement.setString(7, "");
            preparedStatement.setString(8, "");
            int rs = preparedStatement.executeUpdate();

            return "success";
        } catch (SQLException throwables) {
            printSQLException(throwables);
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
