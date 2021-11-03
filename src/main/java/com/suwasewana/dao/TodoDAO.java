package com.suwasewana.dao;


import com.suwasewana.core.DB;
import com.suwasewana.model.MOHModel;
import com.suwasewana.model.TaskModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TodoDAO {
    @SuppressWarnings("SqlResolve")

    private static final String TakeTasklist="SELECT * FROM suwasewana_db.task_list tl LEFT JOIN suwasewana_db.task_assign TAL ON tl.task_id = TAL.task_id LEFT JOIN suwasewana_db.phi p ON p.nic = tl.phi_id WHERE tl.phi_id=? ;";
    Connection connection;

    public TodoDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }

    public ArrayList<TaskModel> GetAllTask( String nic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(TakeTasklist)) {
            preparedStatement.setString(1, nic);
            ResultSet rs = preparedStatement.executeQuery();
            ArrayList<TaskModel> todoList = new ArrayList<TaskModel>();
            while (rs.next()) {
                String Taskid=rs.getString("task_id");
                String title=rs.getString("title");
                String RPHIMessage=rs.getString("message");
                String phiid=rs.getString("phi_id");
                String phiname=rs.getString("full_name");
                String posted_date=rs.getString("posted_date");
                String expire_date=rs.getString("expire_date");
                String status=rs.getString("status");



                TaskModel temp = new TaskModel(
                         Taskid,
                         title,
                         RPHIMessage,
                         phiid,
                         phiname,
                         posted_date,
                         expire_date,
                         status
                );
//
                todoList.add(temp);
            }
            return todoList;

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
