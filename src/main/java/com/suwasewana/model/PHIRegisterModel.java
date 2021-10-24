package com.suwasewana.model;

public class PHIRegisterModel {

    protected String full_name;
    protected String NIC;
    protected String c_officer_no;
    protected String device_MAC;
    protected String mobile;
    protected String street_no;
    protected String state;
    protected String city;
    protected String moh_area;
    protected String password;
    protected String login_status;
    protected String phi_post;

    public PHIRegisterModel(
             String full_name,
             String NIC,
             String c_officer_no,
             String device_MAC,
             String mobile,
             String street_no,
             String state,
             String city,
             String password,
             String login_status,
             String phi_post
    ){
        this.full_name = full_name;
        this.NIC = NIC;
        this.c_officer_no = c_officer_no;
        this.device_MAC = device_MAC;
        this.mobile = mobile;
        this.street_no = street_no;
        this.state = state;
        this.city = city;
        this.password = password;
        this.login_status = login_status;
        this.phi_post = phi_post;
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

    public String getC_officer_no() {
        return c_officer_no;
    }

    public void setC_officer_no(String c_officer_no) {
        this.c_officer_no = c_officer_no;
    }

    public String getDevice_MAC() {
        return device_MAC;
    }

    public void setDevice_MAC(String device_MAC) {
        this.device_MAC = device_MAC;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getStreet_no() {
        return street_no;
    }

    public void setStreet_no(String street_no) {
        this.street_no = street_no;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLogin_status() {
        return login_status;
    }

    public void setLogin_status(String login_status) {
        this.login_status = login_status;
    }

    public String getPhi_post() {
        return phi_post;
    }

    public void setPhi_post(String phi_post) {
        this.phi_post = phi_post;
    }
}
