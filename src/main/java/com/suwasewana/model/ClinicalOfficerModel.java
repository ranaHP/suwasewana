package com.suwasewana.model;

import com.suwasewana.core.SuwasewanaHashing;

public class ClinicalOfficerModel {

    protected String Name;
    protected String NIC;
    protected String Mobile;
    protected String City;
    protected String Street;
    protected String State;
    protected String MOHAREA;
    protected String Pass;
    //
    public ClinicalOfficerModel
    (String Name,String NIC,String Mobile,String City,String Street,String State ,String MOHAREA){
        super();

        SuwasewanaHashing hashing = new SuwasewanaHashing("abc");

        this.Name=Name;
        this.NIC=NIC;
        this.Mobile=Mobile;
        this.City=City;
        this.Street=Street;
        this.State=State;
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

    public String getStreet() {
        return Street;
    }

    public void setStreet(String street) {
        Street = street;
    }

    public String getState() {
        return State;
    }

    public void setState(String state) {
        State = state;
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
