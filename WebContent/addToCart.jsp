<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.wx.shopping.model.User,java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到购物商城</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
</head>
<jsp:include page="isLoginAndLogin.jsp"></jsp:include>
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
					action="<%=request.getContextPath()%>/AddToCartServlet">
					<table width="40%" height="40" border="1" cellpadding="1"
						cellspacing="0" bordercolor="#CCCCCC" class="tableStyle1">
						
						<tr>
							<td  class="STYLE1">
								<div align="right">商品数量：</div>
							</td>
							<td>
								<div align="center">
									<input name="num"
										onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" /><br />
								</div>
							</td>

						</tr>
					</table>
					<p>
						<input type="hidden" name="uid" value=<%=user.getUid()%> /> 
						<input type="hidden" name="pid" value=<%=request.getParameter("pid")%> /><input
							type="submit" name="Submit" value="加入购物车" class="buttonDefault"> <input
							type="reset" name="Reset" value="重 置" class="buttonDefault">
					</p>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>