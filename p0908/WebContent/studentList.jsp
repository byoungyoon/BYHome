<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "ao.MethodContainer2" %>
<%@ page import = "ao.Student" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>studentList</title>
</head>
<body>
	<%
		MethodContainer2 mc = new MethodContainer2();
		ArrayList<Student> list = mc.getStudentList();
	%>
	<h1>7���ǽ� �л� ���</h1>
	<table border="1">
		<thead>
			<tr>
				<td>����</td>
				<td>�̸�</td>
				<td>����</td>
			</tr>
		</thead>
		<tbody>
			<%
				for(Student s : list){
			%>
				<tr>
					<td><%=s.getage %></td>
					<td><%=s.getname %></td>
					<td><%=s.getgender %></td>
				</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>