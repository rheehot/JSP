<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% response.sendRedirect("temp.jsp"); %>
	<form action="registerResult.jsp" method="post">
		<div>
			<label>Name</label>
			<input placeholder="Larry Jung" type="text" name="name">
		</div>
		<div>
			<label>ID : </label>
			<input type="text" placeholder="ID" name="id">
		</div>
		<div>
			<label>PW : </label>
			<input type="password" placeholder="****" name="pw">
		</div>
		<div>
			<label>성별 : </label>
			<select name="sex">
				<option value="M" selected="selected">Male</option>
				<option value="F">Female</option>
			</select>
		</div>
		<div>
			<span>취미 : </span>
			<label for="Book">Book</label>
			<input type="checkbox" value="Book" name="hobby">
			<label for="Movie">Movie</label>
			<input type="checkbox" value="Movie" name="hobby">
			<label for="Music">Music</label>
			<input type="checkbox" value="Music" name="hobby">
			<label for="Game">Game</label>
			<input type="checkbox" value="Game" name="hobby">
		</div>
		<input type="submit" value="SEND">
	</form>
</body>
</html>