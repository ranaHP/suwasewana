package com.suwasewana.model;

public class OfficerLoginModel {
    public String mobile;
    protected String password;
    protected String MAC;

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

    public String getMAC() {
        return MAC;
    }

    public void setMAC(String MAC) {
        this.MAC = MAC;
    }
}
