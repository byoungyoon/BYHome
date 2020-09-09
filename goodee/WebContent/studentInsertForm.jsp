<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구디 학생 정보 입력</title>
</head>
<body>
	<h1>구디 학생 정보 입력</h1>
	<!-- 목록 값 -->
	<table border="1">
		<tr>
			<th><a href="./index.jsp">구디 학생 메인 홈</a></th>
			<th><a href="./studentList.jsp">구디학생 리스트</a></th>
			<th><a href="./studentInsertForm.jsp">구디 학생 정보 입력</a></th>
		</tr>
	</table>
	
	<br>
	<!-- 데이터 입력 폼 -->
	<form method="post" action="./studentInsertAction.jsp">
		<table border="1">
			<tr>
				<td>이름 : </td>
				<td><input type="text" name="name"></td>
			</tr>
			
			<tr>
				<td>나이 : </td>
				<td><input type="text" name="age"></td>
			</tr>
			
			<tr>
				<td>성별 : </td>
				<td>
					<input type="radio" name="gender" value="남">남
					<input type="radio" name="gender" value="여">여
				</td>
			</tr>
			
			<tr>
				<td>주소 : </td>
				<td><input type="text" name="addr"></td>
			</tr>
			<tr>
				<td><button type="submit">정보 보내기</button></td>
			</tr>
		</table>
	</form>
</body>
</html>