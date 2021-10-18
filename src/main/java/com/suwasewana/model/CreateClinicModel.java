package com.suwasewana.model;

import java.sql.Blob;

public class CreateClinicModel {
    public String disease;
    public String title;
    public String location;
    public String MOH;
    public String datetime;
    public String duration;
    public String maxpatient;
    public String conduct;
    public String description;

    public CreateClinicModel(
           String disease,
           String title,
           String location,
           String MOH,
           String datetime,
           String duration,
           String maxpatient,
           String conduct,
           String description
    ){
        super();
        this.disease= disease;
        this.title= title;
        this.location= location;
        this.MOH= MOH;
        this.datetime= datetime;
        this.duration= duration;
        this.maxpatient= maxpatient;
        this.conduct= conduct;
        this.description= description;

    }

    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getMOH() {
        return MOH;
    }

    public void setMOH(String MOH) {
        this.MOH = MOH;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getMaxpatient() {
        return maxpatient;
    }

    public void setMaxpatient(String maxpatient) {
        this.maxpatient = maxpatient;
    }

    public String getConduct() {
        return conduct;
    }

    public void setConduct(String conduct) {
        this.conduct = conduct;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}