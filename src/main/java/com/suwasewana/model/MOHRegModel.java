package com.suwasewana.model;

import java.util.ArrayList;

public class MOHRegModel {
    protected String MName;
    protected String TpNo;
    protected String MOHHead;
    protected String Cities;
    protected String Province;
    protected String District;
    protected String city;
    protected String x;
    protected String y;

    public MOHRegModel(
            String MName,
            String TpNo,
            String MOHHead,
            String Cities,
            String Province,
            String District,
            String city,
            String x,
            String y
    ){
        super();
        this.MName=MName;
        this.TpNo=TpNo;
        this.MOHHead=MOHHead;
        this.Cities=Cities;
        this.Province=Province;
        this.District=District;
        this.city=city;
        this.x=x;
        this.y=y;
    }

    public String getMName() {
        return MName;
    }

    public void setMName(String MName) {
        this.MName = MName;
    }

    public String getTpNo() {
        return TpNo;
    }

    public void setTpNo(String tpNo) {
        TpNo = tpNo;
    }

    public String getMOHHead() {
        return MOHHead;
    }

    public void setMOHHead(String MOHHead) {
        this.MOHHead = MOHHead;
    }

    public String getCities() {
        return Cities;
    }

    public void setCities(String cities) {
        Cities = cities;
    }

    public String getProvince() {
        return Province;
    }

    public void setProvince(String province) {
        Province = province;
    }

    public String getDistrict() {
        return District;
    }

    public void setDistrict(String district) {
        District = district;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getX() {
        return x;
    }

    public void setX(String x) {
        this.x = x;
    }

    public String getY() {
        return y;
    }

    public void setY(String y) {
        this.y = y;
    }
}
