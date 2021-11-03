package com.suwasewana.model;

public class UserHomeModel {

    protected String ncs_id;
    protected String title;
    protected String start_time;
    protected String end_time;
    protected String date;
    protected String description;
    protected String max_sheet;
    protected String conduct_by;
    protected String target_moh;
    protected String target_people;
    protected String location;
    protected String clinical_officer;
    protected String banner;

    public UserHomeModel(
        String ncs_id,
        String title,
        String start_time,
        String end_time,
        String date,
        String description,
        String max_sheet,
        String conduct_by,
        String target_moh,
        String target_people,
        String location,
        String clinical_officer,
        String banner
    ){
        super();
        this.ncs_id = ncs_id;
        this.title = title;
        this.start_time = start_time;
        this.end_time = end_time;
        this.date = date;
        this.description = description;
        this.max_sheet= max_sheet;
        this.conduct_by = conduct_by;
        this.target_moh = target_moh;
        this.target_people =  target_people;
        this.location = location;
        this.clinical_officer = clinical_officer;
        this.banner = banner;
    }

    public String getNcs_id() {
        return ncs_id;
    }

    public void setNcs_id(String ncs_id) {
        this.ncs_id = ncs_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMax_sheet() {
        return max_sheet;
    }

    public void setMax_sheet(String max_sheet) {
        this.max_sheet = max_sheet;
    }

    public String getConduct_by() {
        return conduct_by;
    }

    public void setConduct_by(String conduct_by) {
        this.conduct_by = conduct_by;
    }

    public String getTarget_moh() {
        return target_moh;
    }

    public void setTarget_moh(String target_moh) {
        this.target_moh = target_moh;
    }

    public String getTarget_people() {
        return target_people;
    }

    public void setTarget_people(String target_people) {
        this.target_people = target_people;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getClinical_officer() {
        return clinical_officer;
    }

    public void setClinical_officer(String clinical_officer) {
        this.clinical_officer = clinical_officer;
    }

    public String getBanner() {
        return banner;
    }

    public void setBanner(String banner) {
        this.banner = banner;
    }
}
