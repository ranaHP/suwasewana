package com.suwasewana.dao;


import com.suwasewana.core.DB;
import com.suwasewana.model.ComplainModel;
import com.suwasewana.model.ComplainTypeModel;
import com.suwasewana.model.CreateClinicModel;
import com.suwasewana.model.PHIModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Locale;

public class PHIDAO {
    @SuppressWarnings("SqlResolve")
    private static final String SELECT_phi="SELECT * FROM phi;";
    private static final String SELECT_phi1="SELECT * FROM phi;";
    private static final String SELECT_phi2="SELECT * FROM phi;";
    private static final String GET_ALL_PHI = "SELECT * FROM (SELECT * FROM `phi` LEFT JOIN (SELECT city_id , cname , dc_id , dname , pro_id , name as pname FROM (SELECT city_id , cname ,dc_id , name AS dname , province_id AS pro_id FROM (SELECT `city_id` , `name` AS cname , `district_id` AS dc_id FROM `cities`) AS new_city LEFT JOIN `district` ON `district`.`district_id` = `new_city`.`dc_id`) AS cdtable LEFT JOIN `province` ON `province`.`province_id` = cdtable.pro_id) AS cdpTable ON cdpTable.city_id = `phi`.`city`) AS pcdp LEFT JOIN `moh` ON `moh`.`moh_id` = pcdp.assignMOH";

    private static final String renewPHI="UPDATE `phi` SET `device_mac` = '' WHERE `phi`.`nic` = ?;";
    private static final String SELECT_phi_with_city="SELECT full_name,nic,mobile_number,name,assignMOH FROM suwasewana_db.phi p LEFT JOIN suwasewana_db.cities c ON p.assignCity = c.city_id;";
    private static final String blockPHI="UPDATE `phi` SET `block` = '1' WHERE `phi`.`nic` = ?;";
    private static final String removePHI="DELETE FROM `phi` WHERE `phi`.`nic` = ?;";

    Connection connection;

    public PHIDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }

    public ArrayList<PHIModel> GetPHIDetails() {
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_phi_with_city)) {
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<PHIModel>phiList = new ArrayList<PHIModel>();
            while (rs.next()) {
                String name = rs.getString("full_name");
                String id = rs.getString("assignMOH");
                String nic=rs.getString("nic");
                String mobile=rs.getString("mobile_number");
                String assigncity=rs.getString("name");
                PHIModel temp = new PHIModel(
                        id,
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        mobile,
                        nic,
                        name,
                        "",
                        "",
                        "",
                        "",
                        "",
                        assigncity
                );
//
                phiList.add(temp);
            }
            return phiList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }

    public ArrayList<PHIModel> getAllPhiData() {
        try (PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_PHI)) {
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(rs);
            ArrayList<PHIModel>phiList = new ArrayList<PHIModel>();
            while (rs.next()) {
                PHIModel temp = new PHIModel(
                        rs.getString("assignMOH"),
                        rs.getString("zip_code"),
                        rs.getString("password"),
                        rs.getString("login_status"),
                        rs.getString("phi_post"),

                        rs.getString("login_status"),
                        rs.getString("district"),
                        rs.getString("city"),

                        rs.getString("zip_code"),
                        rs.getString("name"),
                        rs.getString("mobile_number"),
                        rs.getString("nic"),
                        rs.getString("full_name"),
                        "",
                        "",
                        "",
                        "",
                        "",
                        ""
                );

                phiList.add(temp);
            }
            return phiList;
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


    public ArrayList<PHIModel> getphiALL() {
        try (PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_PHI)) {
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(rs);
            ArrayList<PHIModel>phiALLList = new ArrayList<PHIModel>();
            while (rs.next()) {
                PHIModel temp = new PHIModel(
                       "",
                        "",
                        "",
                        "",
                        rs.getString("phi_post"),
                        rs.getString("pname"),
                        rs.getString("dname"),
                        rs.getString("name"),
                        "",
                        "",
                        rs.getString("mobile_number"),
                        rs.getString("nic"),
                        rs.getString("full_name"),
                        "",
                        "",
                        "",
                        "",
                        "",
                        rs.getString("cname")
                );

                phiALLList.add(temp);
            }
            return phiALLList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }

    public String blockphi(PHIModel block) {
        boolean rowUpdate;
        try (PreparedStatement preparedStatement = connection.prepareStatement(blockPHI)) {
            System.out.println("came to update");
//            preparedStatement.setString(1,"");
            preparedStatement.setString(1,block.getNIC());

            rowUpdate = preparedStatement.executeUpdate() > 0;
            System.out.println(rowUpdate);
            return "success";


        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }
    }

    public String renewphi(PHIModel renew) {
        boolean rowUpdate;
        try (PreparedStatement preparedStatement = connection.prepareStatement(renewPHI)) {
            System.out.println("came to update");
//            preparedStatement.setString(1,"");
            preparedStatement.setString(1,renew.getNIC());

            rowUpdate = preparedStatement.executeUpdate() > 0;
            System.out.println(rowUpdate);
            return "success";


        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }
    }

    public String removephi(PHIModel removeP) {
        boolean rowUpdate;
        try (PreparedStatement preparedStatement = connection.prepareStatement(removePHI)) {
            System.out.println("came to update");
//            preparedStatement.setString(1,"");
            preparedStatement.setString(1,removeP.getNIC());

            rowUpdate = preparedStatement.executeUpdate() > 0;
            System.out.println(rowUpdate);
            return "success";


        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }
    }
}
