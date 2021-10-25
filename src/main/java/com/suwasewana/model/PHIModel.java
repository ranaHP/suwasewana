package com.suwasewana.model;

import com.suwasewana.core.SuwasewanaHashing;

public class PHIModel {

    protected String mohId;
    protected String PostalCode;
    protected String password;
    protected String phi_post;
    protected String District;
    protected String City;
    protected String Address;
    protected String mobile;
    protected String NIC;
    protected String full_name;
    protected String Dp;


    public PHIModel
            (
                    String full_name,
                    String NIC,
                    String mobile,
                    String Address,
                    String City,
                    String District,
                    String phi_post,
                    String PostalCode,
                    String mohId,
                    String Dp
            ) {
        super();
        SuwasewanaHashing hashing = new SuwasewanaHashing("abc");
        this.mohId=mohId;
        this.PostalCode=PostalCode;
        this.full_name=full_name;
        this.NIC=NIC;
        this.mobile=mobile;
        this.Address=Address;
        this.City=City;
        this.District=District;
        this.phi_post=phi_post;
        this.password=hashing.getHashValue();
        this.Dp=Dp;

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

    public String getDp() {
        return Dp;
    }

    public void setDp(String dp) {
        Dp = dp;
    }
}
