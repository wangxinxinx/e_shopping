<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到购物商城</title>

<script src="js/addProduct.js"></script>
<link rel="stylesheet" type="text/css" href="css/default.css">
</head>
<jsp:include page="islogin.jsp"></jsp:include>
<body class="bodybgcolor">
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
									<form action="<%=request.getContextPath()%>/AddProductServlet"
										method="post" onSubmit="return checkall(this);"
										autocomplete="off" enctype="multipart/form-data">
										<input type="hidden" name="sid" value=<%=request.getParameter("sid")%>>
										<fieldset>
											<div align="left">
												<legend>
													<span class="STYLE2"> 请填写商品名称</span>
												</legend>
											</div>
											<table width="663" class="blur">
												<tbody>
													<tr>
														<th width="144"><label for="username">
																<div align="right">
																	<span class="STYLE3"><span class="STYLE8">*</span>商品名：</span>
																</div>
														</label></th>
														<td width="233" class="input"><input class="text"
															type="text" id="pname" name="pname" onblur="checkpname()" />
															<div id="product_info"></div></td>
														<td width="270" class="desc " borderColor="#FFFFFF"><font
															size="2"> &middot;商品名长度为1～100个字符 </font></td>
													</tr>
												</tbody>
											</table>
										</fieldset>
										<fieldset>
											<div align="left">
												<legend>
													<span class="STYLE2"> 请填写商品的价格信息</span>
												</legend>
											</div>
											<table width="663" class="blur">
												<tbody>
													<tr>
														<th width="144"><label for="username">
																<div align="right">
																	<span class="STYLE3"><span class="STYLE8">*</span>商品价格：</span>
																</div>
														</label></th>
														<td width="233" class="input"><input class="text"
															type="text" id="price" name="price" onblur="checkprice()"
															onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" />
															<div id="price_info"></div></td>
														<td></td>
													</tr>
													<tr>
														<th class="STYLE3"><label>
																<div align="right">商品折扣：</div>
														</label></th>
														<td class="input"><input name="discount"
															id="discount" type="text" class="text"
															onblur="checkdiscount()" value="1"
															onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"/>
															<div id="discount_info"></div></td>
														<td width="270" class="desc " borderColor="#FFFFFF"><font
															size="2"> &middot;商品折扣为0~1之间的小数,默认为1 </font></td>
													</tr>
												</tbody>
											</table>
										</fieldset>
										<fieldset>
											<div align="left">
												<legend>
													<span class="STYLE2">请填写商品信息</span>
												</legend>
											</div>
											<table width="666" class="blur">
												<tbody>
													<tr>
														<th width="144"><label for="username">
																<div align="right">
																	<span class="STYLE3">商品头像：</span>
																</div>
														</label></th>
														<td width="233"><input type="file" name="user_pic">
														</td>
													</tr>
													<tr>
														<th width="146" class="STYLE3"><label for="password">
																<div align="right">
																	<span class="STYLE5"> 商品类别：</span>
																</div>
														</label></th>
														<td width="235" class="input"><select name="category"
															id="category">
																<option>服装</option>
																<option>家电</option>
																<option>家具</option>
																<option>数码</option>
																<option>汽车</option>
																<option>美食</option>
																<option>学习</option>
																<option selected>其它</option>
														</select></td>
														<td></td>
													</tr>
													<tr>
														<th class="STYLE3"><label for="cpassword">
																<div align="right">商品介绍：</div>
														</label></th>
														<td width="235" class="input"><textarea
																name="product_desc" id="product_desc" rows="5" cols="30"
																onblur="checkProductDesc()"></textarea>
															<div id="product_desc_info"></div></td>
															<td width="270" class="desc " borderColor="#FFFFFF"><font
															size="2"> &middot;不超过1000个字节 </font></td>
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
													value="确认添加" />

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