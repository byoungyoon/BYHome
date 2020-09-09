<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
	int danNum = Integer.parseInt(request.getParameter("danNum"));
	int danIdx = Integer.parseInt(request.getParameter("danIdx"));
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
							"jdbc:mariadb://127.0.0.1:3306/gugudan",
							"root",
							"java1004");
	
	String sql = "DELETE FROM dan WHERE dan_num=? and dan_idx=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	stmt.setInt(1, danNum);
	stmt.setInt(2, danIdx);
	
	stmt.executeUpdate();
	
	response.sendRedirect("./danLIst.jsp");
%>
