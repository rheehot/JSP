package polyMovie;

import java.sql.*;

public class MovieMgr {
	
	private DBConnectionMgr pool = null;
	
	public MovieMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
	
	public boolean likeInsert(MovieBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "insert into movies values(?,?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getId());
            pstmt.setString(2, regBean.getEmail());
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
	
	public boolean checkLike(String id, String email) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean checkCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select email from movies where id = ? and email = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            pstmt.setString(2, email);
            rs = pstmt.executeQuery();
            checkCon = rs.next();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return checkCon;
    }
	
	public boolean deleteLike(String id, String email) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();
            String query = "delete from movies where id = ? and email = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.setString(2, email);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception e) {
            System.out.println("Exception :" + e);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }
}
