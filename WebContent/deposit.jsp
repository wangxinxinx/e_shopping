<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.wx.shopping.model.User,java.text.DecimalFormat"%>
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
		
		DecimalFormat df = new DecimalFormat("0.00");  //0.00表示小数点后的2位小数
	%>

	<table class="frameTable">
		<tr>
			<td align="center" valign="top">
				<table class="headTable"> 
					<tr>
						<td ><jsp:include page="head.jsp"></jsp:include>
						</td>
					</tr>
				</table>
				<br/><br/>
				<form method="post" autocomplete="off"
					action="<%=request.getContextPath()%>/DepositServlet">
					<table width="40%" height="90" border="1" cellpadding="1"
						cellspacing="0" bordercolor="#CCCCCC" class="tableStyle1">
						<tr>
							<td width="28%" height="30" class="STYLE1">
								<div align="right">当前余额：</div>
							</td>
							<td width="33%">
								<div align="center">
									<%=df.format(user.getU_money())%>

								</div>
							</td>

						</tr>
						<tr>
							<td height="30" class="STYLE1">
								<div align="right">请输入充值金额：</div>
							</td>
							<td>
								<div align="center">
									<input name="addmoney"
										onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" /><br />
								</div>
							</td>

						</tr>
					</table>
					<p>
						<input type="hidden" name="uid" value=<%=user.getUid()%> /> <input
							type="submit" name="Submit" value="确认充值" class="buttonDefault"> <input
							type="reset" name="Reset" value="重 置" class="buttonDefault">
					</p>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>