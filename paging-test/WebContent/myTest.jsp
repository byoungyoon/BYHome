<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myTest.jsp</title>
<%
	/*
		데이터 베이스 employees의 테이블인 departments를 추출한 것
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
		int check;
		int lastPage;
		int currentPage;
		
		// 쿼리문 작성과 사용할 것들 초기화
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
			check = Integer.parseInt(request.getParameter("check"));
		}
		catch(Exception E){
			search = "";
			check = 0;
			lastPage = Integer.MAX_VALUE;
			currentPage = 1;
		}
		
		// 페이지 수 조절, 페이지가 1페이지거나 마지막 페이지 일때 변화 없음
		if(request.getParameter("nextButton") != null) currentPage += 1;
		if(request.getParameter("beforeButton") != null) currentPage -= 1;
		if(currentPage < 1) currentPage = 1; 
		if(currentPage > lastPage) currentPage = lastPage;
		
		// 찾기 버튼을 눌렀을때 전체 페이지 수를 찾음
		if(request.getParameter("sub") != null){
			sql = "SELECT COUNT(*) as cot FROM departments WHERE dept_name like ?";
			stmt = conn.prepareStatement(sql);
				
			stmt.setString(1, "%" + search + "%");
			rs = stmt.executeQuery();
				
			if(rs.next()){
				lastPage = rs.getInt("cot") / limitPage;
				if(rs.getInt("cot") % limitPage != 0) lastPage += 1;
			}
		}
			
		// 마찬가지로 찾기 버튼을 눌렀을 때 찾고 check라는 함수를 설정해 1로 섲렁(이유는 마지막페이지를 남기기 위해서)
		if(request.getParameter("sub") != null || check == 1){
			check = 1;
			sql2 = "SELECT * FROM departments WHERE dept_name like ? LIMIT ?,?";
			stmt2 = conn.prepareStatement(sql2);
				
			stmt2.setString(1, "%" + search + "%");
			stmt2.setInt(2, (currentPage-1) * limitPage);
			stmt2.setInt(3, limitPage);
				
			rs2 = stmt2.executeQuery();
		}
	%>
	
	<h1>myTest</h1>
	
	<form method="post" action="./myTest.jsp">
		<table border="1">
			<thead>
				<tr>
					<th>dept_no</th>
					<th>dept_name</th>
				</tr>
			</thead>
			<tbody>
				<%
					if(check == 1){
						while(rs2.next()){
						%>
							<tr>
								<td><%=rs2.getString("dept_no") %></td>
								<td><%=rs2.getString("dept_name") %></td>
							</tr>
						<%
						}
					}
				%>
			</tbody>
		</table>
		<div>
			<input type="text" name="search" value=<%=search %>>
			<button type="submit" name="sub" value="true">찾기</button>
		</div>
		<div>
			<input type="hidden" name="currentPage" value="<%=currentPage %>">
			<input type="hidden" name="lastPage" value="<%=lastPage %>">
			<input type="hidden" name="check" value="<%=check %>">
			<input type="hidden" name="search" value="<%=search %>">
			<button type="submit" name="beforeButton">이전</button>
			<button type="submit" name="nextButton">다음</button>
		</div>
	</form>
</body>
</html>