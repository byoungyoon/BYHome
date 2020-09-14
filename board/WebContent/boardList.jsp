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
		request.getParameter("UTF-8");
		
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
							"jdbc:mariadb://127.0.0.1:3306/boarddb",
							"root",
							"java1004");
		
		String sql = "SELECT * FROM board LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		String sql2 = "SELECT COUNT(*) as cot FROM board";
		PreparedStatement stmt2 = conn.prepareStatement(sql2);
		
		ResultSet rs2 = stmt2.executeQuery();
		
		int startPage = 1;
		int endPage = Integer.MAX_VALUE;
		int limitPage = 10;
		
		if(rs2.next()){
			endPage = rs2.getInt("cot") / limitPage;
			if(endPage % limitPage != 0) endPage += 1;
		}
		
		if(request.getParameter("startPage") != null){
			startPage = Integer.parseInt(request.getParameter("startPage"));
			if(startPage == 0) startPage++;
			if(startPage == endPage+1) startPage--;
		}
		
		
		stmt.setInt(1, (startPage-1)*limitPage);
		stmt.setInt(2, limitPage);
		
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
	<div>
		<%
			if(startPage != 1){
			%>
				<a href="boardList.jsp?startPage=<%=1%>">처음</a> &nbsp;&nbsp;
			<% 
			}
		%>
		<a href="boardList.jsp?startPage=<%=startPage-1%>">이전</a> &nbsp;&nbsp;
		<a href="boardList.jsp?startPage=<%=startPage+1%>">다음</a> &nbsp;&nbsp;
		<%
			if(startPage != endPage){
			%>
				<a href="boardList.jsp?startPage=<%=endPage%>">마지막</a> &nbsp;&nbsp;
			<% 
			}
		%>
	</div> 
</body>
</html>











