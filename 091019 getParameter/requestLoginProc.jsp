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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String authId = "poly";
	String authPw = "1234";
	%>
	
	<h2><% if((id.equals("poly")) && (pw.equals("1234"))) { %> 로그인 성공 <% } else { %>
	로그인 실패 <% } %></h2>
	<p>id == "poly" ? <%= id.equals("poly") %></p>
	<p>pw == "1234" ? <%= pw.equals("1234") %></p>
	<h3>Output : <%= id %>, <%= pw %></h3>
</body>
</html>