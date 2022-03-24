package com.suwasewana.model;

public class CityModel {
    String city_id;
    String 	name;
    String 	district_id;

    public CityModel(
         String district_id,
         String name,
         String city_id
    ){
        this.city_id=city_id;
        this.name=name;
        this.district_id=district_id;
    }

    public String getCity_id() {
        return city_id;
    }

    public void setCity_id(String city_id) {
        this.city_id = city_id;
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
