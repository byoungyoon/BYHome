<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
						"jdbc:mariadb://127.0.0.1:3306/boarddb",
						"root",
						"java1004");
	
	String sql = "DELETE FROM comment WHERE comment_no = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	int commentNo = Integer.parseInt(request.getParameter("commentNo"));
	
	stmt.setInt(1, commentNo);
	
	String sql2 = "SELECT board_no FROM comment WHERE comment_no = ?";
	PreparedStatement stmt2 = conn.prepareStatement(sql2);
	
	stmt2.setInt(1, commentNo);
	
	ResultSet rs = stmt2.executeQuery();
	
	int boardNo = 0;
	
	if(rs.next()){
		boardNo = rs.getInt("board_no");
	}
	
	stmt.executeUpdate();
	
	response.sendRedirect("./boardOne.jsp?no=" +boardNo);
%>

