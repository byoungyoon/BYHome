<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("EUC-KR");
		double answer;
		while(true){
		answer = Math.random()*12;
		if(answer > 2) break;
		}
	%>
	<%=(int)answer %>
</body>
</html>