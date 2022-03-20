package com.suwasewana.model;

public class UserDiseaseModel {

    public String name;
    public String description;

    public UserDiseaseModel(String name,String description){
        super();
        this.name = name;
        this.description= description;
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
