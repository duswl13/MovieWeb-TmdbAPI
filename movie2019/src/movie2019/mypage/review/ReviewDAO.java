package movie2019.mypage.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	int result;
	
	public ReviewDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}
	
	public int getListCount(String id) {
		int x = 0;
		String sql="select count(*) from review "
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

	public List<Review> getList(String id ) {
		String sql = "select * from review where user_id=?";
	
		List<Review> list = new ArrayList<Review>();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while (rs.next()) {
				Review reiew = new Review();
				reiew.setREVIEW_NUMBER(rs.getInt("REVIEW_NUMBER"));
				reiew.setMOVIE_ID(rs.getString("MOVIE_ID"));
				reiew.setUSER_ID(rs.getString("USER_ID"));
				reiew.setREVIEW_TITLE(rs.getString("REVIEW_TITLE"));
				reiew.setREVIEW_CONTENT(rs.getString("REVIEW_CONTENT"));
				reiew.setREVIEW_DATE(rs.getDate("REVIEW_DATE"));
				list.add(reiew);
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

	public int delete(int num) {
		result=0;
		try {
			con=ds.getConnection();
			
			String sql="delete from review where REVIEW_NUMBER=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
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
