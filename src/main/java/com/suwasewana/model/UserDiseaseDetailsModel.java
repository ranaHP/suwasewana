package com.suwasewana.model;

public class UserDiseaseDetailsModel {

    public String d_id;
    public String name;
    public String description;

    public UserDiseaseDetailsModel(String d_id,String name,String description){
        super();
        this.d_id=d_id;
        this.name = name;
        this.description= description;
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



}
