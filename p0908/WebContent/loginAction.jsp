<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "ao.MethodContainer2" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>loginAction.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MethodContainer2 mc2 = new MethodContainer2();
		
		boolean result = mc2.login(id,pw);
		if(result){
		%>
			<div>로그인 성공!</div>		
		<% 
		}
		else{
		%>
			<div>로그인 실패!</div>		
		<% 
		}
	%>
</body>
</html>