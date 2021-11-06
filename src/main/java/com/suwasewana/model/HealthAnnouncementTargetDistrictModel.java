package com.suwasewana.model;

public class HealthAnnouncementTargetDistrictModel {
    public String announcement_id;
    public String district_id;
     public HealthAnnouncementTargetDistrictModel(
      String announcement_id,
      String district_id
     ){
         super();
         this.announcement_id=announcement_id;
         this.district_id=district_id;
     }

    public String getAnnouncement_id() {
        return announcement_id;
    }

    public void setAnnouncement_id(String announcement_id) {
        this.announcement_id = announcement_id;
    }

    public String getDistrict_id() {
        return district_id;
    }

    public void setDistrict_id(String district_id) {
        this.district_id = district_id;
    }
}
