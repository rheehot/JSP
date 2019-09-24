<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
			.Container{
				width: 500px;
				height: 500px;
				display: flex;
				flex-direction: column;
				justify-contents: center;
				align-items: center;
				border: 2px solid peru;
				border-radius: 10px;
			}
			span{
				font-weight: 600;
			}
	</style>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String six = request.getParameter("6String");
		String seven = request.getParameter("7String");
		String grade = request.getParameter("grade");
		String major = request.getParameter("major");
		String[] platform = request.getParameterValues("platform");
	%>
	
	<div class="Container">
		<h2>기술정보 이력서</h2>
		<p>
			<span>이름 : </span><%= name %>
		</p>
		<p>
			<span>주민번호 : </span><%= six %><span> - </span><%= seven %>
		</p>
		<p>
			<span>학력 : </span><%= grade %>
		</p>
		<p>
			<span>전공 : </span><%= major %>
		</p>
		<p>
			<span>경험 플랫폼 : </span><% %>
			<% for(int i = 0; i < platform.length; i++) {
					out.print("[" + platform[i] + "] ");}%>
		</p>
	</div>
</body>
</html>