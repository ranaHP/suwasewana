package com.suwasewana.model;

public class UserHomeHealthAnnouncementModel {

    protected String announcement_id;
    protected String title;
    protected String description;
    protected String banner;
    protected String target_district;
    protected String target_provinces;
    protected String target_cities;
;

    public UserHomeHealthAnnouncementModel(

            String announcement_id_id,
            String title,
            String description,
            String banner,
            String target_district,
            String target_provinces,
            String target_cities
    ){
        super();

        this.announcement_id = announcement_id_id;
        this.title = title;
        this.description = description;
        this.banner = banner;
        this.target_district = target_district;
        this.target_provinces = target_provinces;
        this.target_cities = target_cities;
    }

    public String getAnnouncement_id() {
        return announcement_id;
    }

    public void setAnnouncement_id(String announcement_id) {
        this.announcement_id = announcement_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBanner() {
        return banner;
    }

    public void setBanner(String banner) {
        this.banner = banner;
    }

    public String getTarget_district() {
        return target_district;
    }

    public void setTarget_district(String target_district) {
        this.target_district = target_district;
    }

    public String getTarget_provinces() {
        return target_provinces;
    }

    public void setTarget_provinces(String target_provinces) {
        this.target_provinces = target_provinces;
    }

    public String getTarget_cities() {
        return target_cities;
    }

    public void setTarget_cities(String target_cities) {
        this.target_cities = target_cities;
    }
}
