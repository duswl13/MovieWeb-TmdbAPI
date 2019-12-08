package movie2019.mypage.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import movie2019.admin.user.Users;

public class PosterDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	int result;

	public PosterDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			System.out.println("DB 접근 실패 : " + ex);
		}
	}

	public int update_poster(String poster, String id) {
		try {
			con = ds.getConnection();
			System.out.println("getConnection");
			String delete_sql = "delete from USER_POSTER where user_id=?";
			pstmt = con.prepareStatement(delete_sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();

			String insert_sql = "insert into USER_POSTER values(?,?)";
			pstmt = con.prepareStatement(insert_sql);
			pstmt.setString(1, id);
			pstmt.setString(2, poster);
			result = pstmt.executeUpdate();

		} catch (java.sql.SQLIntegrityConstraintViolationException e) {
			e.printStackTrace();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
		}
		return result;
	}

	public Poster poster_info(String id) {
		Poster p= null;
		try {
			con=ds.getConnection();			
			String sql= "select * from USER_POSTER where USER_ID=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				p=new Poster();
				p.setUSER_ID(rs.getString(1));
				p.setUSER_POSTER(rs.getString(2));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					pstmt.close();
				}catch(SQLException ex){
					ex.printStackTrace();					
				}
			}
			if(con!=null) {
				try {
					con.close();
				}catch(SQLException ex) {
					ex.printStackTrace();
				}
			}
		}
		return p;
	}

}
