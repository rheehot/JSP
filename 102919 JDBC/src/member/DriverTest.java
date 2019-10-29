package member;

import java.sql.*;

public class DriverTest {

	public static void main(String[] args) {
		Connection con;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/LarryStudyJSP?serverTimezone=UTC", "root", "poly1234@");
			System.out.println("Success");
		} catch(SQLException ex) {
			System.out.println("SQLException" + ex);
		} catch(Exception ex) {
			System.out.println("Exception" + ex);
		}

	}
}
