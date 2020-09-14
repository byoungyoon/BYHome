<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	// 인코딩 형식
	request.setCharacterEncoding("UTF-8");
	// DB연결
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
						"jdbc:mariadb://127.0.0.1:3306/boarddb",
						"root",
						"java1004");
	// SQL구문 stmt에 저장
	String sql = "DELETE FROM comment WHERE comment_no = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	// comment의 번호를 저장한 변수
	int commentNo = Integer.parseInt(request.getParameter("commentNo"));
	
	// sql의  ?에 저장
	stmt.setInt(1, commentNo);
	
	// SQL구문 stmt2에 저장
	String sql2 = "SELECT board_no FROM comment WHERE comment_no = ?";
	PreparedStatement stmt2 = conn.prepareStatement(sql2);
	
	// sql2의 ?에 저장
	stmt2.setInt(1, commentNo);
	
	// rs변수 stmt2의 쿼리문으로 초기화
	ResultSet rs = stmt2.executeQuery();
	
	// board의 번호를 받아올 변수를 초기화
	int boardNo = 0;
	
	// boardNo라는 변수에 board의 번호 저장
	if(rs.next()){
		boardNo = rs.getInt("board_no");
	}
	//업데이트
	stmt.executeUpdate();
	
	// boardOne.jsp를 구동하기 위해서 board의 번호를 no라는 변수에 저장하여야 함
	response.sendRedirect("./boardOne.jsp?no=" +boardNo);
%>

