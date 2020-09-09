<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	// 받아오는 값의 인코딩 값 UTF-8
	request.setCharacterEncoding("UTF-8");
	
	// Form에서 보내주는 값 변수 지정
	int age = Integer.parseInt(request.getParameter("age"));
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String addr = request.getParameter("addr");
	
	// 데이터 베이스 연결(MariaDB)
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
							"jdbc:mariadb://127.0.0.1:3306/goodee",
							"root",
							"java1004");
	// System.out.println(conn);
	
	// SQL문법 insert 사용하여 DB의 속성값에 직접입력
	String sql = "INSERT INTO student values(?,?,?,?,?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	// SQL문법 SELECT를 사용하여 기본키 no를 출력
	String sql2 = "SELECT no FROM student";
	PreparedStatement stmt2 = conn.prepareStatement(sql2);
	ResultSet rs = stmt2.executeQuery();
	
	// no를 받아온 퀴리문을 rs.next()를 사용해 false까지 찾아낸 후 결과물에서 플러스 1
	int no = 701;
	while(rs.next()){ no = rs.getInt("no") + 1;}
	
	// 각각의 값을 DB에 입력
	stmt.setInt(1,no);
	stmt.setString(2,name);
	stmt.setInt(3,age);
	stmt.setString(4,gender);
	stmt.setString(5,addr);
	
	// 업데이트
	stmt.executeUpdate();

	response.sendRedirect("./studentList.jsp");
%>


