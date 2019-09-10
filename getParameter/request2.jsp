<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="request2Answer.jsp">
		이름 : <input type="text" name="name"><p>
		학번 : <input type="text" name="studentNum"><p>
		전공 : <select name="major">
			<option SELECTED value="전산과">전산과</option>
			<option value="국문과">국문과</option>
			<option value="기계">기계</option>
			<option value="자유전공과">자유전공과</option>
			<option value="경영학과">경영학과</option>
		</select><p>
		성별 : 남자 <input type="radio" name="sex" value="man" checked>
			 여자 <input type="radio" name="sex" value="woman"><p>
		<input type="submit" value="보내기">
	</form>
</body>
</html>