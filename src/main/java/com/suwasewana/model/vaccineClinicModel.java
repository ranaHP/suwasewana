package com.suwasewana.model;

public class vaccineClinicModel {
    public String vcs_id;
    public String tittle;
    public String start_date_time;
    public String duration;
    public String max_patient;
    public String limit_sheats;
    public String 	target_moh;
    public String Lower_Age;
    public String Upper_Age;
    public String clinical_officer ;
    public String 	v_id ;
    public String vaccine_name;
    public String location;
    public String dose_count;

    public vaccineClinicModel(
             String vcs_id,
             String tittle,
             String start_date_time,
             String duration,
             String max_patient,
             String limit_sheats,
             String target_moh,
             String Lower_Age,
             String Upper_Age,
             String clinical_officer ,
             String v_id ,
             String vaccine_name,
             String location,
             String dose_count
    ){
        super();
        this.vcs_id=vcs_id;
        this.tittle=tittle;
        this.start_date_time=start_date_time;
        this.duration=duration;
        this.max_patient=max_patient;
        this.limit_sheats=limit_sheats;
        this.target_moh=target_moh;
        this.Lower_Age=Lower_Age;
        this.Upper_Age=Upper_Age;
        this.clinical_officer=clinical_officer;
        this.v_id=v_id;
        this.vaccine_name=vaccine_name;
        this.location=location;
        this.dose_count=dose_count;

    }

    public String getVcs_id() {
        return vcs_id;
    }

    public void setVcs_id(String vcs_id) {
        this.vcs_id = vcs_id;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public String getStart_date_time() {
        return start_date_time;
    }

    public void setStart_date_time(String start_date_time) {
        this.start_date_time = start_date_time;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getMax_patient() {
        return max_patient;
    }

    public void setMax_patient(String max_patient) {
        this.max_patient = max_patient;
    }

    public String getLimit_sheats() {
        return limit_sheats;
    }

    public void setLimit_sheats(String limit_sheats) {
        this.limit_sheats = limit_sheats;
    }

    public String getTarget_moh() {
        return target_moh;
    }

    public void setTarget_moh(String target_moh) {
        this.target_moh = target_moh;
    }

    public String getLower_Age() {
        return Lower_Age;
    }

    public void setLower_Age(String lower_Age) {
        Lower_Age = lower_Age;
    }

    public String getUpper_Age() {
        return Upper_Age;
    }

    public void setUpper_Age(String upper_Age) {
        Upper_Age = upper_Age;
    }

    public String getClinical_officer() {
        return clinical_officer;
    }

    public void setClinical_officer(String clinical_officer) {
        this.clinical_officer = clinical_officer;
    }

    public String getV_id() {
        return v_id;
    }

    public void setV_id(String v_id) {
        this.v_id = v_id;
    }

    public String getVaccine_name() {
        return vaccine_name;
    }

    public void setVaccine_name(String vaccine_name) {
        this.vaccine_name = vaccine_name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDose_count() {
        return dose_count;
    }

    public void setDose_count(String dose_count) {
        this.dose_count = dose_count;
    }
}
