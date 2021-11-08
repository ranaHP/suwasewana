package com.suwasewana.model;

public class PublicAnnouncementModel {
    String announcement_id;
    String title;
    String description;
    String banner;
    public PublicAnnouncementModel(
        String announcement_id,
        String title,
        String description,
        String banner
    ){
        this.announcement_id=announcement_id;
        this.title=title;
        this.description=description;
        this.banner=banner;
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

}
