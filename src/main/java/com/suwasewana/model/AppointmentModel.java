package com.suwasewana.model;

public class AppointmentModel {
    String aTitle;
    String appointmentType;
    String phi;
    String reason;
    String appointmentId;
    String posted_data;
    String round;
    String location;
    String time_slot1;
    String time_slot2;
    String special_notice;
    String status;
    String user;

    public AppointmentModel(
            String aTitle,
            String appointmentType,
            String phi,
            String reason,
            String appointmentId,
            String posted_data,
            String round,
            String location,
            String time_slot1,
            String time_slot2,
            String special_notice,
            String status,
            String user ){

         super();
         this.aTitle = aTitle;
         this.appointmentType = appointmentType;
         this.phi = phi;
         this.reason = reason;
         this.appointmentId = appointmentId;
         this.posted_data = posted_data;
         this.round = round;
         this.location = location;
         this.time_slot1 = time_slot1;
         this.time_slot2 = time_slot2;
         this.special_notice = special_notice;
         this.status = status;
         this.user = user;
    }

    public AppointmentModel(String aTitle, String aType, String phi, String reason, String appointmentId, String posted_data, String round, String location, String time_slot1, String time_slot2, String special_notice, String status) {
    }


//    public AppointmentModel(String aTitle, String appointmentType, String phi, String location, String s, String s1, String s2, String s3, String s4, String s5, String s6, String s7) {
//    }

    public String getaTitle() {
        return aTitle;
    }

    public void setaTitle(String aTitle) {
        this.aTitle = aTitle;
    }

    public String getAppointmentType() {
        return appointmentType;
    }

    public void setAppointmentType(String appointmentType) {
        this.appointmentType = appointmentType;
    }

    public String getPhi() {
        return phi;
    }

    public void setPhi(String phi) {
        this.phi = phi;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(String appointmentId) {
        this.appointmentId = appointmentId;
    }

    public String getPosted_data() {
        return posted_data;
    }

    public void setPosted_data(String posted_data) {
        this.posted_data = posted_data;
    }

    public String getRound() {
        return round;
    }

    public void setRound(String round) {
        this.round = round;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getTime_slot1() {
        return time_slot1;
    }

    public void setTime_slot1(String time_slot1) {
        this.time_slot1 = time_slot1;
    }

    public String getTime_slot2() {
        return time_slot2;
    }

    public void setTime_slot2(String time_slot2) {
        this.time_slot2 = time_slot2;
    }

    public String getSpecial_notice() {
        return special_notice;
    }

    public void setSpecial_notice(String special_notice) {
        this.special_notice = special_notice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
}