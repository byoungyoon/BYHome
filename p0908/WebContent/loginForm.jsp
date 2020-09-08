<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 폼</h1>
	
	<form method="post" action="./loginAction.jsp">
		<table border="1">
			<tr>
				<td>id</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
			
				<td>password</td>
				<td><input type="text" name="pw"></td>
			</tr>
			<tr>
				<td><button type="submit">로그인</button></td>
			</tr>
		</table>
	</form>
</body>
</html>