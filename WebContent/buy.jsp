<%@page import="com.wx.shopping.dao.impl.ProductDaoImpl"%>
<%@page import="com.wx.shopping.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.wx.shopping.model.*,com.wx.shopping.dao.ProductDao,com.wx.shopping.dao.impl.ProductDaoImpl,java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到购物商城</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
<script src="js/buy.js"></script>
</head>
<jsp:include page="isLoginAndLogin.jsp"></jsp:include>
<body class="bodybgcolor">
	<%
		User user = new User();
		user = (User) request.getSession().getAttribute("loginuser");

		String pid = request.getParameter("pid");
		String cid=request.getParameter("cid");
		request.getSession().setAttribute("cid", cid);

		ProductDao productDao = new ProductDaoImpl();
		Product product = productDao.selectByPid(pid);

		double sellPrice = product.getPrice() * product.getDiscount();

		DecimalFormat df = new DecimalFormat("0.00"); //0.00表示小数点后的2位小数
	%>

	<table class="frameTable">
		<tr>
			<td align="center" valign="top">
				<table class="headTable">
					<tr>
						<td><jsp:include page="head.jsp"></jsp:include></td>
					</tr>
				</table> <br /> <br />
				<form method="post" autocomplete="off"
					onSubmit="return checkall(this);"
					action="<%=request.getContextPath()%>/BuyServlet">
					<table width="40%" border="1" cellpadding="1" cellspacing="0"
						bordercolor="#CCCCCC" align="center" class="tableStyle1">

						<tr>
							<td class="STYLE1">
								<div align="right">商品数量：</div>
							</td>
							<td><input name="num" id="num" onkeyup="numKeyUp()"
								onblur="checkMoney()" />
								<div id="num_info"></div></td>
						</tr>
						<tr>
							<td class="STYLE1">
								<div align="right">单价：</div>
							</td>
							<td><div id="sellPrice"><%=df.format(sellPrice)%></div></td>

						</tr>
						<tr>
							<td class="STYLE1">
								<div align="right">总计：</div>
							</td>
							<td><div id="totalPrice_info"></div></td>
						</tr>
						<tr>
							<td class="STYLE1">
								<div align="right">余额：</div>
							</td>
							<td><div id="moneyLeft"><%=df.format(user.getU_money())%></div>
								<div id="moneyLeft_info"></div></td>
						</tr>
						<tr>
							<td class="STYLE1">
								<div align="right">登录密码：</div>
							</td>
							<td><input type="password" name="password" id="password"
								onblur="checkPsw()"> <input type="hidden"
								id="truePassword" value="<%=user.getPassword()%>">
								<div id="password_info"></div>
								</td>

						</tr>

					</table>
					<p>
						<input type="hidden" name="uid" value=<%=user.getUid()%> /> <input
							type="hidden" name="pid" value=<%=request.getParameter("pid")%> /><input
							type="submit" name="Submit" value="确认购买" class="buttonDefault"> <input
							type="reset" name="Reset" value="重 置" class="buttonDefault">
					</p>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>