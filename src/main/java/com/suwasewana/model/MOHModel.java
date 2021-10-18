package com.suwasewana.model;

import java.util.ArrayList;

public class MOHModel {
    protected String MId;
    protected String MName;
    protected String TpNo;
    protected String MOHHead;
//    protected ArrayList<String> Cities;
//    protected String Province;
//    protected String District;
//    protected String city;
//    protected Double x;
//    protected Double y;

    public MOHModel(
            String MId,
            String MName,
            String TpNo,
            String MOHHead
//            ArrayList<String> Cities,
//            String Province,
//            String District,
//            String city,
//            Double x,
//            Double y
    ){
        super();
        this.MId=MId;
         this.MName=MName;
         this.TpNo=TpNo;
         this.MOHHead=MOHHead;
//         this.Cities=Cities;
//         this.Province=Province;
//         this.District=District;
//         this.city=city;
//         this.x=x;
//         this.y=y;
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

//    public ArrayList<String> getCities() {
//        return Cities;
//    }
//
//    public void setCities(ArrayList<String> cities) {
//        Cities = cities;
//    }
//
//    public String getProvince() {
//        return Province;
//    }
//
//    public void setProvince(String province) {
//        Province = province;
//    }
//
//    public String getDistrict() {
//        return District;
//    }
//
//    public void setDistrict(String district) {
//        District = district;
//    }
//
//    public String getCity() {
//        return city;
//    }
//
//    public void setCity(String city) {
//        this.city = city;
//    }
//
//    public Double getX() {
//        return x;
//    }
//
//    public void setX(Double x) {
//        this.x = x;
//    }
//
//    public Double getY() {
//        return y;
//    }
//
//    public void setY(Double y) {
//        this.y = y;
//    }
}
