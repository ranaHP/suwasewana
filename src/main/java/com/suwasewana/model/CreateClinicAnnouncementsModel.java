package com.suwasewana.model;

public class CreateClinicAnnouncementsModel {
    public String image;

    public CreateClinicAnnouncementsModel(
           String image
    ){
        super();
       this.image=image;
    }
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
