<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.wx.shopping.model.*,com.wx.shopping.dao.ShopDao,com.wx.shopping.dao.impl.ShopDaoImpl,java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到购物商城</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
<script src="js/editShop.js"></script>

</head>

<jsp:include page="islogin.jsp"></jsp:include>

<body class="bodybgcolor">
	<%
		User user = new User();
		user = (User) request.getSession().getAttribute("loginuser");

		String sid = request.getParameter("sid");

		ShopDao shopdao = new ShopDaoImpl();
		Shop shop = shopdao.selectBySid(sid);
		
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
						<td ><jsp:include page="head.jsp"></jsp:include>
						</td>
					</tr>
				</table>
				<br/><br/>

				<form method="post" onSubmit="return checkall();"
					action="<%=request.getContextPath()%>/EditShopServlet"
					enctype="multipart/form-data">
					<table width="80%" border="1" cellpadding="1" cellspacing="0"
						bordercolor="#CCCCCC" class="tableStyle1">

						<tr>
							<td colspan="3" align="center" class="STYLE1 tableHead">带星号的项不能为空</td>
						</tr>
						<tr>
							<td height="20" class="STYLE1">
								<div align="right">商店编号：</div>
							</td>
							<td>
								<div align="center">
									<%=shop.getSid()%>

								</div>
							</td>
							<td class="STYLE1 tableStyle2"></td>
						</tr>
						<tr>
							<td width="28%" height="20" class="STYLE1">
								<div align="right">
									<span class="STYLE8">*</span>商店名称：
								</div>
							</td>
							<td width="33%">
								<div align="center">
									<input type="text" name="shopname" id="shopname"  style="width:229px;"
										onBlur="checkshopname()" value=<%=shop.getS_name()%>>
									<div id="shop_info"></div>
								</div>
							</td>
							<td width="39%" class="STYLE1 tableStyle2"><span class="desc STYLE6">·</span><span
								class="STYLE5"><font size="2">商店名长度为1～100个字符</font></span></td>
						</tr>

						<tr>
							<td height="20" class="STYLE1">
								<div align="right">
									商店描述：
								</div>
							</td>
							<td>
								<div align="center">
									<textarea name="shop_desc" id="shop_desc" rows="3" cols="30"
										onblur="checkShopDesc()" ><%=shop.getS_desc()%></textarea>
									<div id="desc_info"></div>
								</div>
							</td>

							<td class="STYLE1 tableStyle2"><span class="desc STYLE6">·</span><span
								class="STYLE5"><font size="2">不超过300个字节</font></span></td>
						</tr>

						<tr>
							<td height="20" class="STYLE1">
								<div align="right">当前头像：</div>
							</td>
							<td>
								<div align="center">
									<img height="100" width="100" src=<%=shop.getS_pic_path()%>></img>
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
									<input type="file" name="shop_pic" />
								</div>
							</td>
							<td class="STYLE1 tableStyle2"></td>
						</tr>

						<tr>
							<td height="20" class="STYLE1">
								<div align="right">商店积分：</div>
							</td>
							<td>
								<div align="center">
									<%=df.format(shop.getS_credit())%>
								</div>
							</td>
							<td class="STYLE1 tableStyle2"></td>
						</tr>
						<tr>
							<td height="20" class="STYLE1">
								<div align="right">商店注册日期：</div>
							</td>
							<td>
								<div align="center">
									<%=shop.getS_reg_day()%>
								</div>
							</td>
							<td class="STYLE1 tableStyle2"></td>
						</tr>
					</table>
					<p>
						<input type="hidden" name="sid" value=<%=shop.getSid()%> /> <input
							type="submit" name="Submit" value="保存" class="buttonDefault"> <input
							type="reset" name="Reset" class="buttonDefault">
					</p>
				</form>
			</td>
		</tr>
	</table>

</body>
</html>