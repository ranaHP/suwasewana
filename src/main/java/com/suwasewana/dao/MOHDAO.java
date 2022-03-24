package com.suwasewana.dao;


import com.suwasewana.core.DB;
import com.suwasewana.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MOHDAO {
    @SuppressWarnings("SqlResolve")

    private static final String MOH_Detail="SELECT * FROM suwasewana_db.moh;";
    private static final String MOH_Details="SELECT * FROM suwasewana_db.moh;";
    private static final String District_Detail="SELECT * FROM suwasewana_db.district;";
    private static final String City_Detail="SELECT * FROM suwasewana_db.cities;";
    Connection connection;

    public MOHDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }

    public ArrayList<MOHModel> GetMOHDetails() {
        try (PreparedStatement preparedStatement = connection.prepareStatement(MOH_Details)) {
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<MOHModel> mohList = new ArrayList<MOHModel>();
            while (rs.next()) {
                String id = rs.getString("moh_id");
                String name = rs.getString("name");
                MOHModel temp = new MOHModel(
                        id,
                        name,
                        "",
                        ""


                );
//
                mohList.add(temp);
            }
            return mohList;

        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }
    public ArrayList<DistrictModel> GetDistrictDetails() {
        try (PreparedStatement preparedStatement = connection.prepareStatement(District_Detail)) {
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<DistrictModel> DitrictList = new ArrayList<DistrictModel>();
            while (rs.next()) {
                String id = rs.getString("district_id");
                String name = rs.getString("name");
                DistrictModel temp = new DistrictModel(
                        "",
                        name,
                        id
                );
//
                DitrictList.add(temp);
            }
            return DitrictList;

        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }
    public ArrayList<CityModel> GetCityDetails() {
        try (PreparedStatement preparedStatement = connection.prepareStatement(City_Detail)) {
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<CityModel> DitrictList = new ArrayList<CityModel>();
            while (rs.next()) {
                String did = rs.getString("district_id");
                String cid = rs.getString("city_id");
                String name = rs.getString("name");
                CityModel temp = new CityModel(
                        did,
                        name,
                        cid
                );
//
                DitrictList.add(temp);
            }
            return DitrictList;

        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }


    public ArrayList<MOHRegModel> GetallMOHDetails() {

        try (PreparedStatement preparedStatement = connection.prepareStatement(MOH_Detail)) {

            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<MOHRegModel> mohList = new ArrayList<MOHRegModel>();
            while (rs.next()) {

                String name = rs.getString("MName");
                String District = rs.getString("District");
                String Head = rs.getString("MHead");
                String Mobile = rs.getString("TpNo");

                MOHRegModel temp = new MOHRegModel(
                        name,
                        Mobile,
                        Head,
                        "",
                        "",
                        District,
                        "",
                        "",
                        ""
                );
                System.out.println("Moh district "+ temp.getDistrict());
                mohList.add(temp);
            }
            return mohList;

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
