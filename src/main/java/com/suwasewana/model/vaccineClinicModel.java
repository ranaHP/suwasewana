package com.suwasewana.model;

public class vaccineClinicModel {
    public String vcs_id;
    public String tittle;
    public String start_date_time;
    public String duration;
    public String description;
    public String max_patient;
    public String 	target_moh;
    public String target_people;
    public String target_age_limit;
    public String clinical_officer ;
    public String 	v_id ;
    public String location;
    public String dose_count;

    public vaccineClinicModel(
             String vcs_id,
             String tittle,
             String start_date_time,
             String duration,
             String description,
             String max_patient,
             String target_moh,
             String target_people,
             String target_age_limit,
             String clinical_officer ,
             String v_id ,
             String location,
             String dose_count
    ){
        super();
        this.vcs_id=vcs_id;
        this.tittle=tittle;
        this.start_date_time=start_date_time;
        this.duration=duration;
        this.description=description;
        this.max_patient=max_patient;
        this.target_moh=target_moh;
        this.target_people=target_people;
        this.target_age_limit=target_age_limit;
        this.clinical_officer=clinical_officer;
        this.v_id=v_id;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMax_patient() {
        return max_patient;
    }

    public void setMax_patient(String max_patient) {
        this.max_patient = max_patient;
    }

    public String getTarget_moh() {
        return target_moh;
    }

    public void setTarget_moh(String target_moh) {
        this.target_moh = target_moh;
    }

    public String getTarget_people() {
        return target_people;
    }

    public void setTarget_people(String target_people) {
        this.target_people = target_people;
    }

    public String getTarget_age_limit() {
        return target_age_limit;
    }

    public void setTarget_age_limit(String target_age_limit) {
        this.target_age_limit = target_age_limit;
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
