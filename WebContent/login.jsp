<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到购物商城</title>

<script language="text/javascript" src="js/login.js">
</script>
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/default.css">
</head>
<body class="bodybgcolor">
	<table align="center" >
		
		<tr>
			<td>

				<form action="<%=request.getContextPath()%>/LoginServlet"
					method="post" name="LoginForm">

					<table border="1px" cellspacing="0" cellpadding="5"
						bordercolor="#f9f7f7" align="center" class="tableStyle1">
						<tr>
							<td colspan="2" align="center" class="tableHead2">用户登陆</td>
						</tr>
						<tr>
							<td>用户名：</td>
							<td><input type="text" name="username" /></td>
						</tr>
						<tr>
							<td>密码：</td>
							<td><input type="password" name="password" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit" class="buttonDefault"
								name="submit" value="登录" onclick="return check(this);" /> <input
								type="reset" name="reset" class="buttonDefault" value="重置" /></td>
						</tr>
					</table>

				</form> <br />
				<center>

					<%
						String msg = (String) request.getSession().getAttribute("msg");
						//Object obj = request.getAttribute("msg");
						if (msg != null) {
							out.println(msg);
							request.getSession().removeAttribute("msg");
						} else {
						}
					%>

				</center>
			</td>
		</tr>
		<tr>
			<td><p align="center">
					<a href="index.jsp">返回购物商城首页</a>
				</p></td>
		</tr>
	</table>
</html>