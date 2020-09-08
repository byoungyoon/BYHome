<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "ao.MethodContainer2" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		MethodContainer2 mc2 = new MethodContainer2();
		char myGender = mc2.getGender();
		
	%>
	
	<div>
		<%
			if(myGender == 'M'){
			%>
				남자	
			<% 
			}
			else{
			%>
				여자
			<%
			}
		%>
	</div>
</body>
</html>