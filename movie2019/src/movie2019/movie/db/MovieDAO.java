package movie2019.movie.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import movie2019.review.db.AllReviewVO;
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

	private void close() {

		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if (con != null)
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

	public int InsertFaceRating(int movieId, int face, String userid) {
		String sql = "insert into rating_face values(" + "?,?,?,sysdate)";
		int result = -2;

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
			close();
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

				// ��ȭ ID�� ���� ��� �߰�����
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
			close();
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
			close();
		}
		return result;
	}

	public int SelectFaceRating(int movieId, String userId) {
		String sql = "select * from rating_face where MOVIE_ID= ? and USER_ID=?";
		int result = -2; // ����ǥ�ø� �ƿ� ������ ��� -2
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
			close();
		}
		return result;
	}

	public int SelectStarRating(int movieId, String userId) {
		String sql = "select * from rating_star where MOVIE_ID= ? and USER_ID=?";
		int result = -2; // ���� ǥ�ø� �ƿ� ������ ��� -2 ǥ��
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
			close();
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
			close();
		}
		return result;
	}

	public ArrayList<AllReviewVO> BestReviewRating(int movieId) {

		String sql = "SELECT * FROM " + "(SELECT " + "(SELECT COUNT(*) FROM " + "REVIEW_LIKE "
				+ "WHERE REVIEW_LIKE.USER_ID = REVIEW.USER_ID AND " + "REVIEW_LIKE.MOVIE_ID = REVIEW.MOVIE_ID) count, "
				+ "(SELECT RATING_FACE_value FROM " + "RATING_FACE " + "WHERE RATING_FACE.USER_ID = REVIEW.USER_ID AND "
				+ "RATING_FACE.MOVIE_ID = REVIEW.MOVIE_ID) face, " + "(SELECT RATING_STAR_value FROM " + "RATING_STAR "
				+ "WHERE RATING_STAR.USER_ID = REVIEW.USER_ID AND " + "RATING_STAR.MOVIE_ID = REVIEW.MOVIE_ID) star, "
				+ "USER_ID,MOVIE_ID,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_DATE "
				+ " FROM REVIEW WHERE MOVIE_ID= ? ORDER BY count DESC) where rownum <= 3";

		ArrayList<AllReviewVO> result = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieId);

			rs = pstmt.executeQuery();

			boolean check = false;

			while (rs.next()) {

				if (!check) {
					result = new ArrayList<AllReviewVO>();
					check = true;
				}

				AllReviewVO r = new AllReviewVO();
				r.setREVIEW_LIKE(rs.getInt(1));
				r.setREVIEW_FACE(rs.getInt(2));
				r.setREVIEW_STAR(rs.getInt(3));

				r.setUSER_ID(rs.getString(4));
				r.setMOVIE_ID(rs.getInt(5));
				r.setREVIEW_TITLE(rs.getString(6));
				r.setREVIEW_CONTENT(rs.getString(7));
				r.setREVIEW_DATE(rs.getDate(8));

				result.add(r);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public int UpdateStarRating(int movieId, int movieStar, String userId) {
		String sql = "update rating_star set RATING_STAR_value = ? where MOVIE_ID =? and USER_ID=?";
		int result = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, movieStar);
			pstmt.setInt(2, movieId);
			pstmt.setString(3, userId);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public int UpdateFaceRating(int movieId, int movieFace, String userId) {
		String sql = "update rating_face set RATING_FACE_value = ? where MOVIE_ID =? and USER_ID=?";
		int result = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, movieFace);
			pstmt.setInt(2, movieId);
			pstmt.setString(3, userId);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public int InsertReviewLike(int movieId, String userId, String likeuserId) {
		String sql = "insert into REVIEW_LIKE values(?,?,?)";
		int result = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, movieId);
			pstmt.setString(2, userId);
			pstmt.setString(3, likeuserId);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// �ش� ��ȭ�� ���� ���� ������ �����´�.
	public int[] MovieAllStar(int movieId) {
		String sql = "select RATING_STAR_value,count(*) from RATING_STAR where MOVIE_ID=? group by RATING_STAR_value order by RATING_STAR_value	";
		int[] result = new int[5];

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, movieId);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				// ���� ���� //�ش� ���� ����
				result[(rs.getInt(1)) - 1] = rs.getInt(2);
				// System.out.println((rs.getInt(1)-1)+"�� ���� : "+rs.getInt(2));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}

	public int[] MovieAllLike(int movieId) {
		String sql = "select RATING_FACE_value,count(*) from RATING_FACE where MOVIE_ID=? group by RATING_FACE_value order by RATING_FACE_value	";
		int[] result = new int[2];

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, movieId);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				// ���� ���� //�ش� ���� ����
				result[(rs.getInt(1)) - 1] = rs.getInt(2);
				System.out.println((rs.getInt(1) - 1) + "�� ���� : " + rs.getInt(2));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}

	public ArrayList<Integer> getHiddenList(String user_id) {

		String sql = "select * from USER_HIDDEN_MOVIE where USER_ID = ?";
		ArrayList<Integer> result = new ArrayList<Integer>();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				result.add(rs.getInt(2)); // ��ȭ ID
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;

	}

	public int InsertHidden(int movie_id, String user_id) {

		String sql = "insert into USER_HIDDEN_MOVIE values(?,?)";
		int result1 = -1;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, movie_id);

			result1 = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result1;

	}

	public List<MovieItemAPIVO> addStar(ArrayList<MovieItemAPIVO> list) {

		String Id = "";

		for (int i = 0; i < list.size(); i++) {

			Id += list.get(i).getId();

			if (i < list.size() - 1)
				Id += ",";

		}

		// 해당 영화들에 대한 별점 평균 가져오기
		String sql = "select MOVIE_ID,avg(RATING_STAR_value) " + "from RATING_STAR where MOVIE_ID" + " in (" + Id
				+ ") group by MOVIE_ID";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				int movieId = rs.getInt(1);
				int star = rs.getInt(2);
				
				for(int j = 0; j < list.size(); j++)
					if(list.get(j).getId() == movieId) {
						System.out.println(list.get(j).getTitle()+"별점 : "+star);
						list.get(j).setStar(star);
						break;
					}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		
		return list;
	}
	
	
	
}
