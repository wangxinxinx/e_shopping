<%@page
	import="com.wx.shopping.dao.*,com.wx.shopping.dao.impl.*,com.wx.shopping.model.*,com.wx.shopping.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到购物商城</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
<script src="js/personalInfo.js"></script>
<script src="js/setday.js"></script>
</head>

<jsp:include page="islogin.jsp"></jsp:include>

<body class="bodybgcolor">
	<%
		String iid = request.getParameter("iid");
		IndentDao indentDao = new IndentDaoImpl();
		Indent indent = indentDao.selectByIid(iid);
		UserDao userDao = new UserDaoImpl();
		User user = userDao.selectByUid(indent.getUid());
		String sex = user.getSex();
	%>

	<table class="frameTable">
		<tr>
			<td></td>
		</tr>
		<tr>
			<td align="center">
				<table class="headTable">
					<tr>
						<td><jsp:include page="head.jsp"></jsp:include></td>
					</tr>
				</table> <br /> <br />
				<table width="50%" border="1" cellpadding="1" cellspacing="0"
					bordercolor="#CCCCCC" class="tableStyle1">

					<tr>
						<td colspan="2" height="20" align="center" class="STYLE1 tableHead">买家信息</td>
					</tr>
					<tr>
						<td height="20" class="STYLE1">
							<div align="right">用户编号：</div>
						</td>
						<td>
							<div align="center">
								<%=user.getUid()%>
							</div>
						</td>

					</tr>
					<tr>
						<td height="20" class="STYLE1">
							<div align="right">用户名：</div>
						</td>
						<td>
							<div align="center">
								<%=user.getUsername()%>
							</div>
						</td>

					</tr>
					<tr>
						<td width="28%" height="20" class="STYLE1">
							<div align="right">收件人姓名：</div>
						</td>
						<td width="33%">
							<div align="center">
								<%=user.getRecv_name()%>
							</div>
						</td>

					</tr>

					<tr>
						<td height="20" class="STYLE1">
							<div align="right">联系电话：</div>
						</td>
						<td>
							<div align="center">
								<%=user.getTel()%>
							</div>
						</td>
					</tr>
					<tr>
						<td height="20" class="STYLE1">
							<div align="right">邮政编码：</div>
						</td>
						<td>
							<div align="center">
								<%=user.getPostcode()%>
							</div>
						</td>
					</tr>
					<tr>
						<td height="20" class="STYLE1">
							<div align="right">收货地址：</div>
						</td>
						<td>
							<div align="center">
								<%=user.getAddress()%>
							</div>
						</td>

					</tr>
					<tr>
						<td height="20" class="STYLE1">
							<div align="right">头像：</div>
						</td>
						<td>
							<div align="center">
								<img height="100" width="100" src=<%=user.getU_pic_path()%>></img>
							</div>
						</td>
					</tr>
					<tr>
						<td height="20" class="STYLE1">
							<div align="right">电子邮箱：</div>
						</td>
						<td>
							<div align="center">
								<%=user.getEmail()%>

							</div>
						</td>
					</tr>
					<tr>
						<td height="20" class="STYLE1">
							<div align="right">性别：</div>
						</td>
						<td>
							<div align="center" class="STYLE1">
								<%
									if (sex != null && sex.equals("男")) {
								%>
								男
								<%
									} else if (sex != null && sex.equals("女")) {
								%>
								女
								<%
									}
								%>
							</div>
						</td>
					</tr>
					
					<tr>
						<td height="20" class="STYLE1">
							<div align="right">积分：</div>
						</td>
						<td>
							<div align="center">
								<%=user.getU_credit()%>
							</div>
						</td>				
					</tr>
				</table>
				<form method="post" 
					action="<%=request.getContextPath()%>/IndentSellerServlet?iid=<%=iid%>&op=发货">
					<p>
						<input type="hidden" name="uid" value=<%=user.getUid()%> /> <input
							type="submit" name="Submit" value="确认发货" class="buttonDefault"> 
					</p>
				</form>
			</td>
		</tr>
	</table>

</body>
</html>