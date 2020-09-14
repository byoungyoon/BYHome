<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employeeSearch.jsp</title>
</head>
<body>
	<%
		// 인코딩 방식
		request.setCharacterEncoding("UTF-8");
		
		// mariadb연결
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
									"jdbc:mariadb://127.0.0.1:3306/employees",
									"root",
									"java1004");
		
		// 받아오는 글자 null 처리
		String searchGender = "선택안함";
		String searchfirstName = "";
		if(request.getParameter("searchGender") != null) 
			searchGender = request.getParameter("searchGender");
		if(request.getParameter("searchfirstName") != null) 
			searchfirstName = request.getParameter("searchfirstName");
		
		int startPage = 1;
		int endPage = Integer.MAX_VALUE;
		int limitPage = 10;
		
		if(request.getParameter("startPage") != null){
			startPage = Integer.parseInt(request.getParameter("startPage"));
			if(startPage == 0) startPage = 1;
			if(startPage == endPage-1) startPage = endPage-2;
		}
		
		if(request.getParameter("endPage") != null){
			startPage = Integer.parseInt(request.getParameter("endPage"));
		}
		

		// 동적 SQL쿼리문 지정
		String sql = "";
		PreparedStatement stmt = null;
		String sql2 = "";
		PreparedStatement stmt2 = null;
		
		if(searchGender.equals("선택안함") && searchfirstName.equals("")){
			sql = "SELECT * FROM employees LIMIT ?,?";
			stmt = conn.prepareStatement(sql);
			sql2 = "SELECT COUNT(*) FROM employees";
			stmt2 = conn.prepareStatement(sql2);
			
			stmt.setInt(1, (startPage-1)*limitPage);
			stmt.setInt(2, limitPage);
		}
		else if(searchGender.equals("선택안함") && !searchfirstName.equals("")){
			sql = "SELECT * FROM employees WHERE first_name like ? LIMIT ?,?";
			stmt = conn.prepareStatement(sql);
			sql2 = "SELECT COUNT(*) FROM employees WHERE first_name like ?";
			stmt2 = conn.prepareStatement(sql2);
			
			stmt.setString(1, "%" + searchfirstName + "%");
			stmt.setInt(2, (startPage-1)*limitPage);
			stmt.setInt(3, limitPage);
			
			stmt2.setString(1, "%" + searchfirstName + "%");
		}
		else if(!searchGender.equals("선택안함") && searchfirstName.equals("")){
			sql = "SELECT * FROM employees WHERE gender=? LIMIT ?,?";
			stmt = conn.prepareStatement(sql);
			sql2 = "SELECT COUNT(*) FROM employees gender=?";
			stmt2 = conn.prepareStatement(sql2);
			
			stmt.setString(1, searchGender);
			stmt.setInt(2, (startPage-1)*limitPage);
			stmt.setInt(3, limitPage);
			
			stmt2.setString(1, searchGender);
		}
		else{
			sql = "SELECT * FROM employees WHERE gender=? and first_name like ? LIMIT ?,?";
			stmt = conn.prepareStatement(sql);
			sql2 = "SELECT COUNT(*) FROM employees gender=? and first_name like ?";
			stmt2 = conn.prepareStatement(sql2);
			
			stmt.setString(1, searchGender);
			stmt.setString(2, "%" + searchfirstName + "%");
			stmt.setInt(3, (startPage-1)*limitPage);
			stmt.setInt(4, limitPage);
			
			stmt2.setString(1, searchGender);
			stmt2.setString(2, "%" + searchfirstName + "%");
		}
		
		ResultSet rs2 = stmt2.executeQuery();
		if(rs2.next()){
			endPage = rs2.getInt("COUNT(*)") / limitPage;
			if(rs2.getInt("COUNT(*)") % limitPage == 0) endPage += 1;
		}
	%>
	
	<h1>test test</h1>
	
	<table border="1">
		<thead>
			<tr>
				<th>emp_no</th>
				<th>birth_date</th>
				<th>first_name</th>
				<th>last_name</th>
				<th>gender</th>
				<th>hire_date</th>
			</tr>
		</thead>
		
		<tbody>
			<%
				ResultSet rs = stmt.executeQuery();
				while(rs.next()){
				%>
					<tr>
						<td><%=rs.getInt("emp_no") %></td>
						<td><%=rs.getString("birth_date") %></td>
						<td><%=rs.getString("first_name") %></td>
						<td><%=rs.getString("last_name") %></td>
						<td><%=rs.getString("gender") %></td>
						<td><%=rs.getString("hire_date") %></td>
					</tr>
				<% 
				}
			%>
		</tbody>
	</table>
	
	<br>
	
	<form method="post" action="./employeeSearch.jsp">
		<div>
			gender :
			<select name="searchGender">
				<option value="선택안함">선택안함</option>
				<%
					if(searchGender.equals("M")){
					%>
						<option value="M" selected="selected">남</option>
						<option value="F">여</option>
					<%
					}
					else if(searchGender.equals("F")){
					%>
						<option value="M">남</option>
						<option value="F" selected="selected">여</option>
					<% 
					}
					else{
					%>
						<option value="M">남</option>
						<option value="F">여</option>
					<% 
					}
				%>
			</select>
			
			first_name;
			<input type="text" name="searchfirstName" value="<%=searchfirstName%>">
			
		</div>
		
			<br>
			<input type="hidden" name = "startPage" value="<%=startPage%>">
			<input type="hidden" name = "endPage" value="<%=endPage%>">
			<button type="submit">정렬</button>
	</form>
			<a href="./employeeSearch.jsp?startPage=<%=1%>">처음</a>
			<a href="./employeeSearch.jsp?startPage=<%=startPage-1%>">이전</a>
			<a href="./employeeSearch.jsp?startPage=<%=startPage+1%>">다음</a>
			<a href="./employeeSearch.jsp?startPage=<%=endPage+1%>">마지막</a>
</body>
</html>






