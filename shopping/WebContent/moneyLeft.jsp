<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.wx.shopping.model.User,java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到购物商城</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
</head>
<jsp:include page="islogin.jsp"></jsp:include>
<body class="bodybgcolor">
	<%
		User user = new User();
		user = (User) request.getSession().getAttribute("loginuser");

		DecimalFormat df = new DecimalFormat("0.00"); //0.00表示小数点后的2位小数
	%>
	<table class="frameTable">
		<tr>
			<td align="center" valign="top">

				<table class="headTable">
					<tr>
						<td><jsp:include page="head.jsp"></jsp:include></td>
					</tr>
				</table>
				<br/><br/>
			<div align="center">您的余额为：<font size="5" color="#ff0080"><%=df.format(user.getU_money())%></font></div>
			</td>
		</tr>
	</table>
</body>
</html>