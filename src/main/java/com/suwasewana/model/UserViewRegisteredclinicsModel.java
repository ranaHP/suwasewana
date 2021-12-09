package com.suwasewana.model;

public class UserViewRegisteredclinicsModel {

    public String UNic;
    public String title;
    public String disease;
    public String location;
    public String MOH;
    public String datetime;
    public String time;
    public String duration;
    public String maxpatient;
    public String Target;
    public String conduct;
    public String description;

    public UserViewRegisteredclinicsModel(

            String UNic,
            String title,
            String disease,
            String location,
            String MOH,
            String datetime,
            String time,
            String duration,
            String maxpatient,
            String Target,
            String conduct,
            String description

    ){
        super();

        this.title= title;
        this.disease= disease;
        this.location= location;
        this.MOH= MOH;
        this.datetime= datetime;
        this.time=time;
        this.duration= duration;
        this.maxpatient= maxpatient;
        this.Target=Target;
        this.conduct= conduct;
        this.description= description;
        this.UNic=UNic;



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

    public String getUNic() {
        return UNic;
    }

    public void setUNic(String UNic) {
        this.UNic = UNic;
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

    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }

}
