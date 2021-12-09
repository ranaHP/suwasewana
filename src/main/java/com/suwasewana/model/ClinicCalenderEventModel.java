package com.suwasewana.model;

public class ClinicCalenderEventModel {
    CreateClinicModel nClinic;
    vaccineClinicModel vClinic;
    public String date;

    public ClinicCalenderEventModel
            (CreateClinicModel nClinic, vaccineClinicModel vClinic ,String date){
        super();
        this.nClinic=nClinic;
        this.vClinic=vClinic;
        this.date=date;
    };

    public CreateClinicModel getnClinic() {
        return nClinic;
    }

    public void setnClinic(CreateClinicModel nClinic) {
        this.nClinic = nClinic;
    }

    public vaccineClinicModel getvClinic() {
        return vClinic;
    }

    public void setvClinic(vaccineClinicModel vClinic) {
        this.vClinic = vClinic;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
