<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

상단 메뉴:

<%
	String id = (String)session.getAttribute("MEMBERID");
	if (id== null) { %>
	<form action="module/loginProcess.jsp" method="get">
	아이디: <input type="text" name="id" size="10">
	비밀번호: <input type="password" name="pwd" size="10">
	<input type="submit" value="로그인">
	</form>

<%		
	} else {
		
	out.print(id+"님, "  );	
	%>
	
	<form action="module/logoutProcess.jsp" method="get">
		<input type="submit" value="로그아웃">
	</form>	
	
	<%
		
	}
%>
