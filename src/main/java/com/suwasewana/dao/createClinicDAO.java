package com.suwasewana.dao;

import com.suwasewana.core.DB;
import com.suwasewana.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.text.ParseException;
import java.util.ArrayList;

public class createClinicDAO {
  private  static final String CREATE_CLINIC ="INSERT INTO `normal_clinic_session`  VALUES (NULL ,?,?,?,?,?,?,?,?,?,?,?,?);";
  private static final String VIEW_CLINICS = "SELECT * FROM `normal_clinic_session` WHERE `normal_clinic_session`.`clinical_officer` = ?";
  private static final String SELECT_CLINICS = "SELECT * FROM `normal_clinic_session` WHERE `normal_clinic_session`.`ncs_id` = ?";
  private static final String DELETE_CLINICS ="DELETE FROM `normal_clinic_session` WHERE `normal_clinic_session`.`ncs_id` = ?;";
  private static final String UPDATE_CLINICS =  "UPDATE `normal_clinic_session` SET `title` = ?, `date` = ? , `duration` = ?,  `disease` = ?, `description` = ?,  `max_sheet` = ?,  `conduct_by` = ?, `target_people` = ?, `location` = ? WHERE `normal_clinic_session`.`ncs_id` = ?;";
  private static final String disease_clinic_count="SELECT COUNT(ncs_id), disease FROM `normal_clinic_session` WHERE `normal_clinic_session`.`clinical_officer` = ? GROUP BY disease ";
  private static final String SELECT_events="SELECT * FROM `normal_clinic_session` WHERE `normal_clinic_session`.`date` = ?";

  private static final String CREATE_VACCINE_CLINIC ="INSERT INTO `vaccine_clinic_session` VALUES (NULL,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
  private static final String VIEW_VACCINE_CLINICS ="SELECT * FROM `vaccine_clinic_session` WHERE `vaccine_clinic_session`.`clinical_officer` = ?";
  private static final String SELECT_VACCINE_CLINICS="SELECT * FROM `vaccine_clinic_session` WHERE `vaccine_clinic_session`.`vcs_id` = ?";
  private static final String DELETE_VCLINICS ="DELETE FROM `vaccine_clinic_session` WHERE `vaccine_clinic_session`.`vcs_id` = ?;";
  private static final String UPDATE_VCLINICS ="UPDATE `vaccine_clinic_session` SET `tittle` = ? , `start_date_time` = ? , `duration` = ? , `description` = ? , `max_patient` = ? ,`target_people` = ? , `target_age_limit` = ? ,`v_id` = ? ,`location`= ? , `dose_count`= ? WHERE `vaccine_clinic_session`.`vcs_id` = ?;";
  private static final String ClinicCount="SELECT COUNT(ncs_id), date FROM `normal_clinic_session` GROUP BY `date`;";
  Connection connection;
    public createClinicDAO(){
        DB db = new DB();
        connection = db.getConnection();
    }
    public String createClinic(CreateClinicModel createClinic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(CREATE_CLINIC)) {
//            preparedStatement.setString(1,"");
            preparedStatement.setString(1,createClinic.getTitle());
            preparedStatement.setString(2,createClinic.getDate());
            preparedStatement.setString(3,createClinic.getTime());
            preparedStatement.setString(4,createClinic.getDuration());
            preparedStatement.setString(5,createClinic.getDisease());
            preparedStatement.setString(6,createClinic.getDescription());
            preparedStatement.setString(7,createClinic.getMaxpatient());
            preparedStatement.setString(8,createClinic.getConduct());
            preparedStatement.setString(9,createClinic.getMOH());
            preparedStatement.setString(10,createClinic.getTarget());
            preparedStatement.setString(11,createClinic.getLocation());
            preparedStatement.setString(12,"12");

            int rs = preparedStatement.executeUpdate();
            return "sucsess";

        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }

    }


    public String updateClinic(CreateClinicModel updateClinic) {
        boolean rowUpdate;
        try (PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CLINICS)) {
            System.out.println("came to update");
//            preparedStatement.setString(1,"");
            preparedStatement.setString(1,updateClinic.getTitle());
            preparedStatement.setString(2,updateClinic.getDate());
            preparedStatement.setString(3,updateClinic.getTime());
            preparedStatement.setString(4,updateClinic.getDuration());
            preparedStatement.setString(5,updateClinic.getDisease());
            preparedStatement.setString(6,updateClinic.getDescription());
            preparedStatement.setString(7,updateClinic.getMaxpatient());
            preparedStatement.setString(8,updateClinic.getConduct());
//            preparedStatement.setString(8,updateClinic.getMOH());
            preparedStatement.setString(9,updateClinic.getTarget());
            preparedStatement.setString(10,updateClinic.getLocation());
            preparedStatement.setString(11,updateClinic.getClinicID());

            rowUpdate = preparedStatement.executeUpdate() > 0;
            System.out.println(rowUpdate);
            return "success";


        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }

    }
    public ArrayList<CreateClinicModel> ViewClinics(CreateClinicModel viewClinic) throws ParseException {
        try (PreparedStatement preparedStatement = connection.prepareStatement(VIEW_CLINICS)){
            System.out.println("came to dao");
            preparedStatement.setString(1, viewClinic.getcNic());
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<CreateClinicModel> viewClinicList = new ArrayList<CreateClinicModel>();
            while (rs.next()){
                String clinicID =rs.getString("ncs_id");
                String title =rs.getString("title");
                String date = rs.getString("date");
                String time=rs.getString("time");
                String duration = rs.getString("duration");
                String disease = rs.getString("disease");
                String description = rs.getString("description");
                String max_sheet = rs.getString("max_sheet");
                String conduct_by = rs.getString("conduct_by");
                String target_moh=rs.getString("target_moh");
                String target_people = rs.getString("target_people");
                String location = rs.getString("location");
                String cNic = rs.getString("clinical_officer");
                CreateClinicModel temp = new CreateClinicModel(
                        clinicID,
                        title,
                        date,
                        time,
                        duration,
                        disease,
                        description,
                        max_sheet,
                        conduct_by,
                        target_moh,
                        target_people,
                        location,
                        cNic
                );
//                }
                 viewClinicList.add(temp);
//                System.out.println(title+"--"+disease+"--"+Location);
        };
        return viewClinicList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
}

    public ArrayList<CreateClinicModel> selectClinics(CreateClinicModel viewClinic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CLINICS)){
            System.out.println("jjj");
            preparedStatement.setString(1, viewClinic.getClinicID());
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<CreateClinicModel> selectClinicList = new ArrayList<CreateClinicModel>();
            while (rs.next()){
                String clinicID =rs.getString("ncs_id");
                String title =rs.getString("title");
                String date = rs.getString("date");
                String time = rs.getString("time");
                String duration = rs.getString("duration");
                String disease = rs.getString("disease");
                String description = rs.getString("description");
                String max_sheet = rs.getString("max_sheet");
                String conduct_by = rs.getString("conduct_by");
                String target_moh=rs.getString("target_moh");
                String target_people = rs.getString("target_people");
                String location = rs.getString("location");
                String cNic = rs.getString("clinical_officer");
                CreateClinicModel temp = new CreateClinicModel(
                        clinicID,
                        title,
                        date,
                        time,
                        duration,
                        disease,
                        description,
                        max_sheet,
                        conduct_by,
                        target_moh,
                        target_people,
                        location,
                        cNic


                );
                selectClinicList.add(temp);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return selectClinicList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }

    public String deleteClinic(CreateClinicModel deleteClinic) {
        boolean rowDeleted;
        try (PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CLINICS)) {
                 preparedStatement.setString(1,deleteClinic.getClinicID());
                rowDeleted = preparedStatement.executeUpdate() > 0;
                return "success";
        } catch (SQLException throwables) {
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


    public String vaccineClinic(vaccineClinicModel vaccineclinic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(CREATE_VACCINE_CLINIC)) {
            preparedStatement.setString(1,vaccineclinic.getTittle());
            preparedStatement.setString(2,vaccineclinic.getStart_date_time());
            preparedStatement.setString(3,vaccineclinic.getDuration());
            preparedStatement.setString(4,vaccineclinic.getDescription());
            preparedStatement.setString(5,vaccineclinic.getMax_patient());
            preparedStatement.setString(6,vaccineclinic.getTarget_moh());
            preparedStatement.setString(7,vaccineclinic.getTarget_people());
            preparedStatement.setString(8,vaccineclinic.getTarget_age_limit());
            preparedStatement.setString(9,"12");
            preparedStatement.setString(10,vaccineclinic.getV_id());
            preparedStatement.setString(11,vaccineclinic.getLocation());
            preparedStatement.setString(12,vaccineclinic.getDose_count());

            int rs = preparedStatement.executeUpdate();
            return "sucsess";

        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }

    }

    public ArrayList<vaccineClinicModel> ViewVaccineClinics(vaccineClinicModel vaccineClinicView) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(VIEW_VACCINE_CLINICS)){
            System.out.println("came to dao");
            preparedStatement.setString(1, vaccineClinicView.getClinical_officer());
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<vaccineClinicModel> viewClinicList = new ArrayList<vaccineClinicModel>();
            while (rs.next()){
                String vcs_id =rs.getString("vcs_id");
                String title =rs.getString("tittle");
                String DataTime = rs.getString("start_date_time");
                String Duration = rs.getString("duration");
                String Description = rs.getString("description");
                String MaxPatient = rs.getString("max_patient");
                String TargetMOH = rs.getString("target_moh");
                String Target = rs.getString("target_people");
                String age_limit=rs.getString("target_age_limit");
                String clinical_officer = rs.getString("clinical_officer");
                String v_id = rs.getString("v_id");
                String location = rs.getString("location");
                String dose_count = rs.getString("dose_count");
                vaccineClinicModel temp = new vaccineClinicModel(
                        vcs_id,
                        title,
                        DataTime,
                        Duration,
                        Description,
                        MaxPatient,
                        TargetMOH,
                        Target,
                        age_limit,
                        clinical_officer,
                        v_id,
                        location,
                        dose_count
                );
                viewClinicList.add(temp);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return viewClinicList;
//            System.out.println(viewClinicList);
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }

    public ArrayList<vaccineClinicModel> selectVClinics(vaccineClinicModel selectVclinics) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VACCINE_CLINICS)){
            System.out.println("jjj");
            preparedStatement.setString(1, selectVclinics.getVcs_id());
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<vaccineClinicModel> selectVaClinicList = new ArrayList<vaccineClinicModel>();
            while (rs.next()){
                String vcs_id =rs.getString("vcs_id");
                String title =rs.getString("tittle");
                String DataTime = rs.getString("start_date_time");
                String Duration = rs.getString("duration");
                String Description = rs.getString("description");
                String MaxPatient = rs.getString("max_patient");
                String TargetMOH = rs.getString("target_moh");
                String Target = rs.getString("target_people");
                String age_limit=rs.getString("target_age_limit");
                String clinical_officer = rs.getString("clinical_officer");
                String v_id = rs.getString("v_id");
                String location = rs.getString("location");
                String dose_count = rs.getString("dose_count");
                vaccineClinicModel temp = new vaccineClinicModel(
                        vcs_id,
                        title,
                        DataTime,
                        Duration,
                        Description,
                        MaxPatient,
                        TargetMOH,
                        Target,
                        age_limit,
                        clinical_officer,
                        v_id,
                        location,
                        dose_count
                );
                selectVaClinicList.add(temp);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return selectVaClinicList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;

    }

    public String deleteVClinic(vaccineClinicModel deleteVClinic) {
        boolean rowDeleted;
        try (PreparedStatement preparedStatement = connection.prepareStatement(DELETE_VCLINICS)) {
            preparedStatement.setString(1,deleteVClinic.getVcs_id());
            rowDeleted = preparedStatement.executeUpdate() > 0;
            System.out.println(rowDeleted);
            return "success";
        } catch (SQLException throwables) {
            return throwables.getMessage();
        }
    }


    public String updatevClinic(vaccineClinicModel Updatevclinic) {
        boolean rowUpdate;
        try (PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_VCLINICS)) {
            System.out.println("came to update");
//            preparedStatement.setString(1,"");
            preparedStatement.setString(1,Updatevclinic.getTittle());
            preparedStatement.setString(2,Updatevclinic.getStart_date_time());
            preparedStatement.setString(3,Updatevclinic.getDuration());
            preparedStatement.setString(4,Updatevclinic.getDescription());
            preparedStatement.setString(5,Updatevclinic.getMax_patient());
//            preparedStatement.setString(6,Updatevclinic.getTarget_moh());
            preparedStatement.setString(6,Updatevclinic.getTarget_people());
            preparedStatement.setString(7,Updatevclinic.getTarget_age_limit());
            preparedStatement.setString(8,Updatevclinic.getV_id());
            preparedStatement.setString(9,Updatevclinic.getLocation());
            preparedStatement.setString(10,Updatevclinic.getDose_count());
            preparedStatement.setString(11,Updatevclinic.getVcs_id());

            rowUpdate = preparedStatement.executeUpdate() > 0;
            System.out.println(rowUpdate);
            return "success";


        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }
    }

    public ArrayList<CreateClinicModel> Viewdisease(CreateClinicModel viewdisease) throws ParseException {
        try (PreparedStatement preparedStatement = connection.prepareStatement(disease_clinic_count)){
            System.out.println("came to dao");
            preparedStatement.setString(1,viewdisease.getcNic());
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<CreateClinicModel> viewdList = new ArrayList<CreateClinicModel>();
            while (rs.next()){
                String clinicID =rs.getString("COUNT(ncs_id)");
                String disease = rs.getString("disease");
                CreateClinicModel temp = new CreateClinicModel(
                        clinicID,
                        "",
                        "",
                        "",
                        disease,
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        ""

                );
//                }
                viewdList.add(temp);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return viewdList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }

    public ArrayList<ClinicCalenderEventModel> chooseClinic(String date) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(ClinicCount)){
            System.out.println("came to dao");
            preparedStatement.setString(1,date);
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<ClinicCalenderEventModel> viewList = new ArrayList<ClinicCalenderEventModel>();
            while (rs.next()){
                String title = rs.getString("title");
                String Location = rs.getString("location");
                CreateClinicModel temp = new CreateClinicModel(
                        "",
                        title,
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        Location,
                        "",
                        ""

                );
                String vtitle= rs.getString("tittle");
                String vlocation= rs.getString("location");
                vaccineClinicModel temp1 = new vaccineClinicModel(
                        "",
                        vtitle,
                        "",
                        "",
                        "",
                        "",
                        "",
                         "",
                        "",
                        "",
                        "",
                        vlocation,
                        ""
                );
//                }
                ClinicCalenderEventModel tempc=new ClinicCalenderEventModel(temp,temp1,date);
                viewList.add(tempc);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return viewList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }

    public ArrayList<CreateClinicModel> ViewCount(CreateClinicModel viewC) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(ClinicCount)){
            System.out.println("came to dao");
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<CreateClinicModel> viewList = new ArrayList<>();
            while (rs.next()){
                String count = rs.getString("COUNT(ncs_id)");
                String date = rs.getString("date");
                CreateClinicModel temp = new CreateClinicModel(
                        count,
                        "",
                        date,
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
//                }
                viewList.add(temp);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return viewList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }

    public ArrayList<CreateClinicModel> Viewevents(CreateClinicModel cEvents) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_events)){
            System.out.println("jjj");
            preparedStatement.setString(1, cEvents.getDate());
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(rs.toString());
            ArrayList<CreateClinicModel> EventList = new ArrayList<CreateClinicModel>();
            while (rs.next()){
                String title = rs.getString("title");
                String Location = rs.getString("Location");
                CreateClinicModel temp = new CreateClinicModel(
                       "",
                        title,
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        Location,
                        "",
                        ""


                );
                EventList.add(temp);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return EventList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }
}



