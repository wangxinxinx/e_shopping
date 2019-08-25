<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.wx.shopping.model.User"%>
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
		User user = new User();
		user = (User) request.getSession().getAttribute("loginuser");
		String sex = user.getSex();
		/*if (user == null) {
			response.sendRedirect("index.jsp");
		}*/
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
				</table>
					<form method="post" onSubmit="return checkall();"
						action="<%=request.getContextPath()%>/PersonalInfoServlet"
						enctype="multipart/form-data">
						<br/><br/>
						<table width="80%"  border="1" cellpadding="1"
							cellspacing="0" bordercolor="#CCCCCC" class="tableStyle1">
						
							<tr>
								<td colspan="3" align="center" class="STYLE1 tableHead" >带星号的项不能为空</td>
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
								<td class="STYLE1 tableStyle2"></td>
							</tr>
							<tr>
								<td width="28%" height="20" class="STYLE1">
									<div align="right">
										<span class="STYLE8">*</span>收件人姓名：
									</div>
								</td>
								<td width="33%">
									<div align="center">
										<input type="text" name="recvname" id="recvname"
											onBlur="checkrecvname()" value=<%=user.getRecv_name()%>>
										<div id="recvname_info"></div>
									</div>
								</td>
								<td width="39%" class="STYLE1 tableStyle2"></td>
							</tr>

							<tr>
								<td height="20" class="STYLE1">
									<div align="right">
										<span class="STYLE8">*</span>联系电话：
									</div>
								</td>
								<td>
									<div align="center">
										<input type="text" name="tel" id="tel"
											onBlur="checktelphone()" value=<%=user.getTel()%>>
										<div id="tel_info"></div>
									</div>
								</td>
								<td class="STYLE1 tableStyle2"><span
									class="desc STYLE6">·</span><span class="STYLE5">联系电话应为有效联系方式</span></td>
							</tr>
							<tr>
								<td height="20" class="STYLE1">
									<div align="right">
										<span class="STYLE8">*</span>邮政编码：
									</div>
								</td>
								<td>
									<div align="center">
										<input type="text" name="postcode" id="postcode"
											onBlur="checkpostcode()" value=<%=user.getPostcode()%>>
										<div id="postcode_info"></div>
									</div>
								</td>
								<td class="STYLE1 tableStyle2"><span
									class="desc STYLE6">·</span><span class="STYLE5">邮政编码为6位数字</span>
								</td>
							</tr>
							<tr>
								<td height="20" class="STYLE1">
									<div align="right">
										<span class="STYLE8">*</span>收货地址：
									</div>
								</td>
								<td>
									<div align="center">
										<input type="text" name="addr" id="addr" value="<%=user.getAddress()%>" onBlur="checkadd()">
										<div id="address_info"></div>
									</div>
								</td>
								<td class="STYLE1 tableStyle2"><span
									class="desc STYLE6">·</span><span class="STYLE5">请填写详细的收货住址</span>
								</td>

							</tr>
							<tr>
								<td height="20" class="STYLE1">
									<div align="right">当前头像：</div>
								</td>
								<td>
									<div align="center">
										<img height="100" width="100" src=<%=user.getU_pic_path() %>></img>
									</div>
								</td>
								<td class="STYLE1 tableStyle2"></td>
							</tr>
							
							<tr>
								<td height="20" class="STYLE1">
									<div align="right">修改头像：</div>
								</td>
								<td>
									<div align="center">
										<input type="file" name="user_pic" />
									</div>
								</td>
								<td class="STYLE1 tableStyle2"></td>
							</tr>
							<tr>
								<td height="20" class="STYLE1">
									<div align="right">电子邮箱：</div>
								</td>
								<td>
									<div align="center">
										<input type="text" name="email" id="email"
											<%if (user.getEmail() != null) {%> value="<%=user.getEmail()%>"
											<%}%> onBlur="checkemail()">
										<div id="email_info"></div>
									</div>
								</td>
								<td class="STYLE1 tableStyle2"></td>
							</tr>
							<tr>
								<td height="20" class="STYLE1">
									<div align="right">性别：</div>
								</td>
								<td>
									<div align="center" class="STYLE1">
										<input type="radio" name="sex" value="男"
											<%if (sex != null && sex.equals("男")) {%> checked="checked"
											<%}%>> 男 &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
											name="sex" value="女"
											<%if (sex != null && sex.equals("女")) {%> checked="checked"
											<%}%>>女
									</div>
								</td>
								<td class="STYLE1 tableStyle2"></td>
							</tr>
							<tr>
								<td height="20" class="STYLE1">
									<div align="right">生日：</div>
								</td>
								<td>
									<div align="center">
										<input type="text" name="birthday" id="birthday"
											onBlur="checkbirthday()" onclick="setday(this)"
											<%if (user.getBirthday() != null) {%>
											value=<%=user.getBirthday()%> <%}%> />
										<div id="birthday_info"></div>
									</div>
								</td>
								<td class="STYLE1 tableStyle2"></td>
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
								<td class="STYLE1 tableStyle2"></td>
							</tr>
							<tr>
								<td height="20" class="STYLE1">
									<div align="right">注册日期：</div>
								</td>
								<td>
									<div align="center">
										<%=user.getReg_day()%>
									</div>
								</td>
								<td class="STYLE1 tableStyle2"></td>
							</tr>
						</table>
						<p>
							<input type="hidden" name="uid" value=<%=user.getUid()%> /> <input
								type="submit" name="Submit" value="保存" class="buttonDefault"> <input
								type="reset" name="Reset" class="buttonDefault">
						</p>
					</form>
			</td>
		</tr>
	</table>

</body>
</html>