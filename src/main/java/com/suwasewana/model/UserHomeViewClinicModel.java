package com.suwasewana.model;

public class UserHomeViewClinicModel {

    public String ncs_id;
    public String title;
    public String disease;
    public String location;
    public String MOH;
    public String datetime;
    public String time;
    public String duration;
    public String maxpatient;
    public String 	Avail_seats;
    public String Target;
    public String conduct;
    public String description;
    public String cNic;

    public UserHomeViewClinicModel(
            String ncs_id,
            String title,
            String disease,
            String location,
            String MOH,
            String datetime,
            String time,
            String duration,
            String maxpatient,
            String 	Avail_seats,
            String Target,
            String conduct,
            String description,
            String cNic
    ){
        super();

        this.ncs_id= ncs_id;
        this.title= title;
        this.disease= disease;
        this.location= location;
        this.MOH= MOH;
        this.datetime= datetime;
        this.time=time;
        this.duration= duration;
        this.maxpatient= maxpatient;
        this.Avail_seats=Avail_seats;
        this.Target=Target;
        this.conduct= conduct;
        this.description= description;

        this.cNic=cNic;
    }

    public String getNcs_id() {
        return ncs_id;
    }

    public void setNcs_id(String ncs_id) {
        this.ncs_id = ncs_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
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

    public String getTarget() {
        return Target;
    }

    public void setTarget(String target) {
        Target = target;
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

    public String getcNic() {
        return cNic;
    }

    public void setcNic(String cNic) {
        this.cNic = cNic;
    }
}
