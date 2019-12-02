package movie2019.movie.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

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
		String sql = "insert into rating_face values("
				+ "?,?,?,sysdate)";
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
				//System.out.println(movieId);
				//System.out.println(movieTitle);
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

}
