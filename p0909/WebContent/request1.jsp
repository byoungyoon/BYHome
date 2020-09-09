<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>request1.jsp</title>
</head>
<body>
	<h1>첫번째 요청방식</h1>
	<form method="post" action="./response1.jsp">
		<input type="text" name="x" value="24">
		<input type="hidden" name="name" value="goodee">
		<button type="submit">response1.jsp 요청</button>
	</form>
	
	<h1>두번째 요청방식</h1>
	<a href="./response2.jsp?x=7&name=hello">response2 페이지</a>
</body>
</html>