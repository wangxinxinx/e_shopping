<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.wx.shopping.model.User" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Horizontal Drop Down Menus</title>
<script type=text/javascript>
	/**
	 *菜单的构造,需要绑定到onload
	 */
	startList = function() {
		if (document.all && document.getElementById) {
			dropmenuRoot = document.getElementById("dropmenu");
			for (i = 0; i < dropmenuRoot.childNodes.length; i++) {
				node = dropmenuRoot.childNodes[i];
				if (node.nodeName == "LI") {
					node.onmouseover = function() {
						this.className += " over";
						//开始灌水
						for (j = 0; j < this.childNodes.length; j++) {
							if (this.childNodes[j].nodeName == "UL") {
								if (this.childNodes[j].childNodes[0].nodeName == "LI") {
									if (this.offsetLeft
											+ this.childNodes[j].childNodes.length
											* this.childNodes[j].childNodes[0].offsetWidth
											- dropmenuRoot.offsetLeft > dropmenuRoot.offsetWidth) {
										var len = this.childNodes[j].childNodes.length
												* this.childNodes[j].childNodes[0].offsetWidth; //菜单的长度
										(len > dropmenuRoot.offsetWidth) ? this.childNodes[j].style.width = 776 + "px"
												: this.childNodes[j].style.width = len
														+ "px"; //给ul设置宽度 如果子菜单比较多，大于容器的宽度，那么ul的宽度就是容器的宽度
										len = this.offsetLeft + len
												- dropmenuRoot.offsetLeft
												- dropmenuRoot.offsetWidth;
										(len > this.offsetLeft
												- dropmenuRoot.offsetLeft) ? this.childNodes[j].style.marginLeft = -(this.offsetLeft - dropmenuRoot.offsetLeft)
												: this.childNodes[j].style.marginLeft = -len
														+ "px";
									}
								}
							}
						}
					}
					//灌水完毕
					node.onmouseout = function() {
						this.className = this.className.replace(" over", "");
					}
				}
			}
		}
	}
	window.onload = startList;
</script>

<link rel="stylesheet" type="text/css" href="css/head.css">
</head>
<body>
	<%
		User user = new User();
		user = (User) request.getSession().getAttribute("loginuser");
	%>
	<div id="nav">
		<ul id="dropmenu">
			<li><a href="personalInfo.jsp" style="text-decoration: none;"><%=user.getUsername()%></a>
				<ul>
					<li><a href="personalInfo.jsp" style="text-decoration: none;">个人资料</a></li>
					<li><a href="modifyPsw.jsp" style="text-decoration: none;">修改密码</a></li>
					<li><a href="indentBuyer.jsp" style="text-decoration: none;">已买到的商品</a></li>
					<li><a href="myCart.jsp" style="text-decoration: none;">购物车</a></li>
					<li><a href="<%=request.getContextPath()%>/LoginOutServlet" style="text-decoration: none;">退出</a></li>
				</ul></li>
			<li><a href="#" style="text-decoration: none;">账户管理</a>
				<ul>
					<li><a href="moneyLeft.jsp" style="text-decoration: none;">我的余额</a></li>
					<li><a href="moneyTransfer.jsp" style="text-decoration: none;">转账</a></li>
					<li><a href="deposit.jsp" style="text-decoration: none;">充值</a></li>
					<li><a href="myBillWithPage.jsp" style="text-decoration: none;">我的账单</a></li>
				</ul></li>
			<li><a href="#" style="text-decoration: none;">卖家中心
					<ul>
						<li><a href="createShop.jsp" style="text-decoration: none;">我要开店</a></li>
						<li><a href="myShop.jsp" style="text-decoration: none;">我的商店</a></li>
						<li><a href="indentSeller.jsp" style="text-decoration: none;">订单管理</a></li>
					</ul></li>
			<li><a href="index.jsp" style="text-decoration: none;">商城首页 </li>
				
							
		</ul>
	</div>
</body>
</html>