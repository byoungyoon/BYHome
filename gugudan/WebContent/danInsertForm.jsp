<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ �Է�</title>
</head>
<body>
	<h1>������ �Է�</h1>
	
	<table border="1">
		<tr>
			<td><a href="./index.jsp">������ Ȩ����</a></td>
			<td><a href="./danLIst.jsp">������ ����Ʈ</a></td>
			<td><a href="./danInsertForm.jsp">������ �Է�</a></td>
		</tr>
	</table>
	
	<br>
	
	<form method="post" action="./danInsertAction.jsp">
		<div>
			<input type="text" name="danNum">
			<span>*</span>
			<input type="text" name="danIdx">
			<button type="submit">������ �Է�</button>
		</div>
	</form>
</body>
</html>