package com.suwasewana.model;

public class DistrictModel {
    String province_id;
    String 	name;
    String 	district_id;

    public DistrictModel(
         String province_id,
         String name,
         String district_id
    ){
        this.province_id=province_id;
        this.name=name;
        this.district_id=district_id;
    }

    public String getProvince_id() {
        return province_id;
    }

    public void setProvince_id(String province_id) {
        this.province_id = province_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDistrict_id() {
        return district_id;
    }

    public void setDistrict_id(String district_id) {
        this.district_id = district_id;
    }
}
