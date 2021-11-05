package com.suwasewana.dao;


import com.suwasewana.core.DB;
import com.suwasewana.model.ComplainModel;
import com.suwasewana.model.ComplainTypeModel;
import com.suwasewana.model.PHIModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PHIDAO {
    @SuppressWarnings("SqlResolve")
    private static final String SELECT_phi="SELECT * FROM phi;";
    private static final String GET_ALL_PHI = "SELECT * FROM (SELECT * FROM `phi` LEFT JOIN (SELECT city_id , cname , dc_id , dname , pro_id , name as pname FROM (SELECT city_id , cname ,dc_id , name AS dname , province_id AS pro_id FROM (SELECT `city_id` , `name` AS cname , `district_id` AS dc_id FROM `cities`) AS new_city LEFT JOIN `district` ON `district`.`district_id` = `new_city`.`dc_id`) AS cdtable LEFT JOIN `province` ON `province`.`province_id` = cdtable.pro_id) AS cdpTable ON cdpTable.city_id = `phi`.`city`) AS pcdp LEFT JOIN `moh` ON `moh`.`moh_id` = pcdp.assignMOH";

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
                        rs.getString("full_name"),
                        rs.getString("nic"),
                        rs.getString("mobile_number"),
                        "",
                        rs.getString("cname"),
                        rs.getString("dname"),
                        rs.getString("pname"),
                        rs.getString("zip_code"),
                        rs.getString("name"),
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





}
