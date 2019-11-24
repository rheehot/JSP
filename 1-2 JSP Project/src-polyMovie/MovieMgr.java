package polyMovie;

import java.sql.*;

import org.json.JSONArray;
import org.json.JSONObject;

public class MovieMgr {
	
	private DBConnectionMgr pool = null;
	
	public MovieMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
	
	public JSONArray getLikedMovies() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        JSONArray   jary    = new JSONArray();
        try {
            con = pool.getConnection();
            String strQuery = "select * from likes";
            stmt = con.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                JSONObject jo = new JSONObject();
                ResultSetMetaData rmd = rs.getMetaData();
                for ( int i=1; i<=rmd.getColumnCount(); i++ )
                {
                    jo.put(rmd.getColumnName(i),rs.getString(rmd.getColumnName(i)));
                }
                jary.put(jo);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return jary;
    }
	
	public boolean likeInsert(MovieBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "insert into likes values(?,?)";
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
            String strQuery = "select email from likes where id = ? and email = ?";
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
            String query = "delete from likes where id = ? and email = ?";
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
