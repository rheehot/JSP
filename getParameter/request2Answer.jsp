<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	%>
	<% 
		String name = request.getParameter("name");
		String studentNum = request.getParameter("studentNum");
		String major = request.getParameter("major");
		String sex = request.getParameter("sex");
	%>
	<h2>학생 정보 입력 결과</h2>
	이름 : <%= name %><p>
	학번 : <%= studentNum %><p>
	전공 : <%= major %><p>
	성별 : <%= sex %> 
</body>
</html>