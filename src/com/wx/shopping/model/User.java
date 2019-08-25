package com.wx.shopping.model;

public class User {
	private String uid;
	private String username;
	private String password;
	private String recv_name;
	private String tel;
	private String postcode;
	private String address;
	private String u_pic_path;
	private String email;
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	private String sex;
	private String birthday;
	private double u_money;
	private int u_credit;
	private String reg_day;

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRecv_name() {
		return recv_name;
	}

	public void setRecv_name(String recv_name) {
		this.recv_name = recv_name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getU_pic_path() {
		return u_pic_path;
	}

	public void setU_pic_path(String u_pic_path) {
		this.u_pic_path = u_pic_path;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public double getU_money() {
		return u_money;
	}

	public void setU_money(double u_money) {
		this.u_money = u_money;
	}

	public int getU_credit() {
		return u_credit;
	}

	public void setU_credit(int u_credit) {
		this.u_credit = u_credit;
	}

	public String getReg_day() {
		return reg_day;
	}

	public void setReg_day(String reg_day) {
		this.reg_day = reg_day;
	}
	

}
