package com.suwasewana.dao;


import com.suwasewana.core.DB;
import com.suwasewana.model.AppointmentModel;
import com.suwasewana.model.ComplainModel;
import com.suwasewana.model.ComplainTypeModel;
import com.suwasewana.model.UserRegistrationModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ComplainDAO {
    @SuppressWarnings("SqlResolve")
    private static final String INSERT_COMPLAIN="INSERT INTO `suwaserwana_db`.`complain` (`idcomplain`, `Title`, `ComplainType`, `UserDetailType`, `AreaPHI`, `Des`, `Img1`, `Img2`, `Img3`) VALUES (null , ?, ?, ?, ?, ?,? , ?, ?);";
    private static final String COMPLAIN_TYPE="SELECT * FROM suwasewana_db.complaint_type;";
    Connection connection;

    public ComplainDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }

    public ArrayList<ComplainTypeModel> GetComplainTypeDetails() {
        try (PreparedStatement preparedStatement = connection.prepareStatement(COMPLAIN_TYPE)) {
            System.out.println("awoooooooo");
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<ComplainTypeModel> complainList = new ArrayList<ComplainTypeModel>();
            while (rs.next()) {
                String id = rs.getString("complaint_type_id");
                String Type = rs.getString("tittle");
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
            preparedStatement.setString(2, cm.getCType() );
            preparedStatement.setString(3, cm.getUType() );
//            preparedStatement.setString(4, cm.getPhi() );
//            preparedStatement.setString(5, cm.getReason() );
            preparedStatement.setString(6, "");
            preparedStatement.setString(7,  "");
            preparedStatement.setString(8, "");
            int  rs = preparedStatement.executeUpdate();

            return  "success";
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
