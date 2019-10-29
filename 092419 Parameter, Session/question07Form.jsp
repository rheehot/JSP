<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		td{
			padding: 10px;
			text-align: center;
		}
		.Box{
			border: 2px solid peru;
			border-radius: 10px;
			width: 550px;
			height: 500px;
			padding: 20px;
			display: flex;
			flex-direction: column;
			justify-contents: center;
			align-items: center;
		}
		h2{
			margin-bottom: 40px;
		}
	</style>
</head>
<body>
	<div class="Box">
		<h2>기술정보 이력서</h2>
	<form method="post"  action="question7.jsp">
		<table border="1"">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" placeholder="홍길동"></td>
		</tr>
		<tr>
			<td>주민등록번호</td>
			<td>
				<input type="text" name="6String" placeholder="980101">
		 		<span> - </span>
		 		<input type="text" name="7String" placeholder="111111">
		 	</td>
		</tr>
		<tr>
			<td>학력</td>
			<td>
				<input type="radio" name="grade" value="고졸">고졸
				<input type="radio" name="grade" value="대졸">대졸
				<input type="radio" name="grade" value="대학원졸">대학원졸
			</td>
		</tr>
		<tr>
			<td>전공</td>
			<td>
				<select name="major">
		 			<option value="산업공학과">산업공학과
		 			<option value="컴퓨터정보과">컴퓨터정보과
		 		</select>
			</td>
		</tr>
		<tr>
			<td>사용가능 플랫폼</td>
			<td>
				<select name="platform" multiple>
		 			<option value="Windows PC">Windows PC
		 			<option value="UNIX">UNIX
		 			<option value="IBM OS/390">IBM OS/390
		 		</select>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="확인">
			</td>
			<td>
				<input type="reset" value="초기화">
			</td>
		</tr>
	</table>
	</form>
	</div>

</body>
</html>