<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th	{
		width: 50px;
	}
</style>
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
		
		String sql = "SELECT title, content, witter, day FROM board WHERE no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1,no);
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
	<h1>게시글 보기</h1>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<td><%=no %></td>
		</tr>
		
		<tr>
			<th>제목</th>
			<td><%=title %></td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td><%=content %></td>
		</tr>
		
		<tr>
			<th>글쓴이</th>
			<td><%=witter %></td>
		</tr>
		
		<tr>
			<th>날짜</th>
			<td><%=day %></td>
		</tr>
	</table>
	
	<br>
	
	<a href="./boardList.jsp">목록</a> &nbsp;
	<a href="./boardUpdateForm.jsp?no=<%=no%>">수정</a> &nbsp;
	<a href="./boardDeleteAction.jsp?no=<%=no%>">삭제</a>
	
	<!-- commentList -->
	<% 
		String sql2 = "SELECT board_no, comment_no, comment_content, comment_writer FROM comment WHERE board_no = ?";
		PreparedStatement stmt2 = conn.prepareStatement(sql2);
		stmt2.setInt(1, no);
		ResultSet rs2 = stmt2.executeQuery();
	%>
	
	<h2>댓글 목록</h2>
	<table border="1">
	<%
		while(rs2.next()){
		%>
			<tr>
				<td><%=rs2.getInt("comment_content") %></td>
				<td><%=rs2.getInt("comment_writer") %></td>
				<td><a href='./commentDeleteAction.jsp?commentNo=<%=rs2.getInt("comment_no")%>'>
					삭제
				</a></td>
			</tr>
		<% 
		}
	%>
	</table>
	<!-- commentInsertForm -->
	<form method="post" Action="./commentInsertAction.jsp">
		<table>
			<tr>
				<td>
					<input type="hidden" name="boardNo" value=<%=no %>>
					<textarea rows="2" cols="50" name = commentContent></textarea>
					<input type="text" name="commentWriter">
				</td>
				<td>
					<button type="submit">댓글</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>























