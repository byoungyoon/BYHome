<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	// commentInsertAction.jsp
	
	request.setCharacterEncoding("UTF-8");
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
						"jdbc:mariadb://127.0.0.1:3306/boarddb",
						"root",
						"java1004");
	
	String sql = "INSERT INTO comment(board_no,comment_content,comment_writer) VALUES(?,?,?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	int boardNo = Integer.parseInt(request.getParameter("boardNo")); // board_no
	String commentContent = request.getParameter("commentContent");
	String commentWriter = request.getParameter("commentWriter");
	
	stmt.setInt(1, boardNo);
	stmt.setString(2, commentContent);
	stmt.setString(3, commentWriter);
	
	stmt.executeUpdate();
	
	response.sendRedirect("./boardOne.jsp?no=" +boardNo);
%>