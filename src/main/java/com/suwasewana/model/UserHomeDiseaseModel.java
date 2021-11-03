package com.suwasewana.model;

public class UserHomeDiseaseModel {

    protected String cases_record_id;
    protected String district_id;
    protected String disease_id;
    protected String city_id;
    protected String active_cases;
    protected String death_cases;
    protected String recovered_cases;
    protected String date_time;
    protected String isVerified;

    public UserHomeDiseaseModel(

            String cases_record_id,
            String district_id,
            String disease_id,
            String city_id,
            String active_cases,
            String death_cases,
            String recovered_cases,
            String date_time,
            String isVerified
    ){
        super();

        this.cases_record_id = cases_record_id;
        this.district_id = district_id;
        this.disease_id = disease_id;
        this.city_id = city_id;
        this.active_cases = active_cases;
        this.death_cases = death_cases;
        this.recovered_cases = recovered_cases;
        this.date_time = date_time;
        this.isVerified = isVerified;
    }

    public String getCases_record_id() {
        return cases_record_id;
    }

    public void setCases_record_id(String cases_record_id) {
        this.cases_record_id = cases_record_id;
    }

    public String getDistrict_id() {
        return district_id;
    }

    public void setDistrict_id(String district_id) {
        this.district_id = district_id;
    }

    public String getDisease_id() {
        return disease_id;
    }

    public void setDisease_id(String disease_id) {
        this.disease_id = disease_id;
    }

    public String getCity_id() {
        return city_id;
    }

    public void setCity_id(String city_id) {
        this.city_id = city_id;
    }

    public String getActive_cases() {
        return active_cases;
    }

    public void setActive_cases(String active_cases) {
        this.active_cases = active_cases;
    }

    public String getDeath_cases() {
        return death_cases;
    }

    public void setDeath_cases(String death_cases) {
        this.death_cases = death_cases;
    }

    public String getRecovered_cases() {
        return recovered_cases;
    }

    public void setRecovered_cases(String recovered_cases) {
        this.recovered_cases = recovered_cases;
    }

    public String getDate_time() {
        return date_time;
    }

    public void setDate_time(String date_time) {
        this.date_time = date_time;
    }

    public String getIsVeryfied() {
        return isVerified;
    }

    public void setIsVeryfied(String isVeryfied) {
        this.isVerified = isVeryfied;
    }
}
