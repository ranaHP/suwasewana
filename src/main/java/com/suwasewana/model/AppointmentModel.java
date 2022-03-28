package com.suwasewana.model;

public class AppointmentModel {
    String aTitle;
    String aType ;
    String aPhi ;
    String aReason;
    String app_id;
    String posted_date_time;
    String round;
    String alocation;
    String time_slot_1;
    String time_slot_2;
    String phi_message;
    String status;
    String user_nic ;
    String time_slot_2_end ;
    String time_slot_1_end ;
    String PhiName ;

    public AppointmentModel(
            String aTitle,
            String aType ,
            String aPhi ,
            String aReason,
            String app_id,
            String posted_date_time,
            String round,
            String alocation,
            String time_slot_1,
            String time_slot_2,
            String phi_message,
            String status,
            String user_nic,
            String time_slot_2_end,
            String time_slot_1_end
    ){

         this.aTitle = aTitle;
         this.aType  = aType ;
         this.aPhi  = aPhi ;
         this.aReason = aReason;
         this.app_id = app_id;
         this.posted_date_time = posted_date_time;
         this.round = round;
         this.alocation = alocation;
         this.time_slot_1 = time_slot_1;
         this.time_slot_2 = time_slot_2;
         this.phi_message = phi_message;
         this.status = status;
         this.user_nic  = user_nic ;
         this.time_slot_2_end = time_slot_2_end;
         this.time_slot_1_end = time_slot_1_end;
    }

    public String getPhiName() {
        return PhiName;
    }

    public void setPhiName(String phiName) {
        PhiName = phiName;
    }

    public String getTime_slot_2_end() {
        return time_slot_2_end;
    }

    public void setTime_slot_2_end(String time_slot_2_end) {
        this.time_slot_2_end = time_slot_2_end;
    }

    public String getTime_slot_1_end() {
        return time_slot_1_end;
    }

    public void setTime_slot_1_end(String time_slot_1_end) {
        this.time_slot_1_end = time_slot_1_end;
    }

    public String getaTitle() {
        return aTitle;
    }

    public void setaTitle(String aTitle) {
        this.aTitle = aTitle;
    }

    public String getaType() {
        return aType;
    }

    public void setaType(String aType) {
        this.aType = aType;
    }

    public String getaPhi() {
        return aPhi;
    }

    public void setaPhi(String aPhi) {
        this.aPhi = aPhi;
    }

    public String getaReason() {
        return aReason;
    }

    public void setaReason(String aReason) {
        this.aReason = aReason;
    }

    public String getApp_id() {
        return app_id;
    }

    public void setApp_id(String app_id) {
        this.app_id = app_id;
    }

    public String getPosted_date_time() {
        return posted_date_time;
    }

    public void setPosted_date_time(String posted_date_time) {
        this.posted_date_time = posted_date_time;
    }

    public String getRound() {
        return round;
    }

    public void setRound(String round) {
        this.round = round;
    }

    public String getAlocation() {
        return alocation;
    }

    public void setAlocation(String alocation) {
        this.alocation = alocation;
    }

    public String getTime_slot_1() {
        return time_slot_1;
    }

    public void setTime_slot_1(String time_slot_1) {
        this.time_slot_1 = time_slot_1;
    }

    public String getTime_slot_2() {
        return time_slot_2;
    }

    public void setTime_slot_2(String time_slot_2) {
        this.time_slot_2 = time_slot_2;
    }

    public String getPhi_message() {
        return phi_message;
    }

    public void setPhi_message(String phi_message) {
        this.phi_message = phi_message;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUser_nic() {
        return user_nic;
    }

    public void setUser_nic(String user_nic) {
        this.user_nic = user_nic;
    }
}