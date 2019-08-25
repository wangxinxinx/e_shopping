<%@page
	import="java.util.Iterator,java.util.List,com.wx.shopping.model.*,java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到购物商城</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
</head>
<jsp:include page="islogin.jsp"></jsp:include>
<body class="bodybgcolor">
	<jsp:useBean id="billinfo" class="com.wx.shopping.service.BillService"></jsp:useBean>
	<%
		User user = new User();
		user = (User) request.getSession().getAttribute("loginuser");
		List bills = billinfo.queryBillById(user.getUid());
		// out.print(stus.size());  
		Iterator iter = bills.iterator();
		
		DecimalFormat df = new DecimalFormat("0.00");  //0.00表示小数点后的2位小数
		
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
				<table width="80%"  border="1" cellpadding="6"
						cellspacing="1" bordercolor="#CCCCCC" class="tableStyle1">
					<tr bgcolor="#F0F8FF" >
						<td style="height:200px">账单编号</td>
						<td height="90">金额</td>
						<td height="90">交易类型</td>
						<td width="28%" height="90">备注</td>
						<td height="90">交易时间</td>
						<td height="90">交易对象</td>
						<td height="90">操作</td>

					</tr>
					<%
						int i = 0;
						while (iter.hasNext()) {
							Bill bill = (Bill) iter.next();
					%>
					<tr >
						<td><%=bill.getBid()%></td>
						<td><%=df.format(bill.getB_money())%></td>
						<td><%=bill.getDeal_type()%></td>
						<td><%=bill.getRemark()%></td>
						<td><%=bill.getTime()%></td>
						<td><%=bill.getDeal_object()%></td>

						<td><a href="deleteOneBill.jsp?bid=<%=bill.getBid()%>">删除</a></td>
					</tr>
					<%
						i++;
						}
					%>

				</table>
			</td>
		</tr>
	</table>
</body>
</html>