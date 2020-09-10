<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	int no = Integer.parseInt(request.getParameter("no"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String witter = request.getParameter("witter");
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
						"jdbc:mariadb://127.0.0.1:3306/boarddb",
						"root",
						"java1004");
	
	String sql = "UPDATE board SET title=?, content=?, witter=? WHERE no = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	stmt.setString(1, title);
	stmt.setString(2, content);
	stmt.setString(3, witter);
	stmt.setInt(4, no);
	
	stmt.executeUpdate();
	
	response.sendRedirect("./boardList.jsp?no=" +no);
%>
