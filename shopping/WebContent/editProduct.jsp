<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.wx.shopping.model.*,java.text.DecimalFormat,com.wx.shopping.dao.ProductDao,com.wx.shopping.dao.impl.ProductDaoImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到购物商城</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
<script src="js/editProduct.js"></script>

</head>

<jsp:include page="islogin.jsp"></jsp:include>

<body class="bodybgcolor">
	<%
		User user = new User();
		user = (User) request.getSession().getAttribute("loginuser");

		String sid = request.getParameter("sid");
		String pid = request.getParameter("pid");

		ProductDao productdao = new ProductDaoImpl();
		Product product = productdao.selectByPid(pid);

		DecimalFormat df = new DecimalFormat("0.00"); //0.00表示小数点后的2位小数
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
				 <br /><br />
				<form method="post" onSubmit="return checkall();"
					action="<%=request.getContextPath()%>/EditProductServlet"
					enctype="multipart/form-data">
					<table width="80%" border="1" cellpadding="1" cellspacing="0"
						bordercolor="#CCCCCC" class="tableStyle1">

						<tr>
							<td colspan="3" align="center" class="STYLE1 tableHead">带星号的项不能为空</td>
						</tr>
						<tr>
							<td height="20" class="STYLE1">
								<div align="right">商品编号：</div>
							</td>
							<td>
								<div align="center">
									<%=product.getPid()%>

								</div>
							</td>
							<td class="STYLE1 tableStyle2"></td>
						</tr>
						<tr>
							<td width="28%" height="20" class="STYLE1">
								<div align="right">
									<span class="STYLE8">*</span>商品名称：
								</div>
							</td>
							<td width="33%">
								<div align="center">
									<input type="text" name="pname" id="pname"
										style="width: 229px;" onBlur="checkpname()"
										value=<%=product.getP_name()%>>
									<div id="product_info"></div>
								</div>
							</td>
							<td width="39%" class="STYLE1 tableStyle2"><span
								class="desc STYLE6">·</span><span class="STYLE5"><font
									size="2">商品名长度为1～100个字符</font></span></td>
						</tr>
						<tr>
							<td height="20" class="STYLE1">
								<div align="right">商品类别：</div>
							</td>
							<td>
								<div align="center">
									<select name="category" id="category" style="width: 80px;">
										<option <%if (product.getCategory().equals("服装")) {%> selected
											<%}%>>服装</option>
										<option <%if (product.getCategory().equals("家电")) {%> selected
											<%}%>>家电</option>
										<option <%if (product.getCategory().equals("家具")) {%> selected
											<%}%>>家具</option>
										<option <%if (product.getCategory().equals("数码")) {%> selected
											<%}%>>数码</option>
										<option <%if (product.getCategory().equals("汽车")) {%> selected
											<%}%>>汽车</option>
										<option <%if (product.getCategory().equals("美食")) {%> selected
											<%}%>>美食</option>
										<option <%if (product.getCategory().equals("学习")) {%> selected
											<%}%>>学习</option>
										<option <%if (product.getCategory().equals("其它")) {%> selected
											<%}%>>其它</option>
									</select>
								</div>
							</td>


						</tr>

						<tr>
							<td height="20" class="STYLE1">
								<div align="right">商品介绍：</div>
							</td>
							<td>
								<div align="center">
									<textarea name="product_desc" id="product_desc" rows="3"
										cols="30" onblur="checkProductDesc()"><%=product.getP_desc()%></textarea>
									<div id="product_desc_info"></div>
								</div>
							</td>

							<td class="STYLE1 tableStyle2"><span class="desc STYLE6">·</span><span
								class="STYLE5"><font size="2">不超过1000个字节</font></span></td>
						</tr>
						<tr>
							<td width="28%" height="20" class="STYLE1">
								<div align="right">
									<span class="STYLE8">*</span>商品价格：
								</div>
							</td>
							<td width="33%">
								<div align="center">
									<input type="text" name="price" id="price"
										style="width: 229px;" onBlur="checkprice()"
										onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
										value=<%=df.format(product.getPrice())%>>
									<div id="price_info"></div>
								</div>
							</td>

						</tr>
						<tr>
							<td width="28%" height="20" class="STYLE1">
								<div align="right">商品折扣：</div>
							</td>
							<td width="33%">
								<div align="center">
									<input type="text" name="discount" id="discount"
										style="width: 229px;" onBlur="checkdiscount()"
										value=<%=df.format(product.getDiscount())%>
										onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')">
									<div id="discount_info"></div>
								</div>
							</td>
							<td width="39%" class="STYLE1 tableStyle2"><span
								class="desc STYLE6">·</span><span class="STYLE5"><font
									size="2">商品折扣为0~1之间的小数,默认为1</font></span></td>
						</tr>

						<tr>
							<td height="20" class="STYLE1">
								<div align="right">当前头像：</div>
							</td>
							<td>
								<div align="center">
									<img height="100" width="100" src=<%=product.getP_pic_path()%>></img>
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
									<input type="file" name="product_pic" />
								</div>
							</td>
							<td class="STYLE1 tableStyle2"></td>
						</tr>

						<tr>
							<td height="20" class="STYLE1">
								<div align="right">创建日期：</div>
							</td>
							<td>
								<div align="center">
									<%=product.getCreate_day()%>
								</div>
							</td>
							<td class="STYLE1 tableStyle2"></td>
						</tr>
						<tr>
							<td height="20" class="STYLE1">
								<div align="right">销量：</div>
							</td>
							<td>
								<div align="center">
									<%=product.getSalses()%>
								</div>
							</td>
							<td class="STYLE1 tableStyle2"></td>
						</tr>

						<tr>
							<td height="20" class="STYLE1">
								<div align="right">商品信誉：</div>
							</td>
							<td>
								<div align="center">
									<%=product.getP_credit()%>
								</div>
							</td>
							<td class="STYLE1 tableStyle2"></td>
						</tr>


					</table>
					<p>
						<input type="hidden" name="pid" value=<%=product.getPid()%> /> <input
							type="hidden" name="sid" value=<%=sid%> /> <input type="submit"
							name="Submit" value="保存" class="buttonDefault"> <input type="reset"
							name="Reset" class="buttonDefault">
					</p>
				</form>
			</td>
		</tr>
	</table>

</body>
</html>