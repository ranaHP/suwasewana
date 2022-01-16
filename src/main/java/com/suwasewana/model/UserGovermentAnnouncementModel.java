package com.suwasewana.model;

public class UserGovermentAnnouncementModel {

    String announcement_id;
    String title ;
    String description ;
    String banner;
    String expire_date;

    public UserGovermentAnnouncementModel(
            String announcement_id,
            String title ,
            String description ,
            String banner,
            String expire_date
    ){
        this.announcement_id = announcement_id;
        this.title  = title ;
        this.description  = description ;
        this.banner = banner;
        this.expire_date = expire_date;
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

    public String getExpire_date() {
        return expire_date;
    }

    public void setExpire_date(String expire_date) {
        this.expire_date = expire_date;
    }
}