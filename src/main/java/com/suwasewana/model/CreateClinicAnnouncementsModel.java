package com.suwasewana.model;

public class CreateClinicAnnouncementsModel {
    public String AID;
    public String clinicID;
    public String disease;
    public String title;
    public String location;
    public String MOH;
    public String datetime;
    public String duration;
    public String maxpatient;
    public String Target;
    public String conduct;
    public String description;
    public String image;
    public String cNic;

    public CreateClinicAnnouncementsModel(
            String AID,
            String clinicID,
            String disease,
            String title,
            String location,
            String MOH,
            String datetime,
            String duration,
            String maxpatient,
            String Target,
            String conduct,
            String description,
            String image,
            String cNic
            ){
        super();
        this.AID=AID;
        this.clinicID=clinicID;
        this.disease= disease;
        this.title= title;
        this.location= location;
        this.MOH= MOH;
        this.datetime= datetime;
        this.duration= duration;
        this.maxpatient= maxpatient;
        this.Target=Target;
        this.conduct= conduct;
        this.description= description;
        this.image=image;
        this.cNic=cNic;



    }

    public String getAID() {
        return AID;
    }

    public void setAID(String AID) {
        this.AID = AID;
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

    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}

