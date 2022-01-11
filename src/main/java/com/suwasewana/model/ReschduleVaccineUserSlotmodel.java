package com.suwasewana.model;

public class ReschduleVaccineUserSlotmodel {
    public String vaccine_clinic_id ;

    public String date;
    public String time;

    public String Que_no;

    public String TpNo;
    public String reg_No;




    public ReschduleVaccineUserSlotmodel(
            String vaccine_clinic_id,
            String date,
        String time,
        String Que_no,
        String TpNo,
            String reg_No
            ){
        super();
        this.vaccine_clinic_id=vaccine_clinic_id;
         this.date= date;
         this.time= time;
         this.Que_no= Que_no;
        this.TpNo= TpNo;
        this.reg_No=reg_No;





    }

    public String getReg_No() {
        return reg_No;
    }

    public void setReg_No(String reg_No) {
        this.reg_No = reg_No;
    }

    public String getVaccine_clinic_id() {
        return vaccine_clinic_id;
    }

    public void setVaccine_clinic_id(String vaccine_clinic_id) {
        this.vaccine_clinic_id = vaccine_clinic_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getQue_no() {
        return Que_no;
    }

    public void setQue_no(String que_no) {
        Que_no = que_no;
    }

    public String getTpNo() {
        return TpNo;
    }

    public void setTpNo(String tpNo) {
        TpNo = tpNo;
    }
}

