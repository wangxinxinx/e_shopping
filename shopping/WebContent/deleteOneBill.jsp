<%@page import="com.wx.shopping.dao.impl.BillDaoImpl"%>
<%@page import="com.wx.shopping.dao.BillDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="islogin.jsp"></jsp:include>
<%
BillDao billDao=new BillDaoImpl();
billDao.deleteBillByBid(request.getParameter("bid"));

%>

<jsp:forward page="myBill.jsp"></jsp:forward>