package com.suwasewana.model;

public class UserLoginModel {
    protected String mobile;
    protected String password;

    public UserLoginModel(String number, String pass) {
        super();
        this.mobile = number;
        this.password = pass;
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
}
