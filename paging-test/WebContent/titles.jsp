<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>titles.jsp</title>
<%
	/*
		데이터 베이스 employees의 테이블인titles를 추출한 것
		post방식으로 한번 만들어 보았다
	*/
%>
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
		
		// SQL 문법 적용 , (? ? --> 시작하는 행 , 적용되는 행) 
		String sql = "SELECT * FROM titles ORDER BY emp_no LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		String sql2 = "SELECT COUNT(*) as cot FROM titles";
		PreparedStatement stmt2 = conn.prepareStatement(sql2);
		
		ResultSet rs2 = stmt2.executeQuery();
		
		// 마지막페이지는 가장 큰 수로 초기화 그 후 제대로 적용
		int lastPage = Integer.MAX_VALUE;;
		int rowPerPage = 10;
		if(rs2.next()){
			lastPage = rs2.getInt("cot") / rowPerPage;
			if(rs2.getInt("cot") % rowPerPage != 0) lastPage += 1;
		}
		
		// currentPage는 페이지를 나타내는 변수이고 변수가 안넘어 왔을때 1페이지로 초기화
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) 
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		// 버튼이 눌러졌을때 옵션
		if(request.getParameter("after") != null) currentPage += 1;
		if(request.getParameter("before") != null) currentPage -= 1;
		if(request.getParameter("first") != null) currentPage = 1;
		if(request.getParameter("last") != null) currentPage = lastPage;
		
		// 각각 적용
		stmt.setInt(1, (currentPage-1)*rowPerPage);
		stmt.setInt(2, rowPerPage);
		
		ResultSet rs = stmt.executeQuery();
	%>
	
	<h1>사원 목록</h1>
	
	<table border="1">
		<tr>
			<th><a href="./departments.jsp">1번째 테이블</a></th>
			<th><a href="./employeesList.jsp">2번째 테이블</a></th>
			<th><a href="./dept_manager.jsp">3번째 테이블</a></th>
			<th><a href="./emplyees.jsp">4번째 테이블</a></th>
			<th><a href="./salaries.jsp">5번째 테이블</a></th>
			<th><a href="./titles.jsp">6번째 테이블</a></th>
		</tr>
	</table>
	
	<br>
	
	<form method="post" action="./titles.jsp">
		<table border="1">
			<thead>
				<tr>
					<th>emp_no</th>
					<th>title</th>
					<th>from_date</th>
					<th>to_date</th>
				</tr>
			</thead>
			<tbody>
				<%
					while(rs.next()){
					%>
						<tr>
							<td><%=rs.getInt("emp_no") %></td>
							<td><%=rs.getString("title") %></td>
							<td><%=rs.getString("from_date") %></td>
							<td><%=rs.getString("to_date") %></td>
						</tr>
					<%
					}
				%>
			</tbody>
		</table>
		<div>
			<input type="hidden" name="currentPage" value="<%=currentPage%>">
			<%
				// 첫 페이지와 마지막 페이지일때 이전, 다음 버튼 비활성화
				if(currentPage == 1){
				%>
					<button type="submit" name="before" value="true" disabled="disabled">이전</button> &nbsp;&nbsp;
					<%
					if(lastPage == 1){
					%>
						<button type="submit" name="after" value="true" disabled="disabled">다음</button> 
					<%
					}
					else{
					%>
						<button type="submit" name="after" value="true">다음</button> 
					<%
					}
					%>
				<% 
				}
				else if(currentPage == lastPage){
				%>
					<button type="submit" name="before" value="true">이전</button> &nbsp;&nbsp;
					<button type="submit" name="after" value="true" disabled="disabled">다음</button> 
				<%
				}
				else{
				%>
					<button type="submit" name="before" value="true">이전</button> &nbsp;&nbsp;
					<button type="submit" name="after" value="true">다음</button> 
				<%
				}
			
				if(currentPage != 1){
				%>
					<button type="submit" name="first" value="true">처음</button> &nbsp;&nbsp;
				<%
				}
			
				if(currentPage != lastPage){
				%>
					<button type="submit" name="last" value="true">마지막</button>&nbsp;&nbsp;
				<%
				}
			%>
		</div>
	</form>
</body>
</html>



