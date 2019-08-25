<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.wx.shopping.model.User,java.text.DecimalFormat"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到购物商城</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet" type="text/css" href="css/indentBuyer.css">
</head>

<body class="bodybgcolor">
	<%
		User user = new User();
		user = (User) request.getSession().getAttribute("loginuser");
		DecimalFormat df = new DecimalFormat("0.00"); //0.00表示小数点后的2位小数

		String stateSession = (String) request.getSession().getAttribute("state");
		
	%>

	<table class="frameTable">
		<tr>
			<td align="center" valign="top">
				<table class="headTable">
					<tr>
						<td><jsp:include page="head.jsp"></jsp:include></td>
					</tr>
				</table> <br />
				
				<table class="stateTable">
					<tr>	
						<td><a href="indentSellerSession.jsp"> <%
 	if (stateSession == null) {
 %><font color="#95b9ea">所有订单</font> <%
 	} else {
 %>所有订单<%
 	}
 %>
						</a></td>
						<td><a href="indentSellerSession.jsp?state=待发货"> <%
 	if (stateSession != null && stateSession.equals("待发货")) {
 %><font color="#95b9ea">待发货</font> <%
 	} else {
 %>待发货<%
 	}
 %>
						</a></td>
						<td><a href="indentSellerSession.jsp?state=已发货"> <%
 	if (stateSession != null && stateSession.equals("已发货")) {
 %><font color="#95b9ea">已发货</font> <%
 	} else {
 %>已发货<%
 	}
 %>
						</a></td>
						<td><a href="indentSellerSession.jsp?state=交易成功"> <%
 	if (stateSession != null && stateSession.equals("交易成功")) {
 %><font color="#95b9ea">交易成功</font> <%
 	} else {
 %>交易成功<%
 	}
 %>
						</a></td>
						<td><a href="indentSellerSession.jsp?state=退款中"> <%
 	if (stateSession != null && stateSession.equals("退款中")) {
 %><font color="#95b9ea">请求退款</font> <%
 	} else {
 %>请求退款<%
 	}
 %>
						</a></td>
						
					</tr>
					<tr>
						<td></td>
					</tr>
				</table>
				
				<table width="80%" align="center">
					<tr>
						<td valign="top" bgcolor="#f2ffff">
							<div>
								<jsp:include page="indentSellerProduct.jsp"></jsp:include>
							</div>

						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>