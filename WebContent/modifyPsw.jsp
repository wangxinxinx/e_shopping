<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.wx.shopping.model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到购物商城</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
<script src="js/modifypsw.js"></script>
</head>
<jsp:include page="islogin.jsp"></jsp:include>
<body class="bodybgcolor">
	<%
		User user = new User();
		user = (User) request.getSession().getAttribute("loginuser");
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
				<form method="post" onSubmit="return checkall();"
					action="<%=request.getContextPath()%>/ModifyPswServlet">
					<table width="70%" height="90" border="1" cellpadding="1"
						cellspacing="0" bordercolor="#CCCCCC" class="tableStyle1">
						<tr>
							<td width="28%" height="30" class="STYLE1">
								<div align="right">
									<span class="STYLE8">*</span>旧密码：
								</div>
							</td>
							<td width="33%">
								<div align="center">
									<input type="password" name="password" id="password"
										onBlur="checkpassword()" />
									<div id="pwd_info"></div>
								</div>
							</td>
							<td width="39%" class="STYLE1 tableStyle2"><span
								class="desc STYLE5"><span class="desc STYLE6">·</span>密码长度6～100位，字母区分大小写</span>
							</td>
						</tr>
						<tr>
							<td height="30" class="STYLE1">
								<div align="right">
									<span class="STYLE8">*</span>新密码：
								</div>
							</td>
							<td>
								<div align="center">
									<input type="password" name="newpassword" id="newpassword"
										onBlur="checknewpassword()" />
									<div id="newpwd_info"></div>
								</div>
							</td>
							<td class="STYLE1 tableStyle2"><span
								class="desc STYLE5"><span class="desc STYLE6">·</span>密码长度6～100位，字母区分大小写</span>
							</td>
						</tr>
						<tr>
							<td height="30" class="STYLE1">
								<div align="right">
									<span class="STYLE8">*</span>再输入一遍新密码：
								</div>
							</td>
							<td>
								<div align="center">
									<input type="password" name="cqpassword" id="cqpassword"
										onBlur="checkcpassword()" />
									<div id="pwdrepeat_info"></div>
								</div>
							</td>
							<td class="STYLE1 tableStyle2"><span
								class="desc STYLE5"><span class="desc STYLE6">·</span>密码长度6～100位，字母区分大小写</span>
							</td>
						</tr>

					</table>
					<p>
						<input type="hidden" name="uid" value=<%=user.getUid()%> /> <input
							type="submit" name="Submit" value="确认更改" class="buttonDefault"> <input
							type="reset" name="Reset" value="重 置" class="buttonDefault">
					</p>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>