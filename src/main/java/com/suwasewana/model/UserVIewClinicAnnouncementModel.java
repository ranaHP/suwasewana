package com.suwasewana.model;

public class UserVIewClinicAnnouncementModel {
    public String banner;
    public String tittle;
    public String date;
    public String descrition;
    public String moh_id;

    public UserVIewClinicAnnouncementModel(

            String banner,
            String tittle,
            String date,
            String descrition,
            String moh_id

    ){
        super();

        this.banner=banner;
        this.tittle=tittle;
        this.date=date;
        this.descrition=descrition;
        this.moh_id=moh_id;

    }

    public String getBanner() {
        return banner;
    }

    public void setBanner(String banner) {
        this.banner = banner;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDescrition() {
        return descrition;
    }

    public void setDescrition(String descrition) {
        this.descrition = descrition;
    }

    public String getMoh_id() {
        return moh_id;
    }

    public void setMoh_id(String moh_id) {
        this.moh_id = moh_id;
    }
}

