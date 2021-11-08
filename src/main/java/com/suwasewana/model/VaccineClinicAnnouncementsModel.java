package com.suwasewana.model;

public class VaccineClinicAnnouncementsModel {
//    public String clinicID;
    public String title;
    public String description;
    public String banner;
    public String vaccine_id;
    public String max_sheet;
    public String location;
    public String target_people;
    public String datetime;
    public String duration;
    public String age_limit;
    public String target_moh;
    public String vaccine_clinic_id ;

    public VaccineClinicAnnouncementsModel(
//             String clinicID,
             String title,
             String description,
             String banner,
             String vaccine_id,
             String max_sheet,
             String location,
             String target_people,
             String datetime,
             String duration,
             String age_limit,
             String target_moh,
             String vaccine_clinic_id
            ){
        super();
//        this.clinicID=clinicID;
        this.title=title;
        this.description=description;
        this.banner=banner;
        this.vaccine_id=vaccine_id;
        this.max_sheet=max_sheet;
        this.location=location;
        this.target_people=target_people;
        this.datetime=datetime;
        this.duration=duration;
        this.age_limit=age_limit;
        this.target_moh=target_moh;
        this.vaccine_clinic_id=vaccine_clinic_id;

    }

//    public String getClinicID() {
//        return clinicID;
//    }
//
//    public void setClinicID(String clinicID) {
//        this.clinicID = clinicID;
//    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBanner() {
        return banner;
    }

    public void setBanner(String banner) {
        this.banner = banner;
    }

    public String getVaccine_id() {
        return vaccine_id;
    }

    public void setVaccine_id(String vaccine_id) {
        this.vaccine_id = vaccine_id;
    }

    public String getMax_sheet() {
        return max_sheet;
    }

    public void setMax_sheet(String max_sheet) {
        this.max_sheet = max_sheet;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getTarget_people() {
        return target_people;
    }

    public void setTarget_people(String target_people) {
        this.target_people = target_people;
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

    public String getAge_limit() {
        return age_limit;
    }

    public void setAge_limit(String age_limit) {
        this.age_limit = age_limit;
    }

    public String getTarget_moh() {
        return target_moh;
    }

    public void setTarget_moh(String target_moh) {
        this.target_moh = target_moh;
    }

    public String getVaccine_clinic_id() {
        return vaccine_clinic_id;
    }

    public void setVaccine_clinic_id(String vaccine_clinic_id) {
        this.vaccine_clinic_id = vaccine_clinic_id;
    }
}

