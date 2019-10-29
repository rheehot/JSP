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
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String ID = request.getParameter("id");
		String PW = request.getParameter("pw");
		String Sex = request.getParameter("sex");
		String[] Hobby = request.getParameterValues("hobby");
	%>
	<div>
		<h1 style="color:peru">Checking Sign-in</h1>
		<h2 style="color:red">Are you sure?</h2>
		<p>
			<b>Name : </b><%= name %> 
		</p>
		<p>
			<b>ID : </b><%= ID %>
		</p>
		<p>
			<b>PW : </b><%= PW %>
		</p>
		<p>
			<b>Sex : </b><%= Sex %> 
		</p>
		<p>
			<b>Hobby : </b><% for(int i = 0; i < Hobby.length; i++) {
					out.print(Hobby[i] + " ");}%>
		</p>
		<input type="submit" value="Sign-in">
	</div>
</body>
</html>