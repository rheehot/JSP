<%@ page contentType="text/html; charset=euc-kr" %>
<%
	String id = request.getParameter("id");
	if (id.equals("dong")) {
		
		session.setAttribute("MEMBERID", id);
		session.setAttribute("NAME", "장용미");
		response.sendRedirect("../template.jsp?CONTENTPAGE=content.jsp");
	} else {
%>
<html>
<head><title>로그인에 실패</title></head>
<body>
잘못된 아이디입니다.
</body>
</html>
<%
	}
%>
