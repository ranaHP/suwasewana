package com.suwasewana.dao;


import com.suwasewana.core.DB;
import com.suwasewana.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PHIDAO {
    @SuppressWarnings("SqlResolve")
    private static final String SELECT_phi="SELECT * FROM suwaserwana_db.phi_officer;";
    private static final String PHI_VIEW_APPOINMENT = "SELECT * FROM `appointment`";

    Connection connection;
    public PHIDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }


    public ArrayList<PHIModel> GetPHIDetails() {
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_phi)) {
            System.out.println("awoooooooo");
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<PHIModel>phiList = new ArrayList<PHIModel>();
            while (rs.next()) {
                String name = rs.getString("full_name");
                String id = rs.getString("mohId");
                PHIModel temp = new PHIModel(
                        id,
                        name,
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        ""
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

    public ArrayList<AppointmentModel> phiViewAppointmentDetails(AppointmentModel viewAppoinment) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(PHI_VIEW_APPOINMENT)){
            System.out.println("awoooooooo");

            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<AppointmentModel> viewAppoinmentlist = new ArrayList<AppointmentModel>();
            while (rs.next()){
                String aTitle = rs.getString("aTitle");
                String AType = rs.getString("appointmentType");
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
                System.out.println(aTitle + "-" + AType);

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
                viewAppoinmentlist.add(temp);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return viewAppoinmentlist;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }


    private static void printSQLException(SQLException ex) {
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
