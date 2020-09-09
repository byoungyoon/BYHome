<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studentUpdate.jsp</title>
</head>
<body>
	<form method="post" action="./studentUpdateAction.jsp">
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
				int no = Integer.parseInt(request.getParameter("no"));
				// DB 불러옴(MariaDB)
				Class.forName("org.mariadb.jdbc.Driver");
				Connection conn = DriverManager.getConnection(
								"jdbc:mariadb://127.0.0.1:3306/goodee",
								"root",
								"java1004");
				
				// SQL문법 SELECT를 통해  rs에 최종적으로 퀴리문 저장
				String sql = "SELECT * FROM student WHERE no = ?";
				PreparedStatement stmt = conn.prepareStatement(sql);		
				stmt.setInt(1, no);
				ResultSet rs = stmt.executeQuery();
			%>
			<tbody>
				<%
					// rs.next()값이 없어질때 false
					if(rs.next()){
					%>
						<tr>
							<td><input type="hidden" name = "no" value = "<%=no %>"><%=no %></td>
							<td><input type="text" name = "name" value = "<%=rs.getString("name") %>"></td>
							<td><input type="text" name = "age" value = "<%=rs.getInt("age") %>"></td>
							<td>
							<%
								if(rs.getString("gender") == "남"){
								%>
									<input type="radio" name = "gender" value = "남 " checked="checked">남
									<input type="radio" name = "gender" value = "여 ">여
								<% 
								}
								else{
								%>
									<input type="radio" name = "gender" value = "남 ">남
									<input type="radio" name = "gender" value = "여 " checked="checked">여
								<% 
								}
							%>
							</td>
							<td><input type="text" name = "addr" value = "<%=rs.getString("addr") %>"></td>
						</tr>
					<% 
					}
				%>
				<tr>
					<td><button type="submit">수정</button></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>