<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mem" class="member.memberInfo" scope="session" />
<jsp:setProperty name="mem" property="*" />
<jsp:setProperty name="mem" property="password" value="<%=mem.getId() %>" />
<!DOCTYPE html>
<html>
<head>S
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>