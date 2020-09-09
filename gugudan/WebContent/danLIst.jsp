<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>구구단 리스트</title>
</head>
<body>
	<h1>구구단 리스트</h1>
	<%
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
							"jdbc:mariadb://127.0.0.1:3306/gugudan",
							"root",
							"java1004");
		String sql = "SELECT * FROM dan";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
	%>
	<table border="1">
		<tr>
			<td><a href="./index.jsp">구구단 홈으로</a></td>
			<td><a href="./danLIst.jsp">구구단 리스트</a></td>
			<td><a href="./danInsertForm.jsp">구구단 입력</a></td>
		</tr>
	</table>
	
	<br>
	
	<table border="1">
		<thead>
			<tr>
				<th>dan_num</th>
				<th>dan_idx</th>
				<th>dan_val</th>
				<th>삭제</th>
			</tr>
		</thead>
		
		<tbody>
			<%
				while(rs.next()){
				%>
					<tr>
						<td><%=rs.getInt("dan_num") %></td>
						<td><%=rs.getInt("dan_idx") %></td>
						<td><%=rs.getInt("dan_val") %></td>
						<td><a href='./danDeleteAction.jsp?danNum=<%=rs.getInt("dan_num") %>&danIdx=<%=rs.getInt("dan_idx") %>'>삭제</a></td>
					</tr>
				<% 
				}
			%>
		</tbody>
	</table>
</body>
</html>







