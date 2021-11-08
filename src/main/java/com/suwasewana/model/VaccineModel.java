package com.suwasewana.model;

public class VaccineModel {

    protected String ID;
    protected String Name;
    protected String Country;
    protected String Recommended_for;
    protected String Date;
    protected String image;
    protected String status;
    protected String dosage;
    protected String side_effects;
    protected String how_work;
    protected String How_Well_work;
    protected String view_status;
    //
    public VaccineModel
    (String id,String Name,String Country,String Recommended_for,String Date,String image,String status ,  String dosage, String side_effects, String how_work,String How_Well_work, String view_status){
        super();
        this.ID=id;
        this.Name = Name;
        this.Country =Country;
        this.Recommended_for = Recommended_for;
        this.Date = Date;
        this.image = image;
        this.status = status;
        this.dosage = dosage;
        this.side_effects = side_effects;
        this.how_work = how_work;
        this.How_Well_work =How_Well_work;
        this.view_status=view_status;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getCountry() {
        return Country;
    }

    public void setCountry(String country) {
        Country = country;
    }

    public String getRecommended_for() {
        return Recommended_for;
    }

    public void setRecommended_for(String recommended_for) {
        Recommended_for = recommended_for;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String date) {
        Date = date;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDosage() {
        return dosage;
    }

    public void setDosage(String dosage) {
        this.dosage = dosage;
    }

    public String getSide_effects() {
        return side_effects;
    }

    public void setSide_effects(String side_effects) {
        this.side_effects = side_effects;
    }

    public String getHow_work() {
        return how_work;
    }

    public void setHow_work(String how_work) {
        this.how_work = how_work;
    }

    public String getHow_Well_work() {
        return How_Well_work;
    }

    public void setHow_Well_work(String how_Well_work) {
        How_Well_work = how_Well_work;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getView_status() {
        return view_status;
    }

    public void setView_status(String view_status) {
        this.view_status = view_status;
    }
}