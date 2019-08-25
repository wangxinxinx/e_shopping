<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.wx.shopping.dao.ShopDao,com.wx.shopping.dao.impl.ShopDaoImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="islogin.jsp"></jsp:include>
<body>
	<%
		String sid = request.getParameter("sid");
		ShopDao shopdao = new ShopDaoImpl();
		shopdao.deleteBySid(sid);
	%>
	<jsp:forward page="deleteOneShopOk.jsp"></jsp:forward>
</body>
</html>