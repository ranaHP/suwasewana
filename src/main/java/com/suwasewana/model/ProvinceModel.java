package com.suwasewana.model;

public class ProvinceModel {
    String province_id;
    String name;

    public ProvinceModel(
        String province_id,
        String name
    ){
        this.province_id=province_id;
        this.name=name;
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
}

