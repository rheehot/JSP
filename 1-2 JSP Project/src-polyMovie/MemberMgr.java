package polyMovie;

import java.sql.*;

import java.util.Vector;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Vector;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import polyMovie.UsersBean;

public class MemberMgr {

    private DBConnectionMgr pool = null;

    public MemberMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
    public boolean memberInsert(UsersBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "insert into users values(?,?,?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getUserName());
            pstmt.setString(2, regBean.getEmail());
            pstmt.setString(3, regBean.getPasscode());
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
    public boolean loginCheck(String email, String passwd) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select email, passcode from users where email = ? and passcode = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, email);
            pstmt.setString(2, passwd);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return loginCon;
    }
    
    public JSONArray getMemberList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        JSONArray   jary    = new JSONArray();
        try {
            con = pool.getConnection();
            String strQuery = "select * from users";
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
    
    public boolean checkEmail(String email) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean checkCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select email from users where email = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            checkCon = rs.next();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return checkCon;
    }
    
    public boolean likeCheck(String id, String likedUser) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select likedUser from movies where id = ? and likedUser = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            pstmt.setString(2, likedUser);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return loginCon;
    }
    
    public String getMember(String email) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String result = null;

        try {
            con = pool.getConnection();
            String strQuery = "select * from users where email=?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                result = rs.getString("userName");
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return result;
    }
    
}
