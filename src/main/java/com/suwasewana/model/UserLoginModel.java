package com.suwasewana.model;

import com.suwasewana.core.SuwasewanaHashing;

public class UserLoginModel {
    protected String mobile;
    protected String password;
    protected String unic;
    protected String message = "";
    protected String uname;
    protected String uProvince;
    protected String uDistrict;
    protected String uCity;
    protected String uMoh;

    public UserLoginModel(String number, String pass , String nic ) {
        super();
        SuwasewanaHashing hashing = new SuwasewanaHashing(pass);
//        System.out.println("hashing");
        System.out.println("\n" + pass + " : " + hashing.getHashValue() );
//        System.out.println("hashing");
        this.mobile = number;
        this.password = hashing.getHashValue();
        this.unic = nic;
        System.out.println(number + " -- " + pass +  " -- " + nic +  " -- " + this.password );

    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
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

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getuProvince() {
        return uProvince;
    }

    public void setuProvince(String uProvince) {
        this.uProvince = uProvince;
    }

    public String getuDistrict() {
        return uDistrict;
    }

    public void setuDistrict(String uDistrict) {
        this.uDistrict = uDistrict;
    }

    public String getuCity() {
        return uCity;
    }

    public void setuCity(String uCity) {
        this.uCity = uCity;
    }

    public String getuMoh() {
        return uMoh;
    }

    public void setuMoh(String uMoh) {
        this.uMoh = uMoh;
    }
    public String getString(){
        return "{'mobile' : '0412283111'}";
    }
}
