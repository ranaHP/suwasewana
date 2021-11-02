package com.suwasewana.model;

import com.suwasewana.core.SuwasewanaHashing;

public class User {
	protected String uMobile;
	protected String uname;
	protected String uPassword;
	protected String uNic;
	protected String uProvince;
	protected String uDistrict ;
	protected String uCity ;
	protected String uMoh;
	protected String location;
	protected String login_status;
	protected String suspended_time;
	protected String street_no;
	protected String address_line1;
	protected String zip_code	;



	public User(
			String uMobile,
		String uname,
		String uPassword,
		String uNic,
		String uProvince,
		String uDistrict,
		String uCity,
		String uMoh,
		String location,
		String login_status,
		String suspended_time,
		String street_no,
		String address_line1,
		String zip_code
	) {
		super();
		 this.uMobile = uMobile;
		 this.uname = uname;
		 this.uPassword = uPassword;
		 this.uNic = uNic;
		 this.uProvince = uProvince;
		 this.uDistrict = uDistrict;
		 this.uCity = uCity;
		 this.uMoh = uMoh;
		 this.location = location;
		 this.login_status = login_status;
		 this.suspended_time = suspended_time;
		 this.street_no = street_no;
		 this.address_line1 = address_line1;
		 this.zip_code = zip_code;

	}

	public String getuMobile() {
		return uMobile;
	}

	public void setuMobile(String uMobile) {
		this.uMobile = uMobile;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getuPassword() {
		return uPassword;
	}

	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}

	public String getuNic() {
		return uNic;
	}

	public void setuNic(String uNic) {
		this.uNic = uNic;
	}

	public String getuProvince() {
		return uProvince;
	}

	public void setuProvince(String uProvince) {
		this.uProvince = uProvince;
	}

	public String getuDistrict() {
		return uDistrict;
	}

	public void setuDistrict(String uDistrict) {
		this.uDistrict = uDistrict;
	}

	public String getuCity() {
		return uCity;
	}

	public void setuCity(String uCity) {
		this.uCity = uCity;
	}

	public String getuMoh() {
		return uMoh;
	}

	public void setuMoh(String uMoh) {
		this.uMoh = uMoh;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLogin_status() {
		return login_status;
	}

	public void setLogin_status(String login_status) {
		this.login_status = login_status;
	}

	public String getSuspended_time() {
		return suspended_time;
	}

	public void setSuspended_time(String suspended_time) {
		this.suspended_time = suspended_time;
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

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
}
