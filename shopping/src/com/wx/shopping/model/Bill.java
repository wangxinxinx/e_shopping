package com.wx.shopping.model;

public class Bill {
	private String bid;
	private double b_money;
	private String deal_type;
	private String remark;
	private String time;
	private String uid;
	private String deal_object;

	public String getDeal_object() {
		return deal_object;
	}

	public void setDeal_object(String deal_object) {
		this.deal_object = deal_object;
	}

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public double getB_money() {
		return b_money;
	}

	public void setB_money(double b_money) {
		this.b_money = b_money;
	}

	

	public String getDeal_type() {
		return deal_type;
	}

	public void setDeal_type(String deal_type) {
		this.deal_type = deal_type;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

}
