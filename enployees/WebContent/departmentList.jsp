<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>departmentList.jsp</title>
</head>
<body>
	<div>
		<table border="1">
			<tr>
				<td><a href="./index.jsp">홈으로</a></td>
				<td><a href="./departmentList.jsp">departments 테이블 목록</a></td>
				<td><a href="./deptEmpList.jsp">dept_emp 테이블 목록</a></td>
				<td><a href="./deptManagerList.jsp">dept_manager</a></td>
				<td><a href="./emplayeesList.jsp">employees</a></td>
				<td><a href="./salariesList.jsp">salaries</a></td>
				<td><a href="titlesList.jsp">titles</a></td>
			</tr>
		</table>
	</div>
	
	<h1>departments 테이블 목록</h1>
	<%
		Class.forName("org.mariadb.jdbc.Driver");
	
		Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/employees",
				"root",
				"java1004"); // 주소 id 암호
				
		String sql = "SELECT dept_no, dept_name FROM departments ORDER BY dept_no DESC";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
		
	%>
		<table border="1">
			<thead>
				<tr>
					<th>dept_no</th>
					<th>dept_name</th>
				</tr>
			</thead>
			
			<tbody>
			<%
				while(rs.next()){
			%>
				<tr>
					<td><%=rs.getString("dept_no") %></td>
					<td><%=rs.getString("dept_name") %></td>
				</tr>
			<% 
				}
			%>
			</tbody>
		</table>	
	<%
	
	%>
</body>
</html>





