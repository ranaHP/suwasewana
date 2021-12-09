package com.suwasewana.model;

import java.sql.Blob;

public class CreateClinicModel {
    public String clinicID;
    public String title;
    public String date;
    public String time;
    public String duration;
    public String disease;
    public String description;
    public String maxpatient;
    public String 	Avail_seats;
    public String conduct;
    public String MOH;
    public String Target;
    public String location;
    public String cNic;

    public CreateClinicModel(
            String clinicID,
            String title,
            String date,
            String time,
            String duration,
            String disease,
            String description,
            String maxpatient,
            String 	Avail_seats,
            String conduct,
            String MOH,
            String Target,
            String location,
            String cNic

    ){
        super();
        this.clinicID=clinicID;
        this.title= title;
        this.date= date;
        this.time=time;
        this.duration= duration;
        this.disease= disease;
        this.description= description;
        this.maxpatient= maxpatient;
        this.Avail_seats=Avail_seats;
        this.conduct= conduct;
        this.MOH= MOH;
        this.Target=Target;
        this.location= location;
        this.cNic=cNic;

    }

    public String getClinicID() {
        return clinicID;
    }

    public void setClinicID(String clinicID) {
        this.clinicID = clinicID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMaxpatient() {
        return maxpatient;
    }

    public void setMaxpatient(String maxpatient) {
        this.maxpatient = maxpatient;
    }

    public String getAvail_seats() {
        return Avail_seats;
    }

    public void setAvail_seats(String avail_seats) {
        Avail_seats = avail_seats;
    }

    public String getConduct() {
        return conduct;
    }

    public void setConduct(String conduct) {
        this.conduct = conduct;
    }

    public String getMOH() {
        return MOH;
    }

    public void setMOH(String MOH) {
        this.MOH = MOH;
    }

    public String getTarget() {
        return Target;
    }

    public void setTarget(String target) {
        Target = target;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getcNic() {
        return cNic;
    }

    public void setcNic(String cNic) {
        this.cNic = cNic;
    }
}
