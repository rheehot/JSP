<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<jsp:useBean id="memMgr" class="polyMovie.MemberMgr" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <% request.setCharacterEncoding("UTF-8"); 
    String email = request.getParameter("email"); String password =
    request.getParameter("password"); 
    boolean loginCheck = memMgr.loginCheck(email, password);
    String userName =  memMgr.getMember(email);
    %> 
    <% 
    if(loginCheck){
	    if(email.equals("admin@email.com") == true){ 
	    	session.setAttribute("isAdmin", "true"); 
		}
	    session.setAttribute("user.email", email);
	    session.setAttribute("userName", userName);
	    response.sendRedirect("../index.jsp"); }
    else{
	    session.setAttribute("loginError", "true");
	    response.sendRedirect("../login.jsp"); 
	} %>
  </body>
</html>
