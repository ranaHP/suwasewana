package com.suwasewana.model;

import com.suwasewana.core.SuwasewanaHashing;

public class OfficerLoginModel {
    public String mobile;
    protected String password;
    protected String officer_Id;
    protected String full_name;
    protected String NIC ;
    protected String Address;
    protected String MAC;
    protected String City;
    protected String District;
    protected String post;
    protected String login_status;
    protected String PostalCode;
    protected String DP ;
    protected String mohId ;
    protected String suspended_time;
    protected String message;


    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getOfficer_Id() {
        return officer_Id;
    }

    public void setOfficer_Id(String officer_Id) {
        this.officer_Id = officer_Id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getNIC() {
        return NIC;
    }

    public void setNIC(String NIC) {
        this.NIC = NIC;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getMAC() {
        return MAC;
    }

    public void setMAC(String MAC) {
        this.MAC = MAC;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String city) {
        City = city;
    }

    public String getDistrict() {
        return District;
    }

    public void setDistrict(String district) {
        District = district;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getLogin_status() {
        return login_status;
    }

    public void setLogin_status(String login_status) {
        this.login_status = login_status;
    }

    public String getPostalCode() {
        return PostalCode;
    }

    public void setPostalCode(String postalCode) {
        PostalCode = postalCode;
    }

    public String getDP() {
        return DP;
    }

    public void setDP(String DP) {
        this.DP = DP;
    }

    public String getMohId() {
        return mohId;
    }

    public void setMohId(String mohId) {
        this.mohId = mohId;
    }

    public String getSuspended_time() {
        return suspended_time;
    }

    public void setSuspended_time(String suspended_time) {
        this.suspended_time = suspended_time;
    }

    public OfficerLoginModel(String mob, String pass, String mac , String post){
        super();
        SuwasewanaHashing hashing = new SuwasewanaHashing(pass);

        this.mobile=mob;
        this.password=hashing.getHashValue();
//        System.out.println("Officer login hash " + this.password);
        this.MAC=mac;
        this.post = post;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
