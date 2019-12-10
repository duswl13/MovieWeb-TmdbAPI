package movie2019.review.db;

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
			System.out.println("DB �뿰寃� �떎�뙣 : " + ex);
		}
	}

	// 내리뷰모아보기 모달 띄우는 부분
	public ReviewDetailVO detail(String id, String Movie_h) {
		ReviewDetailVO vo = new ReviewDetailVO();
		String sql = "select * " + "	from REVIEW " + "	where USER_ID=? and MOVIE_ID=?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, Movie_h);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo.setMovie_id(rs.getInt("movie_id"));
				vo.setReview_title(rs.getString("review_title"));
				vo.setReview_content(rs.getString("review_content"));
			}
			return vo;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getreviewList() 에러 : " + e);
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
		return vo;
	}

	// 내리뷰 모아보기
	public List<ReviewVO> getreviewMyList(String userId, int page, int limit) {
		String sql = "SELECT * FROM(\r\n"
				+ "   SELECT ROWNUM R, REVIEW_NUMBER, id,name, poster ,USER_ID,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_DATE,\r\n"
				+ "   star, face FROM\r\n"
				+ "(SELECT REVIEW_NUMBER, review.MOVIE_ID id ,movie.MOVIE_NAME name, movie.movie_poster poster,USER_ID,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_DATE, (SELECT rating_star_value \r\n"
				+ "               FROM RATING_STAR \r\n" + "               WHERE USER_ID = review.user_id \r\n"
				+ "               and MOVIE_ID = review.movie_id) star,\r\n"
				+ "               (SELECT rating_face_value \r\n" + "               FROM RATING_FACE \r\n"
				+ "               WHERE USER_ID = review.user_id \r\n"
				+ "               and MOVIE_ID = review.movie_id) face\r\n" + "   FROM review,movie \r\n"
				+ "   where review.movie_id = movie.movie_id  and USER_ID=?\r\n"
				+ "   order by REVIEW_DATE DESC)) where R >=? and R <=?";

		List<ReviewVO> list = new ArrayList<ReviewVO>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ReviewVO reiew = new ReviewVO();
				reiew.setREVIEW_NUMBER(rs.getInt(2));
				reiew.setMOVIE_ID(rs.getInt(3));
				reiew.setMOVIE_NAME(rs.getString(4));
				reiew.setMOVIE_POSTER(rs.getString(5));
				reiew.setUSER_ID(rs.getString(6));
				reiew.setREVIEW_TITLE(rs.getString(7));
				reiew.setREVIEW_CONTENT(rs.getString(8));
				reiew.setREVIEW_DATE(rs.getDate(9));
				reiew.setSTAR(rs.getInt(10));
				reiew.setFACE(rs.getInt(11));
				list.add(reiew);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getreviewList() 에러 : " + e);
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

	// 새 리뷰 쓰기
	public boolean reviewInsert(ReviewVO reviewdata) {
		String sql = "";
		boolean result = false;
		try {

			con = ds.getConnection();
			sql = "insert into review " + "(REVIEW_NUMBER, "
					+ " MOVIE_ID, USER_ID, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_DATE) "
					+ " values((select nvl(max(REVIEW_NUMBER),0)+1 from review)," + " ?,?,?,?, " + " sysdate)";

			pstmt = con.prepareStatement(sql);

			System.out.println(reviewdata.getREVIEW_TITLE());

			pstmt.setInt(1, reviewdata.getMOVIE_ID());
			pstmt.setString(2, reviewdata.getUSER_ID());
			pstmt.setString(3, reviewdata.getREVIEW_TITLE());
			pstmt.setString(4, reviewdata.getREVIEW_CONTENT());

			int result2 = pstmt.executeUpdate();

			if (result2 == 1) {
				System.out.println("�뜲�씠�꽣 �궫�엯 �셿猷�");
				result = true;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
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

	public int getListCount() {
		int x = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from review");

			rs = pstmt.executeQuery();

			if (rs.next())
				x = rs.getInt(1);
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getListCount 에러 : " + ex);
		} finally {

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
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return x;
	}

	public List<ReviewVO> getreviewList(String id) {
		String sql = "select * from review where user_id=?";

		List<ReviewVO> list = new ArrayList<ReviewVO>();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewVO reiew = new ReviewVO();
				reiew.setREVIEW_NUMBER(rs.getInt("REVIEW_NUMBER"));
				reiew.setMOVIE_ID(rs.getInt("MOVIE_ID"));
				reiew.setUSER_ID(rs.getString("USER_ID"));
				reiew.setREVIEW_TITLE(rs.getString("REVIEW_TITLE"));
				reiew.setREVIEW_CONTENT(rs.getString("REVIEW_CONTENT"));
				reiew.setREVIEW_DATE(rs.getDate("REVIEW_DATE"));
				list.add(reiew);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getreviewList() 에러 : " + e);
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

	

	public boolean isReviewWriter(int num, String pass) {
		String review_sql = "select* from review where REVIEW_NUM=?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(review_sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next())
				if (pass.equals(rs.getString("REVIEW_PASS"))) {
					return true;
				}

		} catch (Exception e) {
			System.out.println("isreviewWriter()에러 :" + e);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
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
		return false;
	}

	// MovieDetail에 있는 리뷰 수정
	public boolean reviewModify(ReviewVO modifyreview) {
		String sql = "update review " + "set REVIEW_TITLE= ?,REVIEW_CONTENT=? " + " where USER_ID=? AND MOVIE_ID = ?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifyreview.getREVIEW_TITLE());
			pstmt.setString(2, modifyreview.getREVIEW_CONTENT());
			pstmt.setString(3, modifyreview.getUSER_ID());
			pstmt.setInt(4, modifyreview.getMOVIE_ID());
			int result = pstmt.executeUpdate();

			if (result == 1)
				return true;
		} catch (SQLException ex) {
			System.out.println("reviewModify() 에러 :" + ex);
			ex.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return false;
	}

	public List<ReviewVO> getreviewPrivateList(String userId, int page, int limit) {
		String sql = "SELECT * FROM(\r\n"
				+ "   SELECT ROWNUM R, REVIEW_NUMBER, id,name, poster ,USER_ID,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_DATE,\r\n"
				+ "   star, face FROM\r\n"
				+ "(SELECT REVIEW_NUMBER, review.MOVIE_ID id ,movie.MOVIE_NAME name, movie.movie_poster poster,USER_ID,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_DATE, (SELECT rating_star_value \r\n"
				+ "               FROM RATING_STAR \r\n" + "               WHERE USER_ID = review.user_id \r\n"
				+ "               and MOVIE_ID = review.movie_id) star,\r\n"
				+ "               (SELECT rating_face_value \r\n" + "               FROM RATING_FACE \r\n"
				+ "               WHERE USER_ID = review.user_id \r\n"
				+ "               and MOVIE_ID = review.movie_id) face\r\n" + "   FROM review,movie \r\n"
				+ "   where review.movie_id = movie.movie_id  and USER_ID=?\r\n"
				+ "   order by REVIEW_DATE DESC)) where R >=? and R <=?";

		List<ReviewVO> list = new ArrayList<ReviewVO>();

		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ReviewVO reiew = new ReviewVO();
				reiew.setREVIEW_NUMBER(rs.getInt(2));
				reiew.setMOVIE_ID(rs.getInt(3));
				reiew.setMOVIE_NAME(rs.getString(4));
				reiew.setMOVIE_POSTER(rs.getString(5));
				reiew.setUSER_ID(rs.getString(6));
				reiew.setREVIEW_TITLE(rs.getString(7));
				reiew.setREVIEW_CONTENT(rs.getString(8));
				reiew.setREVIEW_DATE(rs.getDate(9));
				reiew.setSTAR(rs.getInt(10));
				reiew.setFACE(rs.getInt(11));
				list.add(reiew);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getreviewList() 에러 : " + e);
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

	// 내리뷰모아보기 수정
	public boolean PriReviewModify(ReviewVO modifyprireview) {
		String sql = "update review " + "set REVIEW_TITLE= ?,REVIEW_CONTENT=? " + " where USER_ID=? AND MOVIE_ID = ?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifyprireview.getREVIEW_TITLE());
			pstmt.setString(2, modifyprireview.getREVIEW_CONTENT());
			pstmt.setString(3, modifyprireview.getUSER_ID());
			pstmt.setInt(4, modifyprireview.getMOVIE_ID());
			int result = pstmt.executeUpdate();

			if (result == 1)
				return true;
		} catch (SQLException ex) {
			System.out.println("reviewModify() 에러 :" + ex);
			ex.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return false;
	}

	// 내리뷰모아보기 삭제
	public boolean PriReviewDelete(int num) {

		String review_delete_sql = "delete from review where REVIEW_NUMBER = ?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(review_delete_sql);
			pstmt.setInt(1, num);

			int result = pstmt.executeUpdate();
			System.out.println(result + "리뷰 삭제 완료");
			if (result >= 1)
				return true;

		} catch (SQLException ex) {
			System.out.println("reviewDelete() 에러 :" + ex);
			ex.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return false;

	}

	// 회원이름 클릭했을 때 나오는 거
	public List<ReviewVO> getreviewUserList(String userId, int page, int limit) {
		String sql = "SELECT * FROM(\r\n"
				+ "   SELECT ROWNUM R, REVIEW_NUMBER, id, name, poster, USER_ID, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_DATE, \r\n"
				+ "   star, face FROM\r\n"
				+ "(SELECT REVIEW_NUMBER, review.MOVIE_ID id, movie.MOVIE_NAME name, movie.movie_poster poster,USER_ID,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_DATE, (SELECT rating_star_value \r\n"
				+ "               FROM RATING_STAR \r\n" + "               WHERE USER_ID = review.user_id \r\n"
				+ "               and MOVIE_ID = review.movie_id) star,\r\n"
				+ "               (SELECT rating_face_value \r\n" + "               FROM RATING_FACE \r\n"
				+ "               WHERE USER_ID = review.user_id \r\n"
				+ "               and MOVIE_ID = review.movie_id) face\r\n" + "   FROM review,movie \r\n"
				+ "   where review.movie_id = movie.movie_id and USER_ID=?  \r\n"
				+ "   order by REVIEW_DATE DESC)) where R >=? and R <=?";

		List<ReviewVO> list = new ArrayList<ReviewVO>();

		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ReviewVO reiew = new ReviewVO();
				reiew.setREVIEW_NUMBER(rs.getInt(2));
				reiew.setMOVIE_ID(rs.getInt(3));
				reiew.setMOVIE_NAME(rs.getString(4));
				reiew.setMOVIE_POSTER(rs.getString(5));
				reiew.setUSER_ID(rs.getString(6));
				reiew.setREVIEW_TITLE(rs.getString(7));
				reiew.setREVIEW_CONTENT(rs.getString(8));
				reiew.setREVIEW_DATE(rs.getDate(9));
				reiew.setSTAR(rs.getInt(10));
				reiew.setFACE(rs.getInt(11));
				list.add(reiew);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getreviewList() 에러 : " + e);
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

	

	// 내리뷰
	public int getPrivateListCount(String userId) {
		int x = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from review where user_id=?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if (rs.next())
				x = rs.getInt(1);

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getListCount 에러 : " + ex);
		} finally {

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
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return x;
	}

	public int getMovieListCount(int movieId) {
		int x = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from review where movie_id=?");
			pstmt.setInt(1, movieId);
			rs = pstmt.executeQuery();

			if (rs.next())
				x = rs.getInt(1);

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getMovieListCount 에러 : " + ex);
		} finally {

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
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return x;
	}

	// 좋아요
	public int addLike(int movieid, String userId, String likeId) {
		String sql = "select * from review_like where movie_id = ? and user_id = ? and like_id=?";

		int x = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieid);
			pstmt.setString(2, userId);
			pstmt.setString(3, likeId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 이미 좋아요 눌렀음
				x = -1;
			} else {
				String sql2 = "insert into review_like values(?,?,?)";
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, movieid);
				pstmt.setString(2, userId);
				pstmt.setString(3, likeId);

				x = pstmt.executeUpdate();

			}

		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("getMovieListCount 에러 : " + ex);
		} finally {

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
					e.printStackTrace();
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return x;

	}

	public List<ReviewVO> getreviewMovieList(String movieId, int page, int limit) {
		String sql = "SELECT * FROM(\r\n"
				+ "   SELECT ROWNUM R, REVIEW_NUMBER, id, name, poster, USER_ID, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_DATE, \r\n"
				+ "   star, face,likes FROM\r\n"
				+ "(SELECT REVIEW_NUMBER, review.MOVIE_ID id, movie.MOVIE_NAME name, movie.movie_poster poster,USER_ID,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_DATE, (SELECT rating_star_value \r\n"
				+ "               FROM RATING_STAR \r\n" + "               WHERE USER_ID = review.user_id \r\n"
				+ "               and MOVIE_ID = review.movie_id) star,\r\n"
				+ "               (SELECT rating_face_value \r\n" + "               FROM RATING_FACE \r\n"
				+ "               WHERE USER_ID = review.user_id \r\n"
				+ "               and MOVIE_ID = review.movie_id) face,\r\n" + "            (SELECT count(*) \r\n"
				+ "               FROM review_like \r\n" + "               WHERE USER_ID = review.user_id \r\n"
				+ "               and MOVIE_ID = review.movie_id) likes" + "   FROM review,movie \r\n"
				+ "   where review.movie_id = movie.movie_id  and review.MOVIE_ID=? \r\n"
				+ "   order by REVIEW_DATE DESC)) where R >=? and R <=?";

		List<ReviewVO> list = new ArrayList<ReviewVO>();

		int startrow = (page - 1) * limit + 1;
		// 읽기 시작할 row 번호(1 11 21 31 ...)
		int endrow = startrow + limit - 1;
		// 읽을 마지막 row 번호 (10 20 30 40 ...)

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, movieId);
			pstmt.setInt(2, startrow);
			pstmt.setInt(3, endrow);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				ReviewVO reiew = new ReviewVO();
				reiew.setREVIEW_NUMBER(rs.getInt(2));
				reiew.setMOVIE_ID(rs.getInt(3));
				reiew.setMOVIE_NAME(rs.getString(4));
				reiew.setMOVIE_POSTER(rs.getString(5));
				reiew.setUSER_ID(rs.getString(6));
				reiew.setREVIEW_TITLE(rs.getString(7));
				reiew.setREVIEW_CONTENT(rs.getString(8));
				reiew.setREVIEW_DATE(rs.getDate(9));
				reiew.setSTAR(rs.getInt(10));
				reiew.setFACE(rs.getInt(11));
				reiew.setLIKE(rs.getInt(12));
				list.add(reiew);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getreviewList() 에러: " + e);
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

	public List<ReviewVO> getreviewList(int page, int limit) {
		String sql = "SELECT * FROM(\r\n"
				+ "   SELECT ROWNUM R, REVIEW_NUMBER, id,name, poster ,USER_ID,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_DATE,\r\n"
				+ "   star, face, likes FROM\r\n"
				+ "(SELECT REVIEW_NUMBER, review.MOVIE_ID id ,movie.MOVIE_NAME name, movie.movie_poster poster,USER_ID,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_DATE, (SELECT rating_star_value \r\n"
				+ "               FROM RATING_STAR \r\n" + "               WHERE USER_ID = review.user_id \r\n"
				+ "               and MOVIE_ID = review.movie_id) star,\r\n"
				+ "               (SELECT rating_face_value \r\n" + "               FROM RATING_FACE \r\n"
				+ "               WHERE USER_ID = review.user_id \r\n"
				+ "               and MOVIE_ID = review.movie_id) face,\r\n" + "            (SELECT count(*) \r\n"
				+ "               FROM review_like \r\n" + "               WHERE USER_ID = review.user_id \r\n"
				+ "               and MOVIE_ID = review.movie_id) likes" + "   FROM review,movie \r\n"
				+ "   where review.movie_id = movie.movie_id  \r\n"
				+ "   order by REVIEW_DATE DESC)) where R >=? and R <=?";

		List<ReviewVO> list = new ArrayList<ReviewVO>();

		int startrow = (page - 1) * limit + 1;
		// 읽기 시작할 row 번호(1 11 21 31 ...)
		int endrow = startrow + limit - 1;
		// 읽을 마지막 row 번호 (10 20 30 40 ...)

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);

			System.out.println(startrow + "," + endrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ReviewVO reiew = new ReviewVO();
				reiew.setREVIEW_NUMBER(rs.getInt(2));
				reiew.setMOVIE_ID(rs.getInt(3));
				reiew.setMOVIE_NAME(rs.getString(4));
				reiew.setMOVIE_POSTER(rs.getString(5));
				reiew.setUSER_ID(rs.getString(6));
				reiew.setREVIEW_TITLE(rs.getString(7));
				reiew.setREVIEW_CONTENT(rs.getString(8));
				reiew.setREVIEW_DATE(rs.getDate(9));
				reiew.setSTAR(rs.getInt(10));
				reiew.setFACE(rs.getInt(11));
				reiew.setLIKE(rs.getInt(12));
				list.add(reiew);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getreviewList() 에러: " + e);
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
}