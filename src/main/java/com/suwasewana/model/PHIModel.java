package com.suwasewana.model;

public class PHIModel {

    protected String mohId;
    protected String PostalCode;
    protected String password;
    protected String login_status;
    protected String phi_post;
    protected String District;
    protected String City;
    protected String Address;
    protected String device_MAC;
    protected String mobile;
    protected String NIC;
    protected String full_name;
    protected String phi_Id;


    public PHIModel
            (
                     String mohId,
                     String full_name,
                     String PostalCode,
                     String password,
                     String login_status,
                     String phi_post,
                     String District,
                     String City,
                     String Address,
                     String device_MAC,
                     String mobile,
                     String NIC,
                     String phi_Id
            ) {
        super();
        this.mohId=mohId;
        this.PostalCode=PostalCode;
        this.password=password;
        this.login_status=login_status;
        this.phi_post=phi_post;
        this.District=District;
        this.City=City;
        this.Address=Address;
        this.device_MAC=device_MAC;
        this.mobile=mobile;
        this.NIC=NIC;
        this.full_name=full_name;
        this.phi_Id=phi_Id;
    }

    public String getMohId() {
        return mohId;
    }

    public void setMohId(String mohId) {
        this.mohId = mohId;
    }

    public String getPostalCode() {
        return PostalCode;
    }

    public void setPostalCode(String postalCode) {
        PostalCode = postalCode;
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

    public String getDistrict() {
        return District;
    }

    public void setDistrict(String district) {
        District = district;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String city) {
        City = city;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
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

    public String getNIC() {
        return NIC;
    }

    public void setNIC(String NIC) {
        this.NIC = NIC;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getPhi_Id() {
        return phi_Id;
    }

    public void setPhi_Id(String phi_Id) {
        this.phi_Id = phi_Id;
    }
}
