package com.suwasewana.model;

public class CommanForCompalinAndUser {

    ComplainModel complainModel;
    User user;
    protected String ComplainType;

//
    public CommanForCompalinAndUser
    (ComplainModel complainModel, User user ,String ctype){
        super();
        this.complainModel=complainModel;
        this.user=user;
        this.ComplainType=ctype;
    }

    public ComplainModel getComplainModel() {
        return complainModel;
    }

    public void setComplainModel(ComplainModel complainModel) {
        this.complainModel = complainModel;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getComplainType() {
        return ComplainType;
    }

    public void setComplainType(String complainType) {
        ComplainType = complainType;
    }
}
