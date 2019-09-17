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
	if(id.equals("poly") && pw.equals("1234")){
		session.setAttribute("memberLogin", "OK");
		session.setAttribute("memberName", "poly");
		response.sendRedirect("requestLogin.jsp");
	} else {
		response.sendRedirect("requestLogin.jsp");
	}
	%>
</body>
</html>