<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.wx.shopping.model.User,java.text.DecimalFormat"
	pageEncoding="UTF-8"%>
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
		DecimalFormat df = new DecimalFormat("0.00"); //0.00表示小数点后的2位小数

		String categorySession = (String) request.getSession().getAttribute("category");
		String lowPriceSession = (String) request.getSession().getAttribute("lowPrice");
		String highPriceSession = (String) request.getSession().getAttribute("highPrice");
		String sortSession = (String) request.getSession().getAttribute("sort");
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
				<form action="indexSearch.jsp" method="post" autocomplete="off">
					<table border="0" cellpadding="4">
						<tr>
							<td><input type="text" name="search_context"
								class="searchText"><input type="submit" value="搜索"
								class="button"></td>
						</tr>
					</table>
				</form> <br />
				<table class="catagoryTable">
					<tr>
						<th width="20%">分类</th>
						<td><a href="indexCategory.jsp"> <%
 	if (categorySession == null) {
 %><font color="#95b9ea">全部</font> <%
 	} else {
 %>全部<%
 	}
 %>
						</a></td>
						<td><a href="indexCategory.jsp?category=服装"> <%
 	if (categorySession != null && categorySession.equals("服装")) {
 %><font color="#95b9ea">服装</font> <%
 	} else {
 %>服装<%
 	}
 %>
						</a></td>
						<td><a href="indexCategory.jsp?category=家电"> <%
 	if (categorySession != null && categorySession.equals("家电")) {
 %><font color="#95b9ea">家电</font> <%
 	} else {
 %>家电<%
 	}
 %>
						</a></td>
						<td><a href="indexCategory.jsp?category=家具"> <%
 	if (categorySession != null && categorySession.equals("家具")) {
 %><font color="#95b9ea">家具</font> <%
 	} else {
 %>家具<%
 	}
 %>
						</a></td>
						<td><a href="indexCategory.jsp?category=数码"> <%
 	if (categorySession != null && categorySession.equals("数码")) {
 %><font color="#95b9ea">数码</font> <%
 	} else {
 %>数码<%
 	}
 %>
						</a></td>
						<td><a href="indexCategory.jsp?category=汽车"> <%
 	if (categorySession != null && categorySession.equals("汽车")) {
 %><font color="#95b9ea">汽车</font> <%
 	} else {
 %>汽车<%
 	}
 %>
						</a></td>
						<td><a href="indexCategory.jsp?category=美食"> <%
 	if (categorySession != null && categorySession.equals("美食")) {
 %><font color="#95b9ea">美食</font> <%
 	} else {
 %>美食<%
 	}
 %>
						</a></td>
						<td><a href="indexCategory.jsp?category=学习"> <%
 	if (categorySession != null && categorySession.equals("学习")) {
 %><font color="#95b9ea">学习</font> <%
 	} else {
 %>学习<%
 	}
 %>
						</a></td>
						<td><a href="indexCategory.jsp?category=其它"> <%
 	if (categorySession != null && categorySession.equals("其它")) {
 %><font color="#95b9ea">其它</font> <%
 	} else {
 %>其它<%
 	}
 %>
						</a></td>
					</tr>
					<tr>
						<td></td>
					</tr>
				</table>
				<table class="catagoryTable">
					<tr>
						<th width="20%">价格</th>
						<td><form action="indexPrice.jsp" method="post"
								autocomplete="off">
								<input name="lowPrice" class="priceInput"
									<%if (lowPriceSession != null) {%> value="<%=lowPriceSession%>"
									<%}%>
									onkeyup="
									value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')">
								&nbsp;-&nbsp; <input name="highPrice" class="priceInput"
									<%if (highPriceSession != null) {%>
									value="<%=highPriceSession%>" <%}%>
									onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')">
								&nbsp; <input type="submit" value="确定" class="submitPrice">
							</form></td>
					</tr>
				</table>
				<table class="catagoryTable">
					<tr>
						<th width="20%">排序</th>
						<td><a href="indexSort.jsp"> <%
 	if (sortSession == null) {
 %><font color="#95b9ea">综合排序</font> <%
 	} else {
 %>综合排序<%
 	}
 %>
						</a></td>
						<td><a href="indexSort.jsp?sort=销量"> <%
 	if (sortSession != null && sortSession.equals("销量")) {
 %><font color="#95b9ea">销量从高到低</font> <%
 	} else {
 %>销量从高到低<%
 	}
 %>
						</a></td>
						<td><a href="indexSort.jsp?sort=信誉"> <%
 	if (sortSession != null && sortSession.equals("信誉")) {
 %><font color="#95b9ea">信誉从高到低</font> <%
 	} else {
 %>信誉从高到低<%
 	}
 %>
						</a></td>
						<td><a href="indexSort.jsp?sort=价格desc"> <%
 	if (sortSession != null && sortSession.equals("价格desc")) {
 %><font color="#95b9ea">价格从高到低</font> <%
 	} else {
 %>价格从高到低<%
 	}
 %>
						</a></td>
						<td><a href="indexSort.jsp?sort=价格asc"> <%
 	if (sortSession != null && sortSession.equals("价格asc")) {
 %><font color="#95b9ea">价格从低到高</font> <%
 	} else {
 %>价格从低到高<%
 	}
 %>
						</a></td>
					</tr>
				</table> <br />
				<table width="90%" align="center">
					<tr>
						<td valign="top" bgcolor="#f2ffff">
							<div>
								<jsp:include page="showAllProduct.jsp"></jsp:include>
							</div>

						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>