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
		String check = (String)session.getAttribute("memberLogin");
		if(check == null){
	%>
		<form method="post" action="requestLoginProc.jsp">
			ID : <input type="text" name="id">
			PW : <input type="password" name="pw"> <br>
			<input type="submit" value="login">
		</form>
	<% 
		} else { 
	%>
		<h1>poly, Have a nice day</h1>
		<form method="post" action="requestLogin.jsp">
			<input type="submit" value="Login">
		</form>
	<% 	
		} 
	%>
</body>
</html>