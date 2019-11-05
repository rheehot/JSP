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
		Statement stmt = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		ResultSet rs = null;
		
		try{
			String jdbcDriver = "jdbc:mysql://localhost:3306/LarryStudyJSP?serverTimezone=UTC";
			String dbUser = "root";
			String dbPass = "poly1234@";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery("select * from members;");
			
			/* 
			boolean re = rs.next();
			if(re){
				out.print(rs.getString("name") + "님, <h2> 로그인 성공 ! </h2>");
			} else {
				out.print("<h2> 없는 회원 </h2>");
			} 
			*/
			
			while(rs.next()) {
				out.print(rs.getString("id") + ", ");
				out.print(rs.getString("passwd") + ", ");
				out.print(rs.getString("name"));
			}
			
		} finally {
			if(stmt != null)
				try{
					stmt.close();
				} catch(SQLException ex) {}
			if(conn != null ) 
				try{
					conn.close();
				} catch(SQLException ex){}
		}
	%>
</body>
</html>