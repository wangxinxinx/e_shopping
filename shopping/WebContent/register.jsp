<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到购物商城</title>

<script laguage="text/javascript" src="js/register.js"></script>
<script src="js/setday.js"></script>
<link rel="stylesheet" type="text/css" href="css/default.css">
</head>
<body class="bodybgcolor">
	<table width="71%" height="295" border="0" align="center"
		cellpadding="1" cellspacing="0">
		<tr>
			<td></td>
		</tr>
		<tr>
			<td align="center" class="tableStyle1">
				<div id="content">
					<div id="container">
						<div class="topArc">
							<span class="left"><span class="right"></span> </span>
						</div>
						<p class="declare">
							请注意：带有 <span class="STYLE3"><span class="STYLE8">*</span>
							</span>的项目必须填写。
						</p>
						<form action="<%=request.getContextPath()%>/RegisterServlet"
							method="post" onSubmit="return checkall(this);"
							autocomplete="off" enctype="multipart/form-data">
							<fieldset>
								<div align="left">
									<legend>
										<span class="STYLE2"> 请填写您的用户名</span>
									</legend>
								</div>
								<table width="663" class="blur">
									<tbody>
										<tr>
											<th width="144"><label for="username">
													<div align="right">
														<span class="STYLE3"><span class="STYLE8">*</span>用户名：</span>
													</div>
											</label></th>
											<td width="233" class="input"><input class="text"
												type="text" id="regusername" name="regusername"
												onblur="checkusername()" />
												<div id="user_info"></div></td>
											<td width="270" class="desc " borderColor="#FFFFFF"><font
												size="2"> &middot;用户名长度为1～100个字符 </font></td>
										</tr>
									</tbody>
								</table>
							</fieldset>

							<fieldset>
								<div align="left">
									<legend>
										<span class="STYLE2"> 请填写安全设置</span><span>(&nbsp;以下信息对保护您的帐号安全极为重要，请您慎重填写并牢记&nbsp;)</span>
									</legend>
								</div>
								<table width="666" class="blur">
									<tbody>
										<tr>
											<th width="146" class="STYLE3"><label for="password">
													<div align="right">
														<span class="STYLE8">*</span><span class="STYLE5">
															登录密码：</span>
													</div>
											</label></th>
											<td width="235" class="input"><input class="text"
												type="password" id="regpassword" name="regpassword"
												onblur="checkpassword()" />
												<div id="pwd_info"></div></td>
											<td width="269" rowspan="2" class="desc"><font size="2">密码长度6～100位，字母区分大小写</font>
											</td>
										</tr>
										<tr>
											<th class="STYLE3"><label for="cpassword">
													<div align="right">
														<span class="STYLE8">*</span>重复登录密码：
													</div>
											</label></th>
											<td class="input"><input class="text" id="cpassword"
												type="password" name="cpassword" onblur="checkcpassword()" />
												<div id="pwdrepeat_info"></div> <span></span></td>
										</tr>
									</tbody>
								</table>
							</fieldset>
							<fieldset>
								<div align="left">
									<legend>
										<span class="STYLE2"> 请填写您的收货信息</span><span>( 以下信息对您能否顺利收到货物十分重要，请您如实填写 )</span>
									</legend>
								</div>
								<table width="663" class="blur">
									<tbody>
										<tr>
											<th width="144"><label for="username">
													<div align="right">
														<span class="STYLE3"><span class="STYLE8">*</span>收件人姓名：</span>
													</div>
											</label></th>
											<td width="233" class="input"><input class="text"
												type="text" id="recvname" name="recvname"
												onblur="checkrecvname()" />
												<div id="recvname_info"></div></td>
											<td></td>
										</tr>
										<tr>
											<th class="STYLE3"><label>
													<div align="right">
														<span class="STYLE8">*</span>联系电话：
													</div>
											</label></th>
											<td class="input"><LABEL id=female> <input
													name="regtel" id="regtel" type="text" class="text"
													onblur="checktelphone()" />
													<div id="tel_info"></div>
											</LABEL></td>
										</tr>
										<tr>
											<th><label for="firstname" class="STYLE3">
													<div align="right">
														<span class="STYLE8">*</span>邮政编码：
													</div>
											</label></th>
											<td class="input"><input class="text" id="regpostcode"
												name="regpostcode" onblur="checkpostcode()" />
												<div id="postcode_info"></div> <span></span></td>
										</tr>

										<tr>
											<th><label for="firstname" class="STYLE3">
													<div align="right">
														<span class="STYLE8">*</span>收货地址：
													</div>
											</label></th>
											<td class="input"><textarea rows="4" cols="40"
													id="regaddr" name="regaddr" onblur="checkadd()"></textarea>
												<div id="address_info"></div> <span></span></td>
										</tr>

									</tbody>
								</table>
							</fieldset>
							<fieldset>
								<div align="left">
									<legend>
										<span class="STYLE2"> 请填写您的个人资料</span><span>( 以下信息我们会严格保密，请您放心填写)</span>
									</legend>
								</div>

								<table width="663" class="blur">
									<tbody>
										<tr>
											<th width="144"><label for="username">
													<div align="right">
														<span class="STYLE3">头像：</span>
													</div>
											</label></th>
											<td width="233"><input type="file" name="user_pic">
											</td>
										</tr>
										<tr>
											<th width="148" valign="top"><label for="mail">
													<div align="right">
														<span class="STYLE3">电子邮箱</span>：
													</div>
											</label></th>
											<td width="238" valign="top" class="input"><input
												class="text" id="regemail" name="regemail"
												onblur="checkemail()" />
												<div id="email_info"></div> <span></span></td>
											<td></td>
										</tr>
										<tr>
											<th width="150" class="STYLE3"><label>
													<div align="right">性别：</div>
											</label></th>
											<td width="234" class="input"><input id="regsex"
												title="性别" type="radio" checked="checked" value="男"
												name="regsex" /> 男 &nbsp;&nbsp;&nbsp;&nbsp; <input
												id="regsex" type="radio" value="女" name="regsex" /> 女</td>
											<td width="270" class="desc"></td>
										</tr>
										<tr>
											<th class="STYLE3"><label for="answer">
													<div align="right">生日：</div>
											</label></th>
											<td width="232" class="input"><INPUT id="regbirthday"
												onclick="setday(this)" name="regbirthday" runat="server"
												onblur="checkbirthday()" />
												<div id="birthday_info"></div> <span></span></td>
											<span></span>
											<td width="2"></td>
										</tr>
									</tbody>
								</table>
							</fieldset>
							<table class="blur">
								<tbody>
									<tr>
										<th><label for="usercheckcode"></label></th>
										<td class="input">&nbsp;</td>
										<td></td>
									</tr>
									<tr>
										<th><span class="STYLE8">*</span></th>
										<td><input id="agree" title="是否同意服务条款" type="checkbox"
											checked="checked" id="agree" name="agree"
											onclick="checkagree()" /> 我已看过并同意《 <a
											href="termsOfService.jsp">购物商城服务条款</a>》 <br /> <font
											size="2"><span></span> </font></td>
									</tr>
									<tr></tr>
								</tbody>
							</table>
							<div id="btn">
								<div align="center">
									<input name="confirm" type="submit" id="confirm" value="注册帐号" />
									<a href="index.jsp">购物商城首页</a><span></span>
								</div>
							</div>
						</form>
						<div class="bottomArc">
							<span class="left"><span class="right"></span> </span>
						</div>
					</div>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>