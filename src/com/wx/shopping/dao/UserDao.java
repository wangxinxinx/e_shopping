package com.wx.shopping.dao;

import com.wx.shopping.model.User;

public interface UserDao {
	public User selectByNamePassword(String username ,String password )throws Exception;
	public User selectByUid(String uid) throws Exception;
	public void insertOneUser(User user) throws Exception ;
	public void updatePersonalInfo(User user) throws Exception ;
	public void updatePsw(String uid,String newPsw) throws Exception;
	public void updateMoney(String uid,double changeMoney) throws Exception;
	public void addMoney(String uid,double money) throws Exception;
	public boolean moneyTransfer(String uid,String receiver,String money,String remark) throws Exception;
}
