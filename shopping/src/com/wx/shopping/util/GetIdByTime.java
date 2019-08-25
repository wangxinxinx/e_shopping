package com.wx.shopping.util;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
public class GetIdByTime {
	
	public static String getUid() {
		long time = new Date().getTime();
		String uid = "U"+String.valueOf(time);
//System.out.println(uid);
		return uid;
	}
	public static String getSid() {
		long time = new Date().getTime();
		String sid = "S"+String.valueOf(time);
//System.out.println(sid);
		return sid;
	}
	
	public static String getPid() {
		long time = new Date().getTime();
		String pid = "P"+String.valueOf(time);
//System.out.println(pid);
		return pid;
	}
	
	public static String getIid() {
		long time = new Date().getTime();
		String iid = "I"+String.valueOf(time);
//System.out.println(iid);
		return iid;
	}
	
	public static String getCid() {
		long time = new Date().getTime();
		String cid = "C"+String.valueOf(time);
//System.out.println(iid);
		return cid;
	}
	
	public static String getBid() {
		long time = new Date().getTime();
		String bid = "B"+String.valueOf(time);
//System.out.println(bid);
		return bid;
	}
	
	
	

	public static String getTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy��MM��dd��hhʱmm��ss�� ");		
		Calendar ca = Calendar.getInstance();		
		ca.add(Calendar.HOUR, +8);
		Date date = ca.getTime();
		String nowTime=sdf.format(date);
//System.out.println(nowTime);
        return nowTime;
	}
	

}
