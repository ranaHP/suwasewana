package com.suwasewana.model;

import com.suwasewana.core.SuwasewanaHashing;

public class UserLoginModel {
    protected String mobile;
    protected String password;
    protected String unic;


    public UserLoginModel(String number, String pass , String nic) {
        super();
        SuwasewanaHashing hashing = new SuwasewanaHashing(pass);
        this.mobile = number;
        this.password = hashing.getHashValue();
        this.unic = nic;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getUnic() {
        return unic;
    }

    public void setUnic(String unic) {
        this.unic = unic;
    }
}
