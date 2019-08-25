<%@page import="com.wx.shopping.dao.impl.CartDaoImpl"%>
<%@page import="com.wx.shopping.dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
CartDao cartdao=new CartDaoImpl();

String cids=request.getParameter("cids");
String[] cidsArray=cids.split(",");
for(int i=0;i<cidsArray.length;i++)
{
	cartdao.deleteCartByCid(cidsArray[i]);
}
%>
<jsp:forward page="myCart.jsp"></jsp:forward>
</body>
</html>