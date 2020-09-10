<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardUpdateForm.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int no = Integer.parseInt(request.getParameter("no"));
		
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
							"jdbc:mariadb://127.0.0.1:3306/boarddb",
							"root",
							"java1004");
		
		String sql = "SELECT * FROM board WHERE no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, no);
		
		ResultSet rs = stmt.executeQuery();
		
		String title = "";
		String content = "";
		String witter = "";
		String day = "";
		
		if(rs.next()){
			title = rs.getString("title");
			content = rs.getString("content");
			witter = rs.getString("witter");
			day = rs.getString("day");
		}
		
	%>
	<form method="post" action="./boardUpdateAction.jsp">
		<table border="1">
			<tr>	
				<th>번호<th>
				<td><input type="hidden" name="no" value="<%=no %>"><%=no %><td>
			</tr>
			
			<tr>	
				<th>제목<th>
				<td><input type="text" name="title" value="<%=title%>"><td>
			</tr>
			
			<tr>	
				<th>내용<th>
				<td><textarea rows="10" cols="50" name="content" id="<%=content%>"></textarea><td>
			</tr>
			
			<tr>	
				<th>글쓴이<th>
				<td><input type="text" name="witter" value="<%=witter%>"><td>
			</tr>
		</table>
		<div><button type="submit">수정</button></div>
	</form>
</body>
</html>