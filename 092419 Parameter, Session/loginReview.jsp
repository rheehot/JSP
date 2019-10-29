<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String check = (String)session.getAttribute("memberLogin");
	String id = (String)session.getAttribute("saveid");
	String pw = (String)session.getAttribute("savepw");
	String chek="";
	if(id==null){
		id="";
		pw="";
		chek="";
	}
	else{
		chek="checked";
	}
	if(check==null){
		
%>		
		<h3>로그인</h3>
		<form method="post" action="loginReviewProc.jsp">
		아이디 : <input type="text" name="ID" value=<%=id%>><p>
		비밀번호 : <input type="password" name="pw" value=<%=pw%>><br><br>
		<input type="checkbox" name="save" value="on" <%=chek %>> 아이디/비밀번호 저장 <br><br>
		<input type="submit" value="확인">
		</form>
<%
	}
	
	else{
		String name= (String)session.getAttribute("memberName");
%>		
		<h3> <%=name%>님 로그인 성공! </h3>
		<form method="post" action="loginReviewLogout.jsp">
			<input type="submit" value="로그아웃">
		</form>
<%
	}
%>
</body>
</html>