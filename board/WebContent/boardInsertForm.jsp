<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardInsertForm.jsp</title>
</head>
<body>
	<!-- title, content, witter  입력-->
	<%/*
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
							"jdbc:mariadb://127.0.0.1:3306/boarddb",
							"root",
							"java1004");
		
		String sql = "INSERT INTO board(title,content,writter) VALUES (?,?,NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);*/
		String title = "";
		String content = "";
		String witter = "";
	%>
	<form method="post" action="./boardInsertAction.jsp">
		<table border="1">
			<tr>	
				<th>제목<th>
				<td><input type="text" name="title" value="<%=title%>"><td>
			</tr>
			
			<tr>	
				<th>내용<th>
				<td><input type="text" name="content" value="<%=content%>"><td>
			</tr>
			
			<tr>	
				<th>글쓴이<th>
				<td><input type="text" name="witter" value="<%=witter%>"><td>
			</tr>
		</table>
		<div><button type="submit">작성</button></div>
	</form>
</body>
</html>