<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="movieMgr" class="polyMovie.MovieMgr" />
<jsp:useBean id="movieBean" class="polyMovie.MovieBean" />
<jsp:setProperty name="movieBean" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String user = request.getParameter("email");
		boolean flag = movieMgr.likeInsert(movieBean);
	%>
	<%
		if(flag){
			response.sendRedirect("../detail.jsp?id="+id);
		}
	%>
	
	
	<script>
		console.log("<%=id%>",  "<%=user%>");
	</script>
</body>
</html>