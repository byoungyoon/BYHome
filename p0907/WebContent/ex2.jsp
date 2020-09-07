<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "test.mTest" %>
<%@ page import = "test.myData" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		mTest mtest = new mTest();
		myData mydata = null;
		mydata = mtest.getmyData();
		int ho = mtest.add(1, 2);
	%>
	<%=ho %>
</body>
</html>