<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>转账失败</title>
<script type="text/javascript">
	function redir() {
		window.location.href = "moneyTransfer.jsp";
	}
	setTimeout("redir()", 5000);
</script>
<link rel="stylesheet" type="text/css" href="css/default.css">
</head>
<body class="bodybgcolor">
	<div align="center">
		<font size="2" color="#0000ff"> 转账失败！<br/>对方账号不存在<br/>五秒后将自动跳转回转账页面<br/> <br/>
		</font>
		<font size="2"><a href="moneyTransfer.jsp">点击直接跳转到转账页面</a></font> <br/> 
		<font size="2"><a href="index.jsp">点击直接跳转到商城首页</a></font> <br/> 
	</div>
</body>
</html>