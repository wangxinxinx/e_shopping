package com.wx.shopping.model;

public class Product {
	private String pid;
	private String p_name;
	private String category;
	private String p_desc;
	private double price;
	private double discount;
	private String p_pic_path;
	private String create_day;
	private int salses;
	private int p_credit;
	public int getSalses() {
		return salses;
	}

	public void setSalses(int salses) {
		this.salses = salses;
	}

	public int getP_credit() {
		return p_credit;
	}

	public void setP_credit(int p_credit) {
		this.p_credit = p_credit;
	}

	private String sid;
	public String getCreate_day() {
		return create_day;
	}

	public void setCreate_day(String create_day) {
		this.create_day = create_day;
	}

	

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getP_desc() {
		return p_desc;
	}

	public void setP_desc(String p_desc) {
		this.p_desc = p_desc;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public String getP_pic_path() {
		return p_pic_path;
	}

	public void setP_pic_path(String p_pic_path) {
		this.p_pic_path = p_pic_path;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

}
