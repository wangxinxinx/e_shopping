package com.wx.shopping.dao;

import com.wx.shopping.model.Indent;

public interface IndentDao {
	public void insertOneIndent(Indent indent) throws Exception;
	public Indent selectByIid(String iid) throws Exception;
	public void deleteByIid(String iid) throws Exception;
	public void updateStateByIid(String iid,String state) throws Exception;
}
