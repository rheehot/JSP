<%@ page contentType = "text/html; charset=euc-kr" %>
<html>
<head><title>회원가입 입력 폼</title></head>
<body>
<h1> membershipForm.jsp</h1>
<form action="processJoining.jsp" method="post"> 
<table border="1">
<tr>
	<td>아이디</td><td colspan="3"><input type="text" name="id" size="10"></td>
</tr>
<tr>
	<td>이름</td><td><input type="text" name="name" size="10"></td>
	<td>이메일</td><td><input type="text" name="email" size="10"></td>
</tr>
<tr>
	<td>주소</td><td colspan="3"><input type="text" name="address" size="30"></td>
</tr>
<tr>
	<td colspan="4">	<input type="submit" value="회원가입">
	</td>
</tr>
</table>
</form>

</body>
</html>
