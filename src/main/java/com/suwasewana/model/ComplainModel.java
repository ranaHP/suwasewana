package com.suwasewana.model;

public class ComplainModel {


    protected String CType;
    protected String UType;
    protected String User;
    protected String Posted_Date;
    protected String CTitle;
    protected String CMessage;
    protected String PHIId;
    protected String PHIName;
    protected String Status;

    public ComplainModel
    (String CTitle,String CType,String UType,String PHIId,String CMessage,String PName ,  String User, String Posted_Date, String Status){
        super();
        this.CTitle=CTitle;
        this.CType=CType;
        this.UType=UType;
        this.PHIId=PHIId;
        this.PHIName=PName;
        this.User=User;
        this.Posted_Date=Posted_Date;
        this.CMessage=CMessage;
        this.Status=Status;
    }

    public String getCType() {
        return CType;
    }

    public void setCType(String CType) {
        this.CType = CType;
    }

    public String getUType() {
        return UType;
    }

    public void setUType(String UType) {
        this.UType = UType;
    }

    public String getUser() {
        return User;
    }

    public void setUser(String user) {
        User = user;
    }

    public String getPosted_Date() {
        return Posted_Date;
    }

    public void setPosted_Date(String posted_Date) {
        Posted_Date = posted_Date;
    }

    public String getCTitle() {
        return CTitle;
    }

    public void setCTitle(String CTitle) {
        this.CTitle = CTitle;
    }

    public String getCMessage() {
        return CMessage;
    }

    public void setCMessage(String CMessage) {
        this.CMessage = CMessage;
    }

    public String getPHIId() {
        return PHIId;
    }

    public void setPHIId(String PHIId) {
        this.PHIId = PHIId;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }
}
