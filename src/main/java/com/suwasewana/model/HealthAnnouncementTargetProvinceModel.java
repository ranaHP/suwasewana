package com.suwasewana.model;

public class HealthAnnouncementTargetProvinceModel {
    public String announcement_id;
    public String province_id;
    public HealthAnnouncementTargetProvinceModel(
        String announcement_id,
        String province_id
    ){
        super();
        this.announcement_id=announcement_id;
        this.province_id=province_id;
    }

    public String getAnnouncement_id() {
        return announcement_id;
    }

    public void setAnnouncement_id(String announcement_id) {
        this.announcement_id = announcement_id;
    }

    public String getProvince_id() {
        return province_id;
    }

    public void setProvince_id(String province_id) {
        this.province_id = province_id;
    }
}
