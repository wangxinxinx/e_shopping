<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.wx.shopping.model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到购物商城</title>

<script laguage="text/javascript" src="js/createShop.js"></script>
<link rel="stylesheet" type="text/css" href="css/default.css">
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
						<td><jsp:include page="head.jsp"></jsp:include></td>
					</tr>
				</table>
				<br/><br/>
				<table width="70%" height="295" border="0" align="center"
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
									<form action="<%=request.getContextPath()%>/CreateShopServlet"
										method="post" onSubmit="return checkall(this);"
										autocomplete="off" enctype="multipart/form-data">
										<input type="hidden" name="uid" value=<%=user.getUid()%>>
										<fieldset>
											<div align="left">
												<legend>
													<span class="STYLE2"> 请填写商店名称</span>
												</legend>
											</div>
											<table width="663" class="blur">
												<tbody>
													<tr>
														<th width="144"><label for="username">
																<div align="right">
																	<span class="STYLE3"><span class="STYLE8">*</span>商店名：</span>
																</div>
														</label></th>
														<td width="233" class="input"><input class="text"
															type="text" id="shopname" name="shopname"
															onblur="checkshopname()" />
															<div id="shop_info">
																<td width="270" class="desc " borderColor="#FFFFFF"><font
																	size="2"> &middot;商店名长度为1～100个字符 </font></td>
													</tr>
												</tbody>
											</table>
										</fieldset>

										<fieldset>
											<div align="left">
												<legend>
													<span class="STYLE2"> 请填写商店信息</span>
												</legend>
											</div>
											<table width="666" class="blur">
												<tbody>

													<tr>
														<th width="146" class="STYLE3"><label for="password">
																<div align="right">
																	<span class="STYLE5"> 商店描述：</span>
																</div>
														</label></th>
														<td width="235" class="input"><textarea
																name="shop_desc" id="shop_desc" rows="5" cols="25"
																onblur="checkShopDesc()"></textarea>
															<div id="desc_info"></div></td>
														<td width="269" rowspan="2" class="desc"><font
															size="2">不超过300个字节</font></td>
													</tr>
													<tr>
														<th width="144"><label for="username">
																<div align="right">
																	<span class="STYLE3">商店头像：</span>
																</div>
														</label></th>
														<td width="233"><input type="file" name="shop_pic">
														</td>
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

												<input name="confirm" type="submit" id="confirm"
													value="创建商店" class="buttonDefault"/> <span></span>
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
			</td>
		</tr>
	</table>
</body>
</html>