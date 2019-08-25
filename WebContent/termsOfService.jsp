<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.wx.shopping.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到购物商城</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
</head>

<body class="bodybgcolor">
	<%
		User user = new User();
		user = (User) request.getSession().getAttribute("loginuser");
	%>
	
	<table class="frameTable">
		<tr>
			<td align="center" valign="top">
				<%
					//判断用户是否登录

					if (user == null) {
				%><table class="headTable">
					<tr>
						<td align="left" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="login.jsp">登录</a>&nbsp;&nbsp;<a href="register.jsp">注册</a></td>
					</tr>

				</table> <%
 	} else {
 %>
				<table class="headTable">
					<tr>
						<td><jsp:include page="head.jsp"></jsp:include></td>
					</tr>
				</table> <%
 	}
 %> <br />
				<table width="65%" height="550" border="0" cellpadding="1"
					cellspacing="0" bordercolor="#CCCCCC" class="tableStyle1">
					<tr>
						<td align="center" valign="top">购物商城服务条款......</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>