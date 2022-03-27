package com.suwasewana.model;

import com.suwasewana.core.SuwasewanaHashing;

public class PHIModel {

    protected String mohId;
    protected String zip_code;
    protected String password;
    protected String login_status;
    protected String phi_post;
    protected String province;
    protected String District;
    protected String City;
    protected String Address;
    protected String device_MAC;
    protected String mobile;
    protected String NIC;
    protected String full_name;
    protected String image;
    protected String street_no;
    protected String address_line1;
    protected String location;
    protected String suspend_time;
    protected String assignCity;


    public PHIModel
            (
                    String mohId,
                    String zip_code,
                    String password,
                    String login_status,
                    String phi_post,
                    String province,
                    String District,
                    String City,
                    String Address,
                    String device_MAC,
                    String mobile,
                    String NIC,
                    String full_name,
                    String image,
                    String street_no,
                    String address_line1,
                    String location,
                    String suspend_time,
                    String assignCity
            ) {
        super();
        String Hashpassword="Suwasewana"+NIC;
        SuwasewanaHashing hashing = new SuwasewanaHashing(Hashpassword);
        this.mohId=mohId;
        this.zip_code=zip_code;
        this.password=hashing.getHashValue();;
        this.login_status=login_status;
        this.phi_post=phi_post;
        this.province=province;
        this.District=District;
        this.City=City;
        this.Address=Address;
        this.device_MAC=device_MAC;
        this.mobile=mobile;
        this.NIC=NIC;
        this.full_name=full_name;
        this.image=image;
        this.street_no=street_no;
        this.address_line1=address_line1;
        this.location=location;
        this.suspend_time=suspend_time;
        this.assignCity=assignCity;
    }

    public String getMohId() {
        return mohId;
    }

    public void setMohId(String mohId) {
        this.mohId = mohId;
    }

    public String getZip_code() {
        return zip_code;
    }

    public void setZip_code(String zip_code) {
        this.zip_code = zip_code;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLogin_status() {
        return login_status;
    }

    public void setLogin_status(String login_status) {
        this.login_status = login_status;
    }

    public String getPhi_post() {
        return phi_post;
    }

    public void setPhi_post(String phi_post) {
        this.phi_post = phi_post;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getDistrict() {
        return District;
    }

    public void setDistrict(String district) {
        District = district;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String city) {
        City = city;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getDevice_MAC() {
        return device_MAC;
    }

    public void setDevice_MAC(String device_MAC) {
        this.device_MAC = device_MAC;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getNIC() {
        return NIC;
    }

    public void setNIC(String NIC) {
        this.NIC = NIC;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }



    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStreet_no() {
        return street_no;
    }

    public void setStreet_no(String street_no) {
        this.street_no = street_no;
    }

    public String getAddress_line1() {
        return address_line1;
    }

    public void setAddress_line1(String address_line1) {
        this.address_line1 = address_line1;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getSuspend_time() {
        return suspend_time;
    }

    public void setSuspend_time(String suspend_time) {
        this.suspend_time = suspend_time;
    }

    public String getAssignCity() {
        return assignCity;
    }

    public void setAssignCity(String assignCity) {
        this.assignCity = assignCity;
    }
}
