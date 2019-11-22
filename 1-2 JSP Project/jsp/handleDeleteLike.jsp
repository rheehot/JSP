<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="movieMgr" class="polyMovie.MovieMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		boolean flag = movieMgr.deleteLike(id, email);
	%>
	<%
		if(flag){
			response.sendRedirect("../detail.jsp?id="+id);
		}
	%>
</body>
</html>