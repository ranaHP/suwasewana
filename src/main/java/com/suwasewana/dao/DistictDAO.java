package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.CreateClinicModel;
import com.suwasewana.model.DistrictModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class DistictDAO {
    private static final String SELECT_dISTRICTS="SELECT * FROM `district` WHERE `province_id`=?;";
    Connection connection;

    public DistictDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }

    public ArrayList<DistrictModel> selectDistricts(DistrictModel districts) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_dISTRICTS)){
            System.out.println("jjj");
            preparedStatement.setString(1, districts.getProvince_id());
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<DistrictModel> selectDistrictList = new ArrayList<DistrictModel>();
            while (rs.next()){
                    String district_id=rs.getString("district_id");
                    String name= rs.getString("name");
                    String 	province_id= rs.getString("province_id");
                DistrictModel temp = new DistrictModel(
                        district_id,
                        name,
                        province_id
                );
                selectDistrictList.add(temp);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return selectDistrictList;
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
}
