package com.suwasewana.model;

public class VaccineForHospitalModel {
    String userName;
    String userNic;
    String VaccineName;
    String Date;
    String Location;


    public VaccineForHospitalModel(
            String userName,
        String userNic,
        String VaccineName,
        String Date,
        String Location
    ){
        this.userName=userName;
        this.userNic=userNic;
        this.VaccineName=VaccineName;
        this.Date=Date;
        this.Location=Location;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserNic() {
        return userNic;
    }

    public void setUserNic(String userNic) {
        this.userNic = userNic;
    }

    public String getVaccineName() {
        return VaccineName;
    }

    public void setVaccineName(String vaccineName) {
        VaccineName = vaccineName;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String date) {
        Date = date;
    }

    public String getLocation() {
        return Location;
    }

    public void setLocation(String location) {
        Location = location;
    }
}
