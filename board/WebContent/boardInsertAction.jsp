<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
						"jdbc:mariadb://127.0.0.1:3306/boarddb",
						"root",
						"java1004");
	
	String sql = "INSERT INTO board(title,content,witter,day) VALUES (?,?,?,NOW())";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String witter = request.getParameter("witter");
	
	stmt.setString(1, title);
	stmt.setString(2, content);
	stmt.setString(3, witter);
	
	stmt.executeUpdate();
	
	response.sendRedirect("./boardList.jsp");
%>
