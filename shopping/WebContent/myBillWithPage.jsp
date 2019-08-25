<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*,com.wx.shopping.factory.ConnectionFactory,com.wx.shopping.model.*,java.text.DecimalFormat"%>
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

	<!-- 连接数据库并从数据库中调取记录-->
	<%
		int pageSize = 20;//每个页面所显示的记录数
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
			rs = sql.executeQuery("SELECT * FROM bill WHERE uid='" + user.getUid() + "';");
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
			rs.absolute(position-1);
			/*
			out.println(recordCount);
            out.println(pageCount);
            out.println(showPage);
            out.println(position);
            */
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
				<table width="80%" border="1" cellpadding="3" cellspacing="1"
					bordercolor="#CCCCCC" class="tableStyle1">
					<tr bgcolor="#F0F8FF">
						<td height="30">账单编号</td>
						<td>金额</td>
						<td>交易类型</td>
						<td width="28%">备注</td>
						<td>交易时间</td>
						<td>交易对象</td>
						<td>操作</td>
					</tr>
					<%
						//用for循环显示本页中应显示的的记录
							for (int i = 1; i <= pageSize &&rs.next(); i++) {
					%>
					<tr>
						<td><%=rs.getString("bid")%></td>
						<td><%=df.format(rs.getDouble("b_money"))%></td>
						<td><%=rs.getString("deal_type")%></td>
						<td><%=rs.getString("remark")%></td>
						<td><%=rs.getString("time")%></td>
						<td><%=rs.getString("deal_object")%></td>
						<td><a href="deleteOneBill.jsp?bid=<%=rs.getString("bid")%>">删除</a></td>
					</tr>
					<%
						
							}
							rs.close();
							conn.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
				</table> <br> 第<%=showPage%>页（共<%=pageCount%>页） <br> <a
				href="myBillWithPage.jsp?showPage=1">首页</a> <a
				href="myBillWithPage.jsp?showPage=<%=showPage - 1%>">上一页</a> <%
 	//根据pageCount的值显示每一页的数字并附加上相应的超链接
 	for (int i = 1; i <= pageCount; i++) {
 %> <a href="myBillWithPage.jsp?showPage=<%=i%>"><%=i%></a> <%
 	}
 %> <a href="myBillWithPage.jsp?showPage=<%=showPage + 1%>">下一页</a> <a
				href="myBillWithPage.jsp?showPage=<%=pageCount%>">末页</a> <!-- 通过表单提交用户想要显示的页数 -->
				<form action="myBillWithPage.jsp" method="post">
					跳转到第<input type="text" name="showPage" size="4" autocomplete="off">页 <input
						type="submit" name="submit" value="跳转" class="buttonDefault">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>