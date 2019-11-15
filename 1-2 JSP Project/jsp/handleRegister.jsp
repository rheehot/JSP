<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<jsp:useBean id="memMgr" class="polyMovie.MemberMgr" />
<jsp:useBean id="usersBean" class="polyMovie.UsersBean" />
<jsp:setProperty name="usersBean" property="*" />
<% String email = request.getParameter("email"); 
boolean flag = memMgr.memberInsert(usersBean); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body
    style="background-color: #1f1f1f; color: orangered; display: flex; justify-content: center; align-items:center; flex-direction: column; width: 100%; height: 100vh; margin: 0; padding: 0;"
  >
    <% 
    if(flag){ 
    	response.sendRedirect("../login.jsp"); 
    }
    else{ %>
    <p style="font-size: 24px;">사용중인 Email / username 입니다.</p>
    <a
      style="font-size: 20px; color: #eee; text-decoration: none;"
      href="../signIn.jsp"
      style="color: #eee"
      >다시 가입</a
    >
    <%}%>
  </body>
</html>
