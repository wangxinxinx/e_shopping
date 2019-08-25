<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.wx.shopping.model.User,java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到购物商城</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
<script src="js/moneyTransfer.js"></script>
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
						<td><jsp:include page="head.jsp"></jsp:include></td>
					</tr>
				</table>
				<br/><br/>
				<form method="post" onSubmit="return checkall(this);"
					autocomplete="off"
					action="<%=request.getContextPath()%>/MoneyTransferServlet">
					<table width="80%" height="120" border="0" cellpadding="1"
						cellspacing="0" bordercolor="#CCCCCC" class="tableStyle1">
						<tr>
							<td width="35%" height="30" class="STYLE1">
								<div align="right">收款人：</div>
							</td>
							<td width="35%">
								<div align="left">
									<input type="text" name="receiver" id="receiver" />
								</div>
								<div align="left" id="recv_info"></div>
							</td>
							<td class="STYLE1 tableStyle2" align="left"><span
								class="desc STYLE6">·</span><span class="STYLE5">用户名/用户编号/手机号</span></td>
						</tr>
						<tr>
							<td height="30" class="STYLE1">
								<div align="right">当前余额：</div>
							</td>
							<td>
								<div align="left">
									<%=df.format(user.getU_money())%>
									<input type="hidden" id="money_left"
										value=<%=user.getU_money()%>>
								</div>
							</td>
							<td class="STYLE1 tableStyle2"></td>
						</tr>
						<tr>
							<td height="30" class="STYLE1">
								<div align="right">付款金额：</div>
							</td>
							<td>
								<div align="left">
									<input name="money" id="money"
										onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" /><br />
								</div>
								<div align="left" id="money_info"></div>
							</td>
							<td class="STYLE1 tableStyle2"></td>
						</tr>
						<tr>
							<td class="STYLE1">
								<div align="right">付款说明：</div>
							</td>
							<td>
								<div align="left">
									<textarea name="remark" id="remark" rows="3" cols="21"></textarea>
								</div>
								<div align="left" id="remark_info"></div>
							</td>
							<td class="STYLE1 tableStyle2" align="left"><span
								class="desc STYLE6">·</span><span class="STYLE5">不超过300个字节</span></td>
						</tr>
						<tr>
							<td height="30" colspan="3" class="STYLE8" align="center">温馨提示：钱一旦转出就无法追回，请确认收款人信息正确！<br /></td>
						</tr>
					</table>
					<p>
						<input type="submit" name="Submit" value="确认转账" class="buttonDefault"> <input
							type="reset" name="Reset" value="重 置" class="buttonDefault">
					</p>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>