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
  private  static final String CREATE_CLINIC ="INSERT INTO `normal_clinic_session`  VALUES (NULL ,?,?,?,?,?,?,?,?,?,?,?,?,?);";
  private static final String VIEW_CLINICS = "SELECT * FROM `normal_clinic_session` WHERE `normal_clinic_session`.`clinical_officer` = ?";
  private static final String SELECT_CLINICS = "SELECT * FROM `normal_clinic_session` cs left join moh m on cs.target_moh=m.moh_id WHERE cs.ncs_id = ? AND cs.clinical_officer = ?";
  private static final String DELETE_CLINICS ="DELETE FROM `normal_clinic_session` WHERE `normal_clinic_session`.`ncs_id` = ?;";
  private static final String UPDATE_CLINICS =  "UPDATE `normal_clinic_session` SET `title` = ?, `description` = ?,  `max_sheet` = ?,`target_people` = ? WHERE `normal_clinic_session`.`ncs_id` = ?;";
  private static final String RESHEDULE_CLINICS="UPDATE `normal_clinic_session` SET `date` = ? , `time` = ? , `duration` = ?  WHERE `normal_clinic_session`.`ncs_id` = ?;";
  private static final String disease_clinic_count="SELECT COUNT(ncs_id), disease FROM `normal_clinic_session` WHERE `normal_clinic_session`.`clinical_officer` = ? GROUP BY disease ";
    private static final String disease_clinic_count_fromDate="SELECT COUNT(ncs_id), disease FROM `normal_clinic_session` WHERE (date BETWEEN ? AND ? ) AND `normal_clinic_session`.`clinical_officer` = ? GROUP BY disease";
  private static final String SELECT_events="SELECT * FROM `normal_clinic_session` WHERE `normal_clinic_session`.`date` = ?";
  private static final String NormalC_registeredNList="SELECT * FROM `clinic_registered_patient` vc  left join `user` v on v.uNic=vc.u_nic WHERE vc.ncs_id=?  ";

  private static final String CREATE_VACCINE_CLINIC ="INSERT INTO `vaccine_clinic_session` VALUES (NULL,?, ?, ?, ? , ?, ?, ?, ?, ?, ?, ?, ?,?,1,1);";
  private static final String VIEW_VACCINE_CLINICS ="SELECT * FROM suwasewana_db.vaccine_clinic_session vc  left join suwasewana_db.vaccine v on v.v_id=vc.v_id where vc.clinical_officer=?; ";
  private static final String SELECT_VACCINE_CLINICS="SELECT * FROM suwasewana_db.vaccine_clinic_session vc  left join suwasewana_db.vaccine v on v.v_id=vc.v_id where vc.vcs_id=?;";
  private static final String DELETE_VCLINICS ="DELETE FROM `vaccine_clinic_session` WHERE `vaccine_clinic_session`.`vcs_id` = ?;";
  private static final String UPDATE_VCLINICS ="UPDATE `vaccine_clinic_session` SET `tittle` = ? , `limit_sheats` = ? ,`max_patient` = ?, `dose_count`= ? WHERE `vaccine_clinic_session`.`vcs_id` = ?;";
  private static final String RESHEDULE_VCLINICS="UPDATE `vaccine_clinic_session` SET `start_date_time` = ? WHERE `vaccine_clinic_session`.`vcs_id` = ?;";
  private static final String ClinicCount="SELECT COUNT(ncs_id), date FROM `normal_clinic_session` GROUP BY `date`;";
  private static final String UpdateAvailSheats="UPDATE `normal_clinic_session` SET `Avail_seats` = ?  WHERE `normal_clinic_session`.`ncs_id` = ?;";
  private static final String vaccinecount="SELECT COUNT(vcs_id),name FROM suwasewana_db.vaccine_clinic_session vc  left join suwasewana_db.vaccine v on v.v_id=vc.v_id where vc.clinical_officer=? GROUP BY `name` ;";
  private static final String VClinicRegiserCount="SELECT * FROM `user_vaccine` vc  left join `user` v on v.uNic=vc.nic WHERE vc.clinic_id =?";

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
            preparedStatement.setString(8,createClinic.getMaxpatient());
            preparedStatement.setString(9,createClinic.getConduct());
            preparedStatement.setString(10,createClinic.getMOH());
            preparedStatement.setString(11,createClinic.getTarget());
            preparedStatement.setString(12,createClinic.getLocation());
            preparedStatement.setString(13,createClinic.getcNic());

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
//            preparedStatement.setString(2,updateClinic.getDate());
//            preparedStatement.setString(3,updateClinic.getTime());
//            preparedStatement.setString(4,updateClinic.getDuration());
//            preparedStatement.setString(5,updateClinic.getDisease());
            preparedStatement.setString(2,updateClinic.getDescription());
            preparedStatement.setString(3,updateClinic.getMaxpatient());
//            preparedStatement.setString(8,updateClinic.getConduct());
//            preparedStatement.setString(8,updateClinic.getMOH());
            preparedStatement.setString(4,updateClinic.getTarget());
//            preparedStatement.setString(10,updateClinic.getLocation());
            preparedStatement.setString(5,updateClinic.getClinicID());

            rowUpdate = preparedStatement.executeUpdate() > 0;
            System.out.println(rowUpdate);
            return "success";


        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }

    }

    public String updateAvailSheats(CreateClinicModel updatesheats) {
        boolean rowUpdate;
        try (PreparedStatement preparedStatement = connection.prepareStatement(UpdateAvailSheats)) {
            System.out.println("came to update");
//            preparedStatement.setString(1,"");
            preparedStatement.setString(1,updatesheats.getAvail_seats());
            preparedStatement.setString(2,updatesheats.getClinicID());

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
                String 	Avail_seats = rs.getString("Avail_seats");
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
                        Avail_seats,
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

    public ArrayList<CreateClinicModel> selectClinics(CreateClinicModel selectClinic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CLINICS)){
            System.out.println("select clinics");
            preparedStatement.setString(1, selectClinic.getClinicID());
            preparedStatement.setString(2, selectClinic.getcNic());
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(rs.toString());
            ArrayList<CreateClinicModel> selectClinicList = new ArrayList<CreateClinicModel>();
            System.out.println(rs);
            while (rs.next()){
                String clinicID =rs.getString("ncs_id");
                System.out.println(clinicID);
                String title =rs.getString("title");
                String date = rs.getString("date");
                String time = rs.getString("time");
                String duration = rs.getString("duration");
                String disease = rs.getString("disease");
                String description = rs.getString("description");
                String max_sheet = rs.getString("max_sheet");
                String Avail_seats=rs.getString("Avail_seats");
                String conduct_by = rs.getString("conduct_by");
                String target_moh=rs.getString("name");
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
                        Avail_seats,
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


    public String vaccineClinic(vaccineClinicModel vaccineclinic, String timeN) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(CREATE_VACCINE_CLINIC)) {
            preparedStatement.setString(1,vaccineclinic.getTittle());
            preparedStatement.setString(2,vaccineclinic.getDuration());
            preparedStatement.setString(3,vaccineclinic.getLimit_sheats());
            preparedStatement.setString(4,vaccineclinic.getLimit_sheats());
            preparedStatement.setString(5,vaccineclinic.getTarget_moh());
            preparedStatement.setString(6,vaccineclinic.getLower_Age());
            preparedStatement.setString(7,vaccineclinic.getUpper_Age());
            preparedStatement.setString(8,vaccineclinic.getClinical_officer());
            preparedStatement.setString(9,vaccineclinic.getV_id());
            preparedStatement.setString(10,vaccineclinic.getLocation());
            preparedStatement.setString(11,vaccineclinic.getDose_count());
            preparedStatement.setString(12,vaccineclinic.getStart_date_time());
            preparedStatement.setString(13,timeN);


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
                String MaxPatient = rs.getString("max_patient");
                String limit_sheats = rs.getString("limit_sheats");
                String TargetMOH = rs.getString("target_moh");
                String Lage_limit=rs.getString("lower_age_limit");
                String Uage_limit=rs.getString("upper_age_limit");
                String clinical_officer = rs.getString("clinical_officer");
                String vname = rs.getString("name");
                String location = rs.getString("location");
                String dose_count = rs.getString("dose_count");
                vaccineClinicModel temp = new vaccineClinicModel(
                        vcs_id,
                        title,
                        DataTime,
                        Duration,
                        MaxPatient,
                        limit_sheats,
                        TargetMOH,
                        Lage_limit,
                        Uage_limit,
                        clinical_officer,
                        "",
                        vname,
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
                String max_patients=rs.getString("max_patient");
                String limit_sheats = rs.getString("limit_sheats");
                String TargetMOH = rs.getString("target_moh");
                String Lage_limit=rs.getString("lower_age_limit");
                String Uage_limit=rs.getString("upper_age_limit");
                String clinical_officer = rs.getString("clinical_officer");
                String vname = rs.getString("name");
                String location = rs.getString("location");
                String dose_count = rs.getString("dose_count");
                vaccineClinicModel temp = new vaccineClinicModel(
                        vcs_id,
                        title,
                        DataTime,
                        Duration,
                        max_patients,
                        limit_sheats,
                        TargetMOH,
                        Lage_limit,
                        Uage_limit,
                        clinical_officer,
                        "",
                        vname,
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
//            preparedStatement.setString(2,Updatevclinic.getDuration());
            preparedStatement.setString(2,Updatevclinic.getLimit_sheats());
            preparedStatement.setString(3,Updatevclinic.getMax_patient());
//            preparedStatement.setString(4,Updatevclinic.getLower_Age());
//            preparedStatement.setString(5,Updatevclinic.getUpper_Age());
//            preparedStatement.setString(5,Updatevclinic.getV_id());
//            preparedStatement.setString(6,Updatevclinic.getLocation());
            preparedStatement.setString(4,Updatevclinic.getDose_count());
//            preparedStatement.setString(8,Updatevclinic.getStart_date_time());
//            preparedStatement.setString(6,Updatevclinic.getTarget_moh());
            preparedStatement.setString(5,Updatevclinic.getVcs_id());

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
                        "",
                        "",
                        Location,
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
                        "",
                        "",
                        Location,
                        ""


                );
                EventList.add(temp);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
//            System.out.println(EventList);
            return EventList;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }

    public ArrayList<CreateClinicModel> selectFormsgsend(CreateClinicModel selectFormsg) {

        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CLINICS)){
            System.out.println("select for msg");
            preparedStatement.setString(1, selectFormsg.getClinicID());
            preparedStatement.setString(2, selectFormsg.getcNic());
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(rs.toString());
            ArrayList<CreateClinicModel> selectFormsgs = new ArrayList<CreateClinicModel>();
            System.out.println(rs);
            while (rs.next()){
                String clinicID =rs.getString("ncs_id");
                System.out.println(clinicID);
                String title =rs.getString("title");
                String date = rs.getString("date");
                String time = rs.getString("time");
                String duration = rs.getString("duration");
                String disease = rs.getString("disease");
                String description = rs.getString("description");
                String max_sheet = rs.getString("max_sheet");
                String Avail_seats=rs.getString("Avail_seats");
                String conduct_by = rs.getString("conduct_by");
                String target_moh=rs.getString("name");
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
                        Avail_seats,
                        conduct_by,
                        target_moh,
                        target_people,
                        location,
                        cNic


                );
                selectFormsgs.add(temp);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return selectFormsgs;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }

    public String resheduleclinic(CreateClinicModel resheduleclinic) {
        boolean rowUpdate;
        try (PreparedStatement preparedStatement = connection.prepareStatement(RESHEDULE_CLINICS)) {
            System.out.println("came to update");
//            preparedStatement.setString(1,"");

            preparedStatement.setString(1,resheduleclinic.getDate());
            preparedStatement.setString(2,resheduleclinic.getTime());
            preparedStatement.setString(3,resheduleclinic.getDuration());
            preparedStatement.setString(4,resheduleclinic.getClinicID());

            rowUpdate = preparedStatement.executeUpdate() > 0;
            System.out.println(rowUpdate);
            return "success";


        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }
    }

    public String ResheduleVClinics(vaccineClinicModel resheduleVClinics) {
        boolean rowUpdate;
        try (PreparedStatement preparedStatement = connection.prepareStatement(RESHEDULE_VCLINICS)) {
            System.out.println("came to update");
//            preparedStatement.setString(1,"");
            preparedStatement.setString(2,resheduleVClinics.getVcs_id());
            preparedStatement.setString(1,resheduleVClinics.getStart_date_time());

            rowUpdate = preparedStatement.executeUpdate() > 0;
            System.out.println(rowUpdate);
            return "success";


        } catch (SQLException throwables) {
            printSQLException(throwables);
            return throwables.getMessage();
        }
    }

    public ArrayList<CreateClinicModel> numberslist(CreateClinicModel numberslist) {

        try (PreparedStatement preparedStatement = connection.prepareStatement(NormalC_registeredNList)){
            System.out.println("select for msg");
            preparedStatement.setString(1, numberslist.getClinicID());
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(rs.toString());
            ArrayList<CreateClinicModel> numberlist = new ArrayList<CreateClinicModel>();
            System.out.println(rs);
            while (rs.next()){
                String clinicID =rs.getString("ncs_id");
                String numbers = rs.getString("uMobile");
                CreateClinicModel temp = new CreateClinicModel(
                        clinicID,
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        numbers,
                        "",
                        "",
                        "",
                        "",
                        "",
                        ""


                );
               numberlist.add(temp);
//               System.out.println(numberlist);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return numberlist;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }

    public ArrayList<CreateClinicModel> vaccineCount(String cnic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(vaccinecount)){
            System.out.println("select for msg");
            preparedStatement.setString(1, cnic);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(rs.toString());
            ArrayList<CreateClinicModel> vaccinecount = new ArrayList<CreateClinicModel>();
            System.out.println(rs);
            while (rs.next()){
                String count =rs.getString("COUNT(vcs_id)");
                String name = rs.getString("name");
                CreateClinicModel temp = new CreateClinicModel(
                       count,
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
                        "",
                        ""

                );
                vaccinecount.add(temp);
//               System.out.println(numberlist);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return vaccinecount;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }

    public ArrayList<CreateClinicModel> ViewFromdate(String start, String end, String Cnic) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(disease_clinic_count_fromDate)){
            System.out.println("came to dao");
            preparedStatement.setString(1,start);
            preparedStatement.setString(2,end);
            preparedStatement.setString(3,Cnic);
            ResultSet rs = preparedStatement.executeQuery();
//            System.out.println(rs.toString());
            ArrayList<CreateClinicModel> ViewFromdates = new ArrayList<CreateClinicModel>();
            while (rs.next()){
                String clinicID =rs.getString("COUNT(ncs_id)");
                String disease = rs.getString("disease");
                CreateClinicModel temp = new CreateClinicModel(
                        clinicID,
                        "",
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
                ViewFromdates.add(temp);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return ViewFromdates;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }

    public ArrayList<vaccineClinicModel> VclinicRegisterNumList(vaccineClinicModel vclinicRegisterNumList) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(NormalC_registeredNList)){
            System.out.println("select for msg");
            preparedStatement.setString(1, vclinicRegisterNumList.getVcs_id());
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(rs.toString());
            ArrayList<vaccineClinicModel> vclinicRegisterNumLists = new ArrayList<vaccineClinicModel>();
            System.out.println(rs);
            while (rs.next()){
                String clinicID =rs.getString("ncs_id");
                String numbers = rs.getString("uMobile");
                vaccineClinicModel temp = new vaccineClinicModel(
                        clinicID,
                        "",
                        "",
                        "",
                        numbers,
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
                vclinicRegisterNumLists.add(temp);
//               System.out.println(numberlist);
//                System.out.println(title+"--"+disease+"--"+Location);
            };
            return vclinicRegisterNumLists;
        } catch (SQLException throwables) {
            printSQLException(throwables);
//            return throwables.getMessage();
        }
        return null;
    }
}



