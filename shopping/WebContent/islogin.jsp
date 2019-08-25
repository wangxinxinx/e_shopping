<%@ page language="java" import="java.util.*,com.wx.shopping.model.User"
	pageEncoding="UTF-8"%>
<%
	User user = (User) session.getAttribute("loginuser");
	if (user == null) {
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>
