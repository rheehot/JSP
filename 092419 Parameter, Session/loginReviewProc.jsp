<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String id=request.getParameter("ID");
	   String pw=request.getParameter("pw");
	   String save=request.getParameter("save");
	   if(save==null){save="off";}
	%>
	
	<%if(id.equals("poly")&&pw.equals("1234")){
		if(save.equals("on"))
		{
		session.setAttribute("saveid",id);
		session.setAttribute("savepw",pw);
		session.setAttribute("memberLogin","ok");
		session.setAttribute("memberName","kopo");
		response.sendRedirect("loginReview.jsp");}
		else
		{
		session.setAttribute("saveid",null);
		session.setAttribute("savepw",null);
		session.setAttribute("memberLogin","ok");
		session.setAttribute("memberName","kopo");
		response.sendRedirect("loginReview.jsp");}	
		}
	else{
		session.setAttribute("saveid",null);
		session.setAttribute("savepw",null);
		response.sendRedirect("loginReview.jsp");
	}
	%>
</body>
</html>