<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");// 客户端网页我们控制为UTF-8
response.setCharacterEncoding("UTF-8");// 通知服务器发送数据时查阅的码表
response.setContentType("text/html;charset=UTF-8");// 通知浏览器以何种码表打开
String search=request.getParameter("search_context");
request.getSession().setAttribute("search", search) ;
%>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>