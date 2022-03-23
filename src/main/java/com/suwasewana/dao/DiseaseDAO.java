package com.suwasewana.dao;


import com.suwasewana.core.DB;
import com.suwasewana.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static java.lang.Integer.parseInt;

public class DiseaseDAO {
    @SuppressWarnings("SqlResolve")
    private static final String SelectMaxDiseaseCount="SELECT  count(u.UNic),name,uMoh FROM suwasewana_db.user_register_disease urd left join suwasewana_db.user u on urd.UNic= u.uNic where (u.uMoh=?) AND (date BETWEEN ? AND ?)   group by name ";
    private static final String SelectDiseaseCountforArray="SELECT  count(u.UNic),name,date FROM suwasewana_db.user_register_disease urd left join suwasewana_db.user u on urd.UNic= u.uNic where (u.uMoh=?) AND (urd.name=?) AND (date BETWEEN ? AND ?) ";

    Connection connection;

    public DiseaseDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }


    public DiseaseReportModel Getmaxdiseasecount(DiseaseReportModel DRM) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(SelectMaxDiseaseCount)) {

            preparedStatement.setString(1, DRM.getMohid());
            preparedStatement.setString(2, DRM.getDate1());
            preparedStatement.setString(3, DRM.getDate2());
            System.out.println("Getmaxdiseasecount qry "+preparedStatement);
            System.out.println("date 1"+DRM.getCount2().split("/")[0]);
            System.out.println("date 2"+DRM.getCount3().split("/")[1]);
            String [] FirstDayArray={
                    DRM.getCount1().split("/")[0],
                    DRM.getCount2().split("/")[0],
                    DRM.getCount3().split("/")[0],
                    DRM.getCount4().split("/")[0],
                    DRM.getCount5().split("/")[0],
                    DRM.getCount6().split("/")[0],

            };
//            System.out.println("FirstDayArray");
//            for (String element: FirstDayArray) {
//                System.out.println(element);
//            }
            String [] LastDayArray={
                    DRM.getCount1().split("/")[1],
                    DRM.getCount2().split("/")[1],
                    DRM.getCount3().split("/")[1],
                    DRM.getCount4().split("/")[1],
                    DRM.getCount5().split("/")[1],
                    DRM.getCount6().split("/")[1],

            };
//            System.out.println("LastDayArray");
//            for (String element: LastDayArray) {
//                System.out.println(element);
//            }


            ResultSet rs = preparedStatement.executeQuery();
//            ArrayList<DiseaseReportModel> diseaseReportModels = new ArrayList<DiseaseReportModel>();
            Integer max=0;
            String name="";
            while (rs.next()) {
                String DCount=(rs.getString("count(u.UNic)"));
                Integer DC=parseInt(DCount);
                if (DC>max){
                    max=DC;
                    name=(rs.getString("name"));
                }
            }
//            System.out.println("Name "+name);
//            System.out.println("max "+max);
            int[] MonthCount = {0, 0, 0, 0, 0,0};
            for(int i=0;i<=5;i++){
                try (PreparedStatement preparedStatementforCount = connection.prepareStatement(SelectDiseaseCountforArray)){
                    preparedStatementforCount.setString(1, DRM.getMohid());
                    preparedStatementforCount.setString(2, name);
                    preparedStatementforCount.setString(3, FirstDayArray[i]);
                    preparedStatementforCount.setString(4, LastDayArray[i]);
                    ResultSet rs2 = preparedStatementforCount.executeQuery();
//                    System.out.println("SQL for day complair "+preparedStatementforCount);
                    Integer count=0;
                    while (rs2.next()) {
                        count = Integer.parseInt((rs2.getString("count(u.UNic)")));
                    }
//                    System.out.println(i+"->"+count);
                    MonthCount[i]=count;
                }
                catch (SQLException throwables) {
                    printSQLException(throwables);
                }
            }
//            System.out.println("Final array");
            Integer tot=0;
            for (int element: MonthCount) {
                tot+=element;
            }
            String t=String.valueOf(tot);
            DiseaseReportModel diseaseReportModels=new DiseaseReportModel(
                    name,
                    String.valueOf(MonthCount[0]),
                    String.valueOf(MonthCount[1]),
                    String.valueOf(MonthCount[2]),
                    String.valueOf(MonthCount[3]),
                    String.valueOf(MonthCount[4]),
                    String.valueOf(MonthCount[5]),
                    "",
                    "",
                    t

            );

            return diseaseReportModels;
        } catch (SQLException throwables) {
            printSQLException(throwables);
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
