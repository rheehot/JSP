<%@ page contentType="text/html; charset=euc-kr" %>
<%
	String id = request.getParameter("id");
	if (id.equals("dong")) {
		
		session.setAttribute("MEMBERID", id);
		session.setAttribute("NAME", "����");
		response.sendRedirect("../template.jsp?CONTENTPAGE=content.jsp");
	} else {
%>
<html>
<head><title>�α��ο� ����</title></head>
<body>
�߸��� ���̵��Դϴ�.
</body>
</html>
<%
	}
%>
