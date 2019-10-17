<%@ page contentType="text/html; charset=euc-kr" %>
<%
		session.removeAttribute("MEMBERID");
		response.sendRedirect("../template.jsp?CONTENTPAGE=content.jsp");
%>
