<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>request1.jsp</title>
</head>
<body>
	<h1>ù��° ��û���</h1>
	<form method="post" action="./response1.jsp">
		<input type="text" name="x" value="24">
		<input type="hidden" name="name" value="goodee">
		<button type="submit">response1.jsp ��û</button>
	</form>
	
	<h1>�ι�° ��û���</h1>
	<a href="./response2.jsp?x=7&name=hello">response2 ������</a>
</body>
</html>