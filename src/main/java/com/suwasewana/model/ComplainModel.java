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
    protected String img1;
    protected String img2;
    protected String img3;
    protected String PHIResponse;
    protected String MOH;
//
    public ComplainModel
    (String CTitle,String CType,String UType,String PHIId,String CMessage,String PName ,  String User, String Posted_Date, String Status,String img1 ,String img2, String img3,String PHIResponse,String MOH){
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
        this.img1=img1;
        this.img2=img2;
        this.img3=img3;
        this.MOH= MOH;
        this.PHIResponse= PHIResponse;
    }

    public String getPHIResponse() {
        return PHIResponse;
    }

    public void setPHIResponse(String PHIResponse) {
        this.PHIResponse = PHIResponse;
    }

    public String getMOH() {
        return MOH;
    }

    public void setMOH(String MOH) {
        this.MOH = MOH;
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

    public String getPHIName() {
        return PHIName;
    }

    public void setPHIName(String PHIName) {
        this.PHIName = PHIName;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }
}
