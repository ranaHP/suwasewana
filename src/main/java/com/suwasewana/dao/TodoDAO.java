package com.suwasewana.dao;


import com.suwasewana.core.DB;
import com.suwasewana.model.MOHModel;
import com.suwasewana.model.TaskModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

public class TodoDAO {
    @SuppressWarnings("SqlResolve")

    private static final String TakeTasklist="SELECT * FROM suwasewana_db.task_list tl LEFT JOIN suwasewana_db.task_assign TAL ON tl.task_id = TAL.Asgtask_id LEFT JOIN suwasewana_db.phi p ON p.nic = tl.phi_id WHERE tl.phi_id=? ;";
    private static final String DeleteTask="DELETE FROM `suwasewana_db`.`task_list` WHERE (`task_id` = ?);";
    private static final String CompleteTask="UPDATE `suwasewana_db`.`task_list` SET `status` = 'complete' WHERE (`task_id` = ?);";
    private static final String ProgressTask="UPDATE `suwasewana_db`.`task_list` SET `status` = 'inprogess' WHERE (`task_id` = ?);";
    private static final String PendingTask="UPDATE `suwasewana_db`.`task_list` SET `status` = 'pending' WHERE (`task_id` = ?);";
    private static final String Select_Task_of_phi="SELECT * FROM suwasewana_db.task_list WHERE phi_id=?;";
    private static final String ValidateOverdue="UPDATE `suwasewana_db`.`task_list` SET `status` = 'overdue' WHERE (`task_id` = ?);";
    private static final String Update_Task="UPDATE `suwasewana_db`.`task_list` SET `title` = ?, `expire_date` = ? WHERE (`task_id` = ?);";
    private static final String Add_Task="INSERT INTO `suwasewana_db`.`task_list` (`title`, `status`, `expire_date`, `phi_id`) VALUES (?, 'pending', ?, ?);";
    Connection connection;

    public TodoDAO() {
        DB db = new DB();
        connection = db.getConnection();
    }

    public String DeletTask( String id) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(DeleteTask)) {
            preparedStatement.setString(1, id);
            int  rs = preparedStatement.executeUpdate();
            return "success";

        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }
    public String SetComplete( String id) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(CompleteTask)) {

            preparedStatement.setString(1, id);
            int  rs = preparedStatement.executeUpdate();
            return "success";

        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }

    public String AddTask( String id,String task,String date) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(Add_Task)) {
            preparedStatement.setString(1, task);
            preparedStatement.setString(2, date);
            preparedStatement.setString(3, id);
            int  rs = preparedStatement.executeUpdate();
            return "success";

        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }

    public String EditTask( String id,String task,String date) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(Update_Task)) {
            preparedStatement.setString(1, task);
            preparedStatement.setString(2, date);
            preparedStatement.setString(3, id);
            int  rs = preparedStatement.executeUpdate();
            return "success";

        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
    }
    public String UpdateOverdueTaskList( String nic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(Select_Task_of_phi)) {
            preparedStatement.setString(1, nic);
            ResultSet rs = preparedStatement.executeQuery();

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            String today=dtf.format(now);



            SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");

            Date d1 = sdformat.parse(today);






            while (rs.next()) {


                String Taskid=rs.getString("task_id");
                String expire_date=rs.getString("expire_date");
                String status=rs.getString("status");

                String date2=expire_date;
                Date d2 = sdformat.parse(date2);

//                System.out.println("The date 1 is: " + sdformat.format(d1));
//                System.out.println("The date 2 is: " + sdformat.format(d2));

                if(status.equals("pending")){

                    if(d1.compareTo(d2) > 0) {
                        System.out.println("Task id "+Taskid+ " Overdue");
                        try (PreparedStatement preparedStatementforupdate = connection.prepareStatement(ValidateOverdue)){
                            preparedStatementforupdate.setString(1, Taskid);
                            int response = preparedStatementforupdate.executeUpdate();
                        }
                        catch (SQLException throwables) {
                            printSQLException(throwables);
                        }
                    }
                }





            }


            return "success";

        } catch (SQLException | ParseException throwables) {
            printSQLException((SQLException) throwables);
        }

        return null;
    }
    public String SetProgress( String id) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(ProgressTask)) {
            preparedStatement.setString(1, id);
            int  rs = preparedStatement.executeUpdate();
            return "success";

        } catch (SQLException throwables) {
            printSQLException(throwables);
        }

        return null;
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
                String assignTaskid=rs.getString("Asgtask_id");

                if(RPHIMessage==null){
                    RPHIMessage=" ";
                }

                if(assignTaskid==null){
                    assignTaskid="PHI";
                }
                else{
                    assignTaskid="RPHI";
                }

                TaskModel temp = new TaskModel(
                         Taskid,
                         title,
                         RPHIMessage,
                         phiid,
                         phiname,
                         posted_date,
                         expire_date,
                         status,
                        assignTaskid
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
