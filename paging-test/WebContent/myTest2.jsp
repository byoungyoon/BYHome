<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myTest2.jsp</title>
<%
	/*
		데이터 베이스 employees의 테이블인 employees를 추출한 것
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
		
		// 사용할 변수 선언
		int limitPage = 10;
		String search;
		String search2;
		int check;
		int lastPage;
		int currentPage;
		int index;
		
		// 쿼리문 작성과 사용할 것들 null 처리
		String sql = "";
		String sql2 = "";
		PreparedStatement stmt = null;
		PreparedStatement stmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		// 들어오는 값 null처리  오류가 발생할 경우 함수들 초기화
		try{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			lastPage = Integer.parseInt(request.getParameter("lastPage"));
			search = request.getParameter("search");
			search2 = request.getParameter("search2");
			check = Integer.parseInt(request.getParameter("check"));
			index = Integer.parseInt(request.getParameter("index"));
		}
		catch(Exception E){
			search = "";
			search2 = "";
			check = 0;
			lastPage = Integer.MAX_VALUE;
			currentPage = 1;
			index = 0;
		}
		
		// 페이지 수 조절, 페이지가 1페이지거나 마지막 페이지 일때 변화 없음
		if(request.getParameter("nextButton") != null) currentPage += 1;
		if(request.getParameter("beforeButton") != null) currentPage -= 1;
		if(request.getParameter("firstButton") != null) currentPage = 1;
		if(request.getParameter("lastButton") != null) currentPage = lastPage;
		if(currentPage < 1) currentPage = 1; 
		if(currentPage > lastPage) currentPage = lastPage;
		
		// 찾기 버튼을 눌렀을때 전체 페이지 수를 찾음
		// index설정
		if(request.getParameter("sub") != null){
			if(search != "" && search2 == ""){
				sql = "SELECT COUNT(*) as cot FROM employees WHERE first_name like ?";
				stmt = conn.prepareStatement(sql);
					
				stmt.setString(1, "%" + search + "%");
				rs = stmt.executeQuery();
					
				if(rs.next()){
					lastPage = rs.getInt("cot") / limitPage;
					if(rs.getInt("cot") % limitPage != 0) lastPage += 1;
				}
				
				index = 1;
			}
			else if(search == "" && search2 != ""){
				sql = "SELECT COUNT(*) as cot FROM employees WHERE last_name like ?";
				stmt = conn.prepareStatement(sql);
					
				stmt.setString(1, "%" + search2 + "%");
				rs = stmt.executeQuery();
					
				if(rs.next()){
					lastPage = rs.getInt("cot") / limitPage;
					if(rs.getInt("cot") % limitPage != 0) lastPage += 1;
				}
				
				index = 2;
			}
			else if(search != "" && search2 != ""){
				sql = "SELECT COUNT(*) as cot FROM employees WHERE first_name like ? or last_name like ?";
				stmt = conn.prepareStatement(sql);
					
				stmt.setString(1, "%" + search + "%");
				stmt.setString(2, "%" + search2 + "%");
				rs = stmt.executeQuery();
					
				if(rs.next()){
					lastPage = rs.getInt("cot") / limitPage;
					if(rs.getInt("cot") % limitPage != 0) lastPage += 1;
				}
				
				index = 3;
			}
			else{
				sql = "SELECT COUNT(*) as cot FROM employees WHERE first_name like ?";
				stmt = conn.prepareStatement(sql);
					
				stmt.setString(1, "%" + search + "%");
				rs = stmt.executeQuery();
					
				if(rs.next()){
					lastPage = rs.getInt("cot") / limitPage;
					if(rs.getInt("cot") % limitPage != 0) lastPage += 1;
				}
				
				index = 4;
			}
		}
			
		// 마찬가지로 찾기 버튼을 눌렀을 때 찾고 check라는 함수를 설정해 1로 설정(이유는 마지막페이지를 남기기 위해서)
		// count 값을 저장한 index 되로 switch
		if(request.getParameter("sub") != null || check == 1){
			check = 1;
			switch(index){
			case 1: sql2 = "SELECT * FROM employees WHERE first_name like ? LIMIT ?,?";
					stmt2 = conn.prepareStatement(sql2);
				
					stmt2.setString(1, "%" + search + "%");
					stmt2.setInt(2, (currentPage-1) * limitPage);
					stmt2.setInt(3, limitPage);
					
					rs2 = stmt2.executeQuery();
					break;
					
			case 2: sql2 = "SELECT * FROM employees WHERE last_name like ? LIMIT ?,?";
					stmt2 = conn.prepareStatement(sql2);
		
					stmt2.setString(1, "%" + search2 + "%");
					stmt2.setInt(2, (currentPage-1) * limitPage);
					stmt2.setInt(3, limitPage);
			
					rs2 = stmt2.executeQuery();
					break;
				
			case 3: sql2 = "SELECT * FROM employees WHERE (first_name like ?) or (last_name like ?) LIMIT ?,?";
					stmt2 = conn.prepareStatement(sql2);
		
					stmt2.setString(1, "%" + search + "%");
					stmt2.setString(2, "%" + search2 + "%");
					stmt2.setInt(3, (currentPage-1) * limitPage);
					stmt2.setInt(4, limitPage);
			
					rs2 = stmt2.executeQuery();
					break;
			
			default: sql2 = "SELECT * FROM employees LIMIT ?,?";
					stmt2 = conn.prepareStatement(sql2);
		
					stmt2.setInt(1, (currentPage-1) * limitPage);
					stmt2.setInt(2, limitPage);
			
					rs2 = stmt2.executeQuery();
					break;
			}
		}
	%>
	
	<h1>myTest2</h1>
	
	<form method="post" action="./myTest2.jsp">
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
					if(check == 1){
						while(rs2.next()){
						%>
							<tr>
								<td><%=rs2.getInt("emp_no") %></td>
								<td><%=rs2.getString("birth_date") %></td>
								<td><%=rs2.getString("first_name") %></td>
								<td><%=rs2.getString("last_name") %></td>
								<td><%=rs2.getString("gender") %></td>
								<td><%=rs2.getString("hire_date") %></td>
							</tr>
						<%
						}
					}
				%>
			</tbody>
		</table>
		<div>
			<input type="text" name="search" value=<%=search %>>
			<input type="text" name="search2" value=<%=search2 %>>
			<button type="submit" name="sub" value="true">찾기</button>
		</div>
		<div>
			<input type="hidden" name="currentPage" value="<%=currentPage %>">
			<input type="hidden" name="lastPage" value="<%=lastPage %>">
			<input type="hidden" name="check" value="<%=check %>">
			<input type="hidden" name="search" value="<%=search %>">
			<input type="hidden" name="index" value="<%=index %>">
			<button type="submit" name="beforeButton">이전</button>
			<button type="submit" name="nextButton">다음</button>
		</div>
		<div>
			<button type="submit" name="firstButton">처음</button>
			<button type="submit" name="lastButton">마지막</button>
		</div>
	</form>
</body>
</html>