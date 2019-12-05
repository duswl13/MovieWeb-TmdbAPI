package movie2019.mypage.hidden;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HiddenDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	int result;
	
	public HiddenDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}
	
	public int getListCount(String id) {
		int x = 0;
		String sql="select count(*) from USER_HIDDEN_MOVIE "
				+ "where user_id=?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getListCount() 에러: " + e);
		} finally {
			if (rs != null) {
				try {
					rs.close();
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
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
		}
		return x;
	}

	public List<Hidden> getList(String id ) {
		

		 String sql = "select USER_HIDDEN_MOVIE.user_id, USER_HIDDEN_MOVIE.movie_id, MOVIE.movie_name "
		 		+ "from USER_HIDDEN_MOVIE, MOVIE "
		 		+ "where USER_HIDDEN_MOVIE.movie_id=MOVIE.movie_id and USER_HIDDEN_MOVIE.user_id=?";

		

		List<Hidden> list = new ArrayList<Hidden>();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while (rs.next()) {
				Hidden user = new Hidden();
				user.setUSER_ID(rs.getString("USER_ID"));
				user.setMOVIE_ID(rs.getString("MOVIE_ID"));
				user.setMOVIE_NAME(rs.getString("MOVIE_NAME"));
				list.add(user);
			}
			return list; // 값을 담을 객체를 저장한 리스트를 호출한 곳으로 가져갑니다.
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getList() 에러: " + e);
		} finally {
			if (rs != null) {
				try {
					rs.close();
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
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
		}
		return null;
	}

	public int delete(String user_id, String movie_id) {
		result=0;
		try {
			con=ds.getConnection();
			
			String sql="delete from USER_HIDDEN_MOVIE where USER_ID=? and MOVIE_ID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, movie_id);
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delete() 에러: " + e);
		} finally {
			if (rs != null) {
				try {
					rs.close();
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
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
		}
		return result;
	}

}
