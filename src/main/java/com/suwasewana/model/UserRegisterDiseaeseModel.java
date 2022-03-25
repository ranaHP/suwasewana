package com.suwasewana.model;

public class UserRegisterDiseaeseModel {
    public String d_id;
    public String name;
    public String date;

    public UserRegisterDiseaeseModel(String d_id,String name,String date){
        super();
        this.d_id=d_id;
        this.name = name;
        this.date= date;
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
        return date;
    }

    public void setDescription(String description) {
        this.date = description;
    }
}
