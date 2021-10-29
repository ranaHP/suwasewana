package com.suwasewana.model;

public class OfficerLoginModel {
    public String mobile;
    protected String password;
    protected String phi_Id;
    protected String full_name;
    protected String NIC ;
    protected String Address;
    protected String MAC;
    protected String City;
    protected String District;
    protected String phi_post;
    protected String login_status;
    protected String PostalCode;
    protected String DP ;
    protected String mohId ;
    protected String suspended_time;

    public OfficerLoginModel(String mob, String pass, String mac){
        super();
        this.mobile=mob;
        this.password=pass;
        this.MAC=mac;
    }

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

    public String getPhi_Id() {
        return phi_Id;
    }

    public void setPhi_Id(String phi_Id) {
        this.phi_Id = phi_Id;
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

    public String getPhi_post() {
        return phi_post;
    }

    public void setPhi_post(String phi_post) {
        this.phi_post = phi_post;
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
}
