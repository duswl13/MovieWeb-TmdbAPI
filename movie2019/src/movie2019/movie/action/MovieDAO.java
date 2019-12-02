package movie2019.movie.action;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import movie2019.review.db.ReviewVO;

public class MovieDAO {
	DataSource ds = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public MovieDAO() {

		try {

			Context initContext = new InitialContext();

			Context envContext = (Context) initContext.lookup("java:/comp/env");

			ds = (DataSource) envContext.lookup("jdbc/OracleDB");

		} catch (NamingException e) {

			e.printStackTrace();

		}

	}

	public int InsertFaceRating(int movieId, int face, String userid) {
		String sql = "insert into rating_face values(" + "?,?,?,sysdate)";
		int result = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, movieId);
			pstmt.setString(2, userid);
			pstmt.setInt(3, face);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return result;
	}

	public boolean isMovieId(int movieId, String movieTitle) {
		String sql = "select * from movie where MOVIE_ID= ?";
		boolean result = false;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieId);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = true;
			} else {

				// 영화 ID가 없을 경우 추가까지
				String sql2 = "INSERT INTO MOVIE VALUES(?,?)";

				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, movieId);
				pstmt.setString(2, movieTitle);
				// System.out.println(movieId);
				// System.out.println(movieTitle);
				int result2 = pstmt.executeUpdate();

				if (result2 == 1)
					result = true;
				else
					result = false;

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return result;
	}

	public int InsertStarRating(int movieId, int moviestar, String userId) {
		String sql = "insert into rating_star values(" + "?,?,?,sysdate)";
		int result = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, movieId);
			pstmt.setString(2, userId);
			pstmt.setInt(3, moviestar);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return result;
	}

	public int SelectFaceRating(int movieId, String userId) {
		String sql = "select * from rating_face where MOVIE_ID= ? and USER_ID=?";
		int result = -2;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieId);
			pstmt.setString(2, userId);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt("RATING_FACE_value");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return result;
	}

	public int SelectStarRating(int movieId, String userId) {
		String sql = "select * from rating_star where MOVIE_ID= ? and USER_ID=?";
		int result = -2;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieId);
			pstmt.setString(2, userId);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt("RATING_STAR_value");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return result;
	}

	public ReviewVO MyReviewRating(int movieId, String userId) {
		String sql = "select * from review where MOVIE_ID= ? and USER_ID=?";
		ReviewVO result = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieId);
			pstmt.setString(2, userId);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				result = new ReviewVO();
				result.setREVIEW_NUMBER(rs.getInt("REVIEW_NUMBER"));
				result.setMOVIE_ID(rs.getInt("MOVIE_ID"));
				result.setUSER_ID(rs.getString("USER_ID"));
				result.setREVIEW_TITLE(rs.getString("REVIEW_TITLE"));
				result.setREVIEW_CONTENT(rs.getString("REVIEW_CONTENT"));
				result.setREVIEW_DATE(rs.getDate("REVIEW_DATE"));
			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return result;
	}

	public ReviewVO[] BestReviewRating(int movieId) {
		String sql = "select * from review where MOVIE_ID= ? and ";
		ReviewVO[] result = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieId);
			
			rs = pstmt.executeQuery();
			
			int i = 0;
			while (rs.next()) {
				
				ReviewVO r = new ReviewVO();
				r.setREVIEW_NUMBER(rs.getInt("REVIEW_NUMBER"));
				r.setMOVIE_ID(rs.getInt("MOVIE_ID"));
				r.setUSER_ID(rs.getString("USER_ID"));
				r.setREVIEW_TITLE(rs.getString("REVIEW_TITLE"));
				r.setREVIEW_CONTENT(rs.getString("REVIEW_CONTENT"));
				r.setREVIEW_DATE(rs.getDate("REVIEW_DATE"));
				
				result[i++] = r;
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return result;
	}

}
