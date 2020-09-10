<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList.jsp</title>
</head>
<body>
	<!--  select no, title, day from board order by no desc-->
	<h1>보드 리스트</h1>
	<!-- 목록 -->
	<table border="1">
		<tr>
			<th><a href="./index.jsp">메인 홈</a></th>
			<th><a href="./boardList.jsp">보드 리스트</a></th>
			<th><a href="./boardInsertForm.jsp">보드 입력란</a></th>
		</tr>
	</table>
	
	<br>
	
	<%
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
							"jdbc:mariadb://127.0.0.1:3306/boarddb",
							"root",
							"java1004");
		
		String sql = "SELECT no, title, witter FROM board ORDER BY no DESC LIMIT 0, 10";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
	%>
	
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
			</tr>
		</thead>
		
		<tbody>
		<%
			while(rs.next()){
			%>
				<tr>
					<td><%=rs.getInt("no") %></td>
					<td><a href="./boardOne.jsp?no=<%=rs.getInt("no")%>">
						<%=rs.getString("title") %>
					</a></td>
					<td><%=rs.getString("witter") %></td>
				</tr>
			<%
			}
		%>
		</tbody>
	</table>
</body>
</html>











