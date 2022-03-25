package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.MOHModel;
import com.suwasewana.model.ProvinceModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProvinceDAO {
   private static final String VIEWPROVINCE = "SELECT * FROM `province`;";
   private static final String PROVINCEID="SELECT * FROM  `province` WHERE `name`=?;";
    Connection connection;

    public ProvinceDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }
    public ArrayList<ProvinceModel> getProvinceList() {
        try (PreparedStatement preparedStatement = connection.prepareStatement(VIEWPROVINCE )) {
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<ProvinceModel> ProviceList = new ArrayList<ProvinceModel>();
            while (rs.next()) {
                String province_id = rs.getString("province_id");
                String name = rs.getString("name");

                ProvinceModel temp = new ProvinceModel(
                        province_id,
                        name
                );
//
                ProviceList.add(temp);
            }
            return ProviceList;

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

    public ArrayList<ProvinceModel> ProvinceNames(ProvinceModel provinceS) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(PROVINCEID)) {
            preparedStatement.setString(1, provinceS.getName());
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<ProvinceModel> ProviceS = new ArrayList<ProvinceModel>();
            while (rs.next()) {
                String province_id = rs.getString("province_id");
                ProvinceModel temp = new ProvinceModel(
                        province_id,
                        ""
                );
//
                ProviceS.add(temp);
            }
            return ProviceS;

        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }
}
