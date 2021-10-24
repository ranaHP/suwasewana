package com.suwasewana.model;

import com.suwasewana.core.SuwasewanaHashing;

public class ClinicalOfficerModel {

    protected String Name;
    protected String NIC;
    protected String Mobile;
    protected String City;
    protected String District;
    protected String Address;
    protected String MOHAREA;
    protected String Pass;
    //
    public ClinicalOfficerModel
    (String Name,String NIC,String Mobile,String City,String District,String Address ,String MOHAREA){
        super();

        SuwasewanaHashing hashing = new SuwasewanaHashing("abc");

        this.Name=Name;
        this.NIC=NIC;
        this.Mobile=Mobile;
        this.City=City;
        this.District=District;
        this.Address=Address;
        this.MOHAREA=MOHAREA;
        this.Pass=hashing.getHashValue();

    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getNIC() {
        return NIC;
    }

    public void setNIC(String NIC) {
        this.NIC = NIC;
    }

    public String getMobile() {
        return Mobile;
    }

    public void setMobile(String mobile) {
        Mobile = mobile;
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

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getMOHAREA() {
        return MOHAREA;
    }

    public void setMOHAREA(String MOHAREA) {
        this.MOHAREA = MOHAREA;
    }

    public String getPass() {
        return Pass;
    }

    public void setPass(String pass) {
        Pass = pass;
    }
}
