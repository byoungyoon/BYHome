<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>response2.jsp</title>
</head>
<body>
	<h1>response2.jsp</h1>
	<%
		String x = request.getParameter("x");
		String name = request.getParameter("name");
		
	%>
	<div><%=x %></div>
	<div><%=name %></div>
</body>
</html>