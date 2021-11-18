package com.suwasewana.model;

public class RPHIAnnouncementsModel {
    String announcement_id;
    String title;
    String description;
    String banner;
    String target_moh;
    String posted_date;
    String phi_officer;
    String expire_date;
    public RPHIAnnouncementsModel(
        String announcement_id,
        String title,
        String description,
        String banner,
        String target_moh,
        String posted_date,
        String phi_officer,
        String expire_date
    ){
        this.announcement_id=announcement_id;
        this.title=title;
        this.description=description;
        this.banner=banner;
        this.target_moh=target_moh;
        this.posted_date=posted_date;
        this.phi_officer=phi_officer;
        this.expire_date=expire_date;
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

    public String getTarget_moh() {
        return target_moh;
    }

    public void setTarget_moh(String target_moh) {
        this.target_moh = target_moh;
    }

    public String getPosted_date() {
        return posted_date;
    }

    public void setPosted_date(String posted_date) {
        this.posted_date = posted_date;
    }

    public String getPhi_officer() {
        return phi_officer;
    }

    public void setPhi_officer(String phi_officer) {
        this.phi_officer = phi_officer;
    }

    public String getExpire_date() {
        return expire_date;
    }

    public void setExpire_date(String expire_date) {
        this.expire_date = expire_date;
    }
}