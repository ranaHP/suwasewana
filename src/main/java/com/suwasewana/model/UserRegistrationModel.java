package com.suwasewana.model;

import com.suwasewana.core.SuwasewanaHashing;

public class UserRegistrationModel {
    protected String uMobile;
    protected String uname;
    protected String uPassword;
    protected String uNic;
    protected String uProvince;
    protected String uDistrict;
    protected String uCity;
    protected String uMoh;
    protected String uaddress;
    protected String ulocation;
    protected String ulogin_status;



    public UserRegistrationModel(
            String uMobile,
            String uname,
            String uPassword,
            String uNic,
            String uProvince,
            String uDistrict,
            String uCity,
            String uMoh,
            String uaddress,
            String ulocation,
            String ulogin_status,
            String s) {
        super();
        SuwasewanaHashing hashing = new SuwasewanaHashing(uPassword);
        this.uCity = uCity;
        this.uProvince = uProvince;
        this.uDistrict  = uDistrict;
        this.uname = uname;
        this.uPassword = hashing.getHashValue();
        this.uMoh = uMoh;
        this.uMobile = uMobile;
        this.uNic = uNic;
        this.uaddress = uaddress;
        this.ulocation = ulocation;
        this.ulogin_status = ulogin_status;
     }

    public String getuMobile() {
        return uMobile;
    }

    public void setuMobile(String uMobile) {
        this.uMobile = uMobile;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    public String getuNic() {
        return uNic;
    }

    public void setuNic(String uNic) {
        this.uNic = uNic;
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

    public String getUaddress() {
        return uaddress;
    }

    public void setUaddress(String uaddress) {
        this.uaddress = uaddress;
    }

    public String getUlocation() {
        return ulocation;
    }

    public void setUlocation(String ulocation) {
        this.ulocation = ulocation;
    }

    public String getUlogin_status() {
        return ulogin_status;
    }

    public void setUlogin_status(String ulogin_status) {
        this.ulogin_status = ulogin_status;
    }
}
