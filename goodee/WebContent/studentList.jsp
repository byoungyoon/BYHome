<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구디 학생 리스트</title>
</head>
<body>
	<h1>구디 학생 리스트</h1>
	<!-- 목록 값 -->
	<table border="1">
		<tr>
			<th><a href="./index.jsp">구디 학생 메인 홈</a></th>
			<th><a href="./studentList.jsp">구디학생 리스트</a></th>
			<th><a href="./studentInsertForm.jsp">구디 학생 정보 입력</a></th>
		</tr>
	</table>
	
	<br>
	<!-- 메인 형태 -->
	<table border = "1">
		<thead>
			<tr>
				<th>no</th>
				<th>name</th>
				<th>age</th>
				<th>gender</th>
				<th>addr</th>
			</tr>
		</thead>
		<%
			// DB 불러옴(MariaDB)
			Class.forName("org.mariadb.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
							"jdbc:mariadb://127.0.0.1:3306/goodee",
							"root",
							"java1004");
			
			// SQL문법 SELECT를 통해  rs에 최종적으로 퀴리문 저장
			String sql = "SELECT * FROM student";
			PreparedStatement stmt = conn.prepareStatement(sql);		
			ResultSet rs = stmt.executeQuery();
		%>
		<tbody>
			<%
				// rs.next()값이 없어질때 false
				while(rs.next()){
				%>
					<tr>
						<td><%=rs.getInt("no") %></td>
						<td><%=rs.getString("name") %></td>
						<td><%=rs.getInt("age") %></td>
						<td><%=rs.getString("gender") %></td>
						<td><%=rs.getString("addr") %></td>
						<td><a href="./studentUpdate.jsp?no=<%=rs.getInt("no")%>">수정</a></td>
						<td><a href="./studentDelete.jsp?no=<%=rs.getInt("no")%>">삭제</a></td>
					</tr>
				<% 
				}
			%>
		</tbody>
	</table>
</body>
</html>






