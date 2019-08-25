<%@page import="com.wx.shopping.dao.impl.ShopDaoImpl"%>
<%@page import="com.wx.shopping.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*,com.wx.shopping.factory.ConnectionFactory,com.wx.shopping.model.*,java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到购物商城</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet" type="text/css" href="css/myCart.css">
<script src="js/myCart.js"></script>
</head>
<jsp:include page="islogin.jsp"></jsp:include>
<body class="bodybgcolor">
	<%
		User user = new User();
		user = (User) request.getSession().getAttribute("loginuser");

		DecimalFormat df = new DecimalFormat("0.00"); //0.00表示小数点后的2位小数
	%>

	<!-- 连接数据库并从数据库中调取记录-->
	<%
		Connection conn;
		Statement sql;
		ResultSet rs;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			sql = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			//返回可滚动的结果集 
			rs = sql.executeQuery(
					"SELECT * FROM product,cart WHERE product.pid=cart.pid AND cart.uid='" + user.getUid() + "';");
	%>

	<table class="frameTable">
		<tr>
			<td align="center" valign="top" colspan="2" height="10%">
				<table class="headTable">
					<tr>
						<td><jsp:include page="head.jsp"></jsp:include></td>
					</tr>
				</table> <br />
				<form method="post" autocomplete="off"
					onSubmit="return checkall(this);"
					action="<%=request.getContextPath()%>/buyCart.jsp">
					<table width="80%">
						<tr>
							<td valign="top" bgcolor="#f2ffff">
								<table width="100%" border="1" cellpadding="3" cellspacing="1"
									bordercolor="#CCCCCC" class="tableStyle1" align="center">
									<tr bgcolor="#F0F8FF">
										<td width="4%"></td>
										<td width="12%">头像</td>
										<td width="8%">名称</td>
										<td width="8%">价格</td>
										<td width="8%">折扣</td>
										<td width="8%">数量</td>
										<td width="8%">总价</td>
										<td width="4%">类别</td>
										<td width="24%">介绍</td>
										<td width="5%">销量</td>
										<td width="5%">信誉</td>
										<td width="6%">操作</td>

									</tr>
									<%
										while (rs.next()) {
									%>
									<tr>
										<td align="right"><input type="checkbox" name="checkBox"
											value="<%=rs.getString("cid")%>" onClick="clickCheckBox()"></td>
										<td align="center" valign="middle" height="110"><img
											height="90" width="90" src=<%=rs.getString("p_pic_path")%>></img></td>
										<td><%=rs.getString("p_name")%></td>
										<td><%=df.format(rs.getDouble("price"))%></td>
										<td><%=df.format(rs.getDouble("discount"))%></td>
										<td><%=rs.getInt("c_num")%></td>
										<td><input type="hidden" name="total_price"
											value="<%=df.format(rs.getDouble("c_total_price"))%>"><%=df.format(rs.getDouble("c_total_price"))%></td>
										<td><%=rs.getString("category")%></td>
										<td><%=rs.getString("p_desc")%></td>
										<td><%=rs.getInt("salses")%></td>
										<td><%=rs.getInt("p_credit")%></td>
										<td><a href="buy.jsp?pid=<%=rs.getString("product.pid")%>&cid=<%=rs.getString("cid")%>">购买</a><br />
											<br /> <a
											href="deleteOneCart.jsp?cid=
							<%=rs.getString("cid")%>"
											onClick="return firm();">删除</a></td>

									</tr>
									<%
										}
											rs.close();
											conn.close();
										} catch (Exception e) {
											e.printStackTrace();
										}
									%>
								</table>
							</td>
						</tr>
					</table>
					<br /> <br />
					<table class="buyTable">
						<tr>
							<td width="10%"><input type="checkbox" name="selectAll"
								id="selectAll" onclick="selectall();">全选</td>
							<td width="30%"><a href="#" onclick="deleteCarts()">删除</a></td>
							<td width="20%">已选商品&nbsp;<span id="pro_count"
								class="fontStyle">0</span>&nbsp;件
							</td>
							<td width="30%">合计：&nbsp;<span id="total" class="fontStyle">0.00</span>&nbsp;<input
								type="hidden" name="totalInput" id="totalInput">元
							</td>
							<td width="10%"><input type="submit" value="结算"
								class="buyAllButton"></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>