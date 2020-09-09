<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>response1.jsp</title>
</head>
<body>
	<h1>response1.jsp 페이지 입니다.</h1>
	<%
		request.setCharacterEncoding("euc-kr");
		String x = request.getParameter("x");
		int intx = Integer.parseInt(x);
		
		String name = request.getParameter("name");
	%>
	<div><%=intx %></div>
	<div><%=name %></div>
</body>
</html>