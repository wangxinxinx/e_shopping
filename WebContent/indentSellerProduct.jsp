<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*,com.wx.shopping.factory.ConnectionFactory,com.wx.shopping.model.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		User user = new User();
		user = (User) request.getSession().getAttribute("loginuser");
		DecimalFormat df = new DecimalFormat("0.00"); //0.00表示小数点后的2位小数
		String state = (String) request.getSession().getAttribute("state");

		String sql = "SELECT * FROM shop,product,indent WHERE shop.sid=product.sid AND product.pid=indent.pid AND shop.uid='"
				+ user.getUid() + "'";
		if (state != null && state != "") {
			sql += " AND state='" + state + "'";
		}
		sql += ";";

		//out.println(sql);
	%>
	<!-- 连接数据库并从数据库中调取记录-->
	<%
		int pageSize = 10;//每个页面所显示的记录数
		int pageCount = 0;//一共有多少个页面
		int showPage = 1;//目前显示第几页
		int recordCount = 0;//总的记录数
		Connection conn;
		Statement st;
		ResultSet rs;

		try {
			conn = ConnectionFactory.getInstance().makeConnection();

			st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			//返回可滚动的结果集 
			rs = st.executeQuery(sql);
			//将游标移到最后一行 
			rs.last();
			//获取最后一行的行号 
			recordCount = rs.getRow();
			//计算分页后的总数 
			pageCount = (recordCount % pageSize == 0) ? (recordCount / pageSize) : (recordCount / pageSize + 1);

			//获取用户想要显示的页数：
			String integer = (String) request.getSession().getAttribute("showPage");
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
	<div align="center">
		<table width="100%" border="1" cellpadding="3" cellspacing="1"
			bordercolor="#CCCCCC" class="tableStyle1">
			<tr bgcolor="#F0F8FF">
				<td height="25" width="10%">头像</td>
				<td width="15%">名称</td>
				<td width="10%">实付款</td>
				<td width="5%">数量</td>
				<td width="5%">类别</td>
				<td width="27%">介绍</td>
				<td width="10%">交易状态</td>
				<td width="8%">操作时间</td>
				<td width="10%">操作</td>
			</tr>
			<%
				//用for循环显示本页中应显示的的记录
					for (int i = 1; i <= pageSize && rs.next(); i++) {
			%>
			<tr>
				<td align="center" height="110"><img height="90" width="90"
					src=<%=rs.getString("p_pic_path")%>></img></td>
				<td><%=rs.getString("p_name")%></td>
				<td><font color="red"><%=df.format(rs.getDouble("i_total_price"))%></font></td>
				<td><%=rs.getString("i_num")%></td>
				<td><%=rs.getString("category")%></td>
				<td><%=rs.getString("p_desc")%></td>
				<td><%=rs.getString("state")%></td>
				<td>
					<%
						if (state == null) {
					%> <%=rs.getString("create_time")%> <%
 	} else if (state.equals("待发货")) {
 %> <%=rs.getString("create_time")%> <%
 	} else if (state.equals("已发货")) {
 %> <%=rs.getString("send_time")%> <%
 	} else if (state.equals("交易成功")) {
 %> <%=rs.getString("success_time")%> <%
 	} else if (state.equals("退款中")) {
 %><%=rs.getString("refund_time")%>
					<%
						}
					%>
				</td>
				<td align="center">
					<%
						if (state == null) {
								} else if (state.equals("待发货")) {
					%> <a href="sendout.jsp?iid=<%=rs.getString("iid")%>">发货</a> <%
 	} else if (state.equals("已发货")) {
 %> <%
 	} else if (state.equals("交易成功")) {
 %> <%
 	} else if (state.equals("退款中")) {
 %><a
					href="<%=request.getContextPath()%>/IndentSellerServlet?iid=<%=rs.getString("iid")%>&op=接受退款">接受退款</a>
					<%
						}
					%>
				</td>
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
		<br> 第<%=showPage%>页（共<%=pageCount%>页） <br> <a
			href="indentSellerShowPage.jsp?showPage=1">首页</a> <a
			href="indentSellerShowPage.jsp?showPage=<%=showPage - 1%>">上一页</a>
		<%
			//根据pageCount的值显示每一页的数字并附加上相应的超链接
			for (int i = 1; i <= pageCount; i++) {
		%>
		<a href="indentSellerShowPage.jsp?showPage=<%=i%>"><%=i%></a>
		<%
			}
		%>
		<a href="indentSellerShowPage.jsp?showPage=<%=showPage + 1%>">下一页</a>
		<a href="indentSellerShowPage.jsp?showPage=<%=pageCount%>">末页</a>
		<!-- 通过表单提交用户想要显示的页数 -->
		<form action="indentSellerShowPage.jsp" method="post">
			跳转到第<input type="text" name="showPage" size="4" autocomplete="off">页
			<input type="submit" name="submit" value="跳转" class="buttonDefault">
		</form>
	</div>
</body>
</html>