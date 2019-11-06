<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <% 
    request.setCharacterEncoding("UTF-8"); 
    String email = request.getParameter("email"); 
    String pw = request.getParameter("password");
    
    if(email.equals("admin@email.com") && pw.equals("1234")){
    	session.setAttribute("user.email", email);
    	session.setAttribute("user.username", "Larry Jung");
    	session.setAttribute("isAdmin", "true");
    	session.removeAttribute("passwordError");
    	response.sendRedirect("../index.jsp"); 
    } else if(email.equals("user@email.com") && pw.equals("1234")){
    	session.setAttribute("user.email", email);
        session.setAttribute("user.username", "Larry Jung");
        session.setAttribute("isAdmin", "false");
        session.removeAttribute("passwordError");
        response.sendRedirect("../index.jsp"); 
    } else {
    session.setAttribute("passwordError", "true");
    response.sendRedirect("../login.jsp"); 
    } 
    %>
  </body>
</html>
