<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*,com.wx.shopping.factory.ConnectionFactory"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String shopname = request.getParameter("shopname");
		String sql = "select * from shop where s_name='" + shopname + "'";

		Connection conn = ConnectionFactory.getInstance().makeConnection();
		Statement st = (Statement) conn.createStatement(); // 创建用于执行静态sql语句的Statement对象  
		ResultSet rs = st.executeQuery(sql);
		if (rs.next())//占用
			out.print("0");
		else//不占用
			out.print("1");
	%>
</body>
</html>