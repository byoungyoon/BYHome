<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	// 기본키 값인 no는 중복이 없으므로 이것만 함수로 저장
	int no = Integer.parseInt(request.getParameter("no"));
	
	// DB를 불러옴(MariaDB)
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
							"jdbc:mariadb://127.0.0.1:3306/goodee",
							"root",
							"java1004");
	
	// SQL의 DELETE문을 이용하여 함수에 저장, no는 중복값이 없으므로 이것만 기준으로 삭제
	String sql = "DELETE FROM student WHERE no = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	// ? 값의 첫번째 위치에 no를 입력
	stmt.setInt(1, no);
	
	// DB 업데이트
	stmt.executeUpdate();
	
	response.sendRedirect("./studentList.jsp");
%>