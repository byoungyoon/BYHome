<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
	int danNum = Integer.parseInt(request.getParameter("danNum"));
	int danIdx = Integer.parseInt(request.getParameter("danIdx"));
	
	int danVal = danNum * danIdx;
	
	System.out.println(danNum + " * " + danIdx + " = " + danVal);
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
							"jdbc:mariadb://127.0.0.1:3306/gugudan",
							"root",
							"java1004");
	
	String sql = "INSERT INTO dan values(?,?,?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	try{
		stmt.setInt(1,danNum);
		stmt.setInt(2,danIdx);
		stmt.setInt(3,danVal);
		
		stmt.executeUpdate();
	}catch(Exception e){}
		
			
	// danList.jsp로 이동해 주세요(재요청)
	response.sendRedirect("./danLIst.jsp");
%>