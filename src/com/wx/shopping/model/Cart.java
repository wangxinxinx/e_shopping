package com.wx.shopping.model;

public class Cart {
	private String cid;
	private String pid;
	private String uid;
	private int c_num;
	private double c_total_price;
	
	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}
	public double getC_total_price() {
		return c_total_price;
	}

	public void setC_total_price(double c_total_price) {
		this.c_total_price = c_total_price;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

}
