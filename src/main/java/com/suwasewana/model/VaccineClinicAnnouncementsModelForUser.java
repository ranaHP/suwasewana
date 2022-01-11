package com.suwasewana.model;

public class VaccineClinicAnnouncementsModelForUser {
    public String vaccine_clinic_id ;
    public String vaccine_id;
    public String vaccine_name;
    public String max_sheet;
    public String location;
    public String date;
    public String time;
    public String Lower_Age;
    public String Upper_Age;
    public String allocatetime;
    public String Regno;
    public String Dosage;
    public String Next_sloat;
    public String Status;
    public String Que_no;




    public VaccineClinicAnnouncementsModelForUser(
            String vaccine_clinic_id,
        String vaccine_id,
        String vaccine_name,
        String max_sheet,
        String location,
        String date,
        String time,
        String Lower_Age,
            String Upper_Age,
        String allocatetime,
        String Regno,
        String Dosage,
            String Next_sloat,
            String Status,
            String Que_no
            ){
        super();
        this.vaccine_clinic_id=vaccine_clinic_id;
        this.vaccine_id=vaccine_id;
        this.vaccine_name=vaccine_name;
        this.max_sheet=max_sheet;
        this.location=location;
        this.date=date;
        this.time=time;
        this.Lower_Age=Lower_Age;
        this.Upper_Age=Upper_Age;
        this.allocatetime=allocatetime;
        this.Regno=Regno;
        this.Dosage=Dosage;
        this.Next_sloat=Next_sloat;
        this.Status=Status;
        this.Que_no=Que_no;

    }

    public String getQue_no() {
        return Que_no;
    }

    public void setQue_no(String que_no) {
        Que_no = que_no;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

    public String getLower_Age() {
        return Lower_Age;
    }

    public void setLower_Age(String lower_Age) {
        Lower_Age = lower_Age;
    }

    public String getUpper_Age() {
        return Upper_Age;
    }

    public void setUpper_Age(String upper_Age) {
        Upper_Age = upper_Age;
    }

    public String getVaccine_clinic_id() {
        return vaccine_clinic_id;
    }

    public String getNext_sloat() {
        return Next_sloat;
    }

    public void setNext_sloat(String next_sloat) {
        Next_sloat = next_sloat;
    }

    public void setVaccine_clinic_id(String vaccine_clinic_id) {
        this.vaccine_clinic_id = vaccine_clinic_id;
    }

    public String getVaccine_id() {
        return vaccine_id;
    }

    public void setVaccine_id(String vaccine_id) {
        this.vaccine_id = vaccine_id;
    }

    public String getVaccine_name() {
        return vaccine_name;
    }

    public void setVaccine_name(String vaccine_name) {
        this.vaccine_name = vaccine_name;
    }

    public String getMax_sheet() {
        return max_sheet;
    }

    public void setMax_sheet(String max_sheet) {
        this.max_sheet = max_sheet;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }


    public String getAllocatetime() {
        return allocatetime;
    }

    public void setAllocatetime(String allocatetime) {
        this.allocatetime = allocatetime;
    }

    public String getRegno() {
        return Regno;
    }

    public void setRegno(String regno) {
        Regno = regno;
    }

    public String getDosage() {
        return Dosage;
    }

    public void setDosage(String dosage) {
        Dosage = dosage;
    }
}

