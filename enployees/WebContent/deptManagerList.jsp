<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>deptManagerList.jsp</title>
</head>
<body>
	<!-- 목록 -->
	<div>
		<table border="1">
			<tr>
				<td><a href="./index.jsp">홈으로</a></td>
				<td><a href="./departmentList.jsp">departments 테이블 목록</a></td>
				<td><a href="./deptEmpList.jsp">dept_emp 테이블 목록</a></td>
				<td><a href="./deptManagerList.jsp">dept_manager</a></td>
				<td><a href="./emplayeesList.jsp">employees</a></td>
				<td><a href="./salariesList.jsp">salaries</a></td>
				<td><a href="./titlesList.jsp">titles</a></td>
			</tr>
		</table>
	</div>
	<h1>deptManager 테이블 목록</h1>
	<%
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/employees",
				"root",
				"java1004"); // 주소 id 암호
		
		String sql = "SELECT * FROM dept_manager ORDER BY dept_no LIMIT 0, 10";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
	%>
	<table border="1">
		<thead>
			<tr>
				<th>dept_no</th>
				<th>emp_no</th>
				<th>from_date</th>
				<th>to_date</th>
			</tr>
		</thead>
		
		<tbody>
			<%
				while(rs.next()){
				%>
					<tr>
						<td><%=rs.getString("dept_no") %></td>
						<td><%=rs.getInt("emp_no") %></td>
						<td><%=rs.getString("from_date") %></td>
						<td><%=rs.getString("to_date") %></td>
					</tr>
				<%
				}
			%>
		</tbody>
	</table>
</body>
</html>







