package com.wx.shopping.model;

public class Indent {
	private String iid;
	private int i_num;
	private double i_total_price;

	private String state;
	private String create_time;
	private String send_time;
	private String success_time;
	private String refund_time;
	private String cancel_time;
	private String pid;
	private String uid;

	public String getIid() {
		return iid;
	}

	public void setIid(String iid) {
		this.iid = iid;
	}

	public int getI_num() {
		return i_num;
	}

	public void setI_num(int i_num) {
		this.i_num = i_num;
	}

	public double getI_total_price() {
		return i_total_price;
	}

	public void setI_total_price(double i_total_price) {
		this.i_total_price = i_total_price;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getSend_time() {
		return send_time;
	}

	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}

	public String getSuccess_time() {
		return success_time;
	}

	public void setSuccess_time(String success_time) {
		this.success_time = success_time;
	}

	public String getRefund_time() {
		return refund_time;
	}

	public void setRefund_time(String refund_time) {
		this.refund_time = refund_time;
	}

	public String getCancel_time() {
		return cancel_time;
	}

	public void setCancel_time(String cancel_time) {
		this.cancel_time = cancel_time;
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

}
