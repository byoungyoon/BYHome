<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ddttList.jsp</title>
</head>
<body>
	<%
		Class.forName("org.mariadb.jdbc.Driver");
		System.out.println("1번 성공!");
		
		
		Connection conn = DriverManager.getConnection(
									"jdbc:mariadb://127.0.0.1:3306/employees",
									"root",
									"java1004"); // 주소 id 암호
		
		System.out.println(conn+"<--conn");
									
		PreparedStatement stmt = conn.prepareStatement(
				"select dept_name from departments");
		
		ResultSet rs = stmt.executeQuery();
		System.out.println(rs+"<--rs");
		
		while(rs.next()){
			String name = rs.getString("dept_name"); // 현재 커스에서 읽을 수 있는 데이터를 읽어온다
			%>
				<div><%=name %></div>
			<% 
		}
	%>
</body>
</html>