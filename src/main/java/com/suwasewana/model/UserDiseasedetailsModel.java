package com.suwasewana.model;

public class UserDiseasedetailsModel {

    protected String d_id;
    protected String name;
    protected String description;
    protected String active_cases;
    protected String death_cases;
    protected String recovered_cases;

    public UserDiseasedetailsModel(String d_id,String name,String description,String active_cases,String death_cases,String recovered_cases){
        this.d_id = d_id;
        this.name = name;
        this.description =description;
        this.active_cases =active_cases;
        this.death_cases = death_cases;
        this.recovered_cases = recovered_cases;
    }

    public String getD_id() {
        return d_id;
    }

    public void setD_id(String d_id) {
        this.d_id = d_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
}
