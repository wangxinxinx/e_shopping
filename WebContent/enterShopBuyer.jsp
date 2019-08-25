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
<link rel="stylesheet" type="text/css" href="css/index.css">
<script src="js/enterShop.js"></script>
</head>

<body class="bodybgcolor">
	<%
		User user = new User();
		user = (User) request.getSession().getAttribute("loginuser");

		String sid = request.getParameter("sid");

		ShopDao shopdao = new ShopDaoImpl();
		Shop shop = shopdao.selectBySid(sid);

		DecimalFormat df = new DecimalFormat("0.00"); //0.00表示小数点后的2位小数
	%>

	<!-- 连接数据库并从数据库中调取记录-->
	<%
		int pageSize = 5;//每个页面所显示的记录数
		int pageCount = 0;//一共有多少个页面
		int showPage = 1;//目前显示第几页
		int recordCount = 0;//总的记录数
		Connection conn;
		Statement sql;
		ResultSet rs;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			sql = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			//返回可滚动的结果集 
			rs = sql.executeQuery("SELECT * FROM product WHERE sid='" + sid + "';");
			//将游标移到最后一行 
			rs.last();
			//获取最后一行的行号 
			recordCount = rs.getRow();
			//计算分页后的总数 
			pageCount = (recordCount % pageSize == 0) ? (recordCount / pageSize) : (recordCount / pageSize + 1);

			//获取用户想要显示的页数：
			String integer = request.getParameter("showPage");
			if (integer == null) {
				integer = "1";
			}
			try {
				showPage = Integer.parseInt(integer);
			} catch (NumberFormatException e) {
				showPage = 1;
			}
			if (showPage <= 1) {
				showPage = 1;
			}
			if (showPage >= pageCount) {
				showPage = pageCount;
			}

			//如果要显示第showPage页，那么游标应该移动到的position的值是：
			int position = (showPage - 1) * pageSize + 1;
			//设置游标的位置
			rs.absolute(position - 1);
			/*
			out.println(recordCount);
			out.println(pageCount);
			out.println(showPage);
			out.println(position);
			*/
	%>
	<table class="frameTable">
		<tr>
			<td align="center" valign="top" colspan="2" height="10%">
				<%
					//判断用户是否登录

						if (user == null) {
				%><table class="headTable">
					<tr>
						<td align="left" valign="middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="login.jsp">登录</a>&nbsp;&nbsp;<a href="register.jsp">注册</a>&nbsp;&nbsp;<a
							href="index.jsp">商城首页</a></td>
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
				<table width="100%" height="700">
					<tr>
						<td width="15%" bgcolor="#daedea">
							<table height="30%" align="center" bordercolor="#CCCCCC"
								border="1">
								<tr>
									<td colspan="2" align="center"><img height="150"
										width="150" src=<%=shop.getS_pic_path()%>></img></td>
								</tr>
								<tr>
									<td colspan="2" align="center"><font size="4"><%=shop.getS_name()%></font></td>
								</tr>

							</table>
						</td>
						<td valign="top" bgcolor="#f2ffff"><br />
							<table width="95%" border="1" cellpadding="3" cellspacing="1"
								bordercolor="#CCCCCC" class="tableStyle1" align="center">
								<tr bgcolor="#F0F8FF">
									<td height="25" width="10%">头像</td>
									<td width="10%">名称</td>
									<td width="7%">价格</td>
									<td width="7%">折扣</td>
									<td width="7%">现价</td>
									<td width="7%">类别</td>
									<td width="30%">介绍</td>
									<td width="6%">销量</td>
									<td width="6%">信誉</td>
									<td width="10%">操作</td>

								</tr>
								<%
									//用for循环显示本页中应显示的的记录
										for (int i = 1; i <= pageSize && rs.next(); i++) {
								%>
								<tr>
									<td align="center" height="110"><img height="90"
										width="90" src=<%=rs.getString("p_pic_path")%>></img></td>
									<td><%=rs.getString("p_name")%></td>
									<td><%=df.format(rs.getDouble("price"))%></td>
									<td><%=df.format(rs.getDouble("discount"))%></td>
									<td><font color="red"><%=df.format(rs.getDouble("price") * rs.getDouble("discount"))%></font></td>
									<td><%=rs.getString("category")%></td>
									<td><%=rs.getString("p_desc")%></td>
									<td><%=rs.getInt("salses")%></td>
									<td><%=rs.getInt("p_credit")%></td>
									<td align="center"><a
										href="buy.jsp?pid=<%=rs.getString("pid")%>&cid=no">购买</a><br /> <br />
										<a href="addToCart.jsp?pid=
							<%=rs.getString("pid")%>">加入购物车</a>
										<br /> <br />
								</tr>
								<%
									}
										rs.close();
										conn.close();
									} catch (Exception e) {
										e.printStackTrace();
									}
								%>
							</table> <br />
							<div align="center">
								第<%=showPage%>页（共<%=pageCount%>页） <br> <a
									href="enterShopBuyer.jsp?showPage=1&sid=<%=sid%>">首页</a> <a
									href="enterShopBuyer.jsp?showPage=<%=showPage - 1%>&sid=<%=sid%>">上一页</a>
								<%
									//根据pageCount的值显示每一页的数字并附加上相应的超链接
									for (int i = 1; i <= pageCount; i++) {
								%>
								<a href="enterShopBuyer.jsp?showPage=<%=i%>&sid=<%=sid%>"><%=i%></a>
								<%
									}
								%>
								<a href="enterShopBuyer.jsp?showPage=<%=showPage + 1%>&sid=<%=sid%>">下一页</a> <a
									href="enterShopBuyer.jsp?showPage=<%=pageCount%>&sid=<%=sid%>">末页</a>
								<!-- 通过表单提交用户想要显示的页数 -->
								<form action="enterShopBuyer.jsp?sid=<%=sid%>" method="post">
									跳转到第<input type="text" name="showPage" size="4"
										autocomplete="off">页 <input type="submit"
										name="submit" value="跳转" class="buttonDefault">
								</form>
							</div></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>