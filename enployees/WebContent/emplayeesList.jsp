<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>employees.jsp</title>
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
	<h1>employees 테이블 목록</h1>
	<%
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/employees",
				"root",
				"java1004"); // 주소 id 암호
		
		String sql = "SELECT emp_no, birth_date, YEAR(birth_date) as age, first_name, last_name, gender, hire_date FROM employees ORDER BY emp_no LIMIT 0, 20";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
	%>
	<table border="1">
		<thead>
			<tr>
				<th>emp_no</th>
				<th>birth_date</th>
				<th>age</th>
				<th>first_name</th>
				<th>last_name</th>
				<th>gender</th>
				<th>hire_date</th>
			</tr>
		</thead>
		
		<tbody>
			<%
				int age;
				int year = Calendar.getInstance().get(Calendar.YEAR);
				while(rs.next()){
					//String[] ageStr = rs.getString("birth_date").split("-");
					age = year - rs.getInt("age") + 1;
					//age = year - Integer.parseInt(ageStr[0]) + 1;
				%>
					<tr>
						<td><%=rs.getInt("emp_no") %></td>
						<td><%=rs.getString("birth_date") %></td>
						<td><%=age%></td>
						<td><%=rs.getString("first_name") %></td>
						<td><%=rs.getString("last_name") %></td>
						<td>
							<%
								if(rs.getString("gender").equals("M")){
								%>
									남자
								<% 	
								}
								else{
								%>
									여자
								<% 	
								}
							%>
							
						</td>
						<td><%=rs.getString("hire_date") %></td>
					</tr>
				<%
				}
			%>
		</tbody>
	</table>
</body>
</html>