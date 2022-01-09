package com.suwasewana.model;

public class VaccineClinicSessionUserDetails {
    public String vaccine_clinic_id ;
    public String Regno;
    public String nic;
    public String vid;
    public String allocatetime;
    public String Tpno;





    public VaccineClinicSessionUserDetails(
            String vaccine_clinic_id ,
            String Regno,
            String nic,
            String vid,
            String allocatetime,
            String Tpno
    ){
        super();
        this.vaccine_clinic_id =vaccine_clinic_id ;
        this.Regno=Regno;
        this.nic=nic;
        this.vid=vid;
        this.allocatetime=allocatetime;
        this.Tpno=Tpno;

    }

    public String getVaccine_clinic_id() {
        return vaccine_clinic_id;
    }

    public void setVaccine_clinic_id(String vaccine_clinic_id) {
        this.vaccine_clinic_id = vaccine_clinic_id;
    }

    public String getRegno() {
        return Regno;
    }

    public void setRegno(String regno) {
        Regno = regno;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getVid() {
        return vid;
    }

    public void setVid(String vid) {
        this.vid = vid;
    }

    public String getAllocatetime() {
        return allocatetime;
    }

    public void setAllocatetime(String allocatetime) {
        this.allocatetime = allocatetime;
    }

    public String getTpno() {
        return Tpno;
    }

    public void setTpno(String tpno) {
        Tpno = tpno;
    }
}