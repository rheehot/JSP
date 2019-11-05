<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String memberID = request.getParameter("memberID");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		
		Connection conn = null;
		Statement pstmt = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try{
			String jdbcDriver = "jdbc:mysql://localhost:3306/LarryStudyJSP?serverTimezone=UTC";
			String dbUser = "root";
			String dbPass = "poly1234@";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.createStatement();
			pstmt.executeUpdate( "insert into MEMBERs values ('"+ memberID +"', '"+ password + "', '"+ name +"', now(), '"+ address +"', '"+ tel +"')");
			
		} finally {
			if(pstmt != null)
				try{
					pstmt.close();
				} catch(SQLException ex) {}
			if(conn != null ) 
				try{
					conn.close();
				} catch(SQLException ex){}
		}
	%>
</body>
</html>