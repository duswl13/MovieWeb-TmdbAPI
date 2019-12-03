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
			System.out.println("DB 연결 실패 : " + ex);
		}
	}

	public boolean reviewInsert(ReviewVO reviewdata) {
		String sql = "";
		boolean result = false;
		try {
			con = ds.getConnection();
			sql = "insert into review " + "(REVIEW_NUMBER, "
					+ " MOVIE_ID, USER_ID, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_DATE) "
					+ " values((select nvl(max(review_NUM),0)+1 from review)," + " ?,?,?,?, "
					+ " sysdate)";

			// 새로운 글을 등록하는 부분
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reviewdata.getREVIEW_NUMBER());
			pstmt.setInt(2, reviewdata.getMOVIE_ID());
			pstmt.setString(3, reviewdata.getREVIEW_TITLE());
			pstmt.setString(4, reviewdata.getREVIEW_CONTENT());
			pstmt.setDate(5, reviewdata.getREVIEW_DATE());

			int result2 = pstmt.executeUpdate();

			if (result2 == 1) {
				System.out.println("데이터 삽입 완료");
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
//수정하기
	public List<ReviewVO> getreviewList(int page, int limit) {

		// page 페이지
		// limit 페이지당 목록 수
		// review_RE_REF desc, review_RE_SEQ asc에 의해 정렬한 것을 조건절에 맞는 rnum
		String review_list_sql = "select * " + "from (select rownum rnum, b.* " + " from (select* from review "
				+ " order by review_RE_REF desc," + " review_RE_SEQ asc) b" + ") " + "where rnum>=? and rnum<=?";

		List<ReviewVO> list = new ArrayList<ReviewVO>();
		// 한 페이지당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지...
		int startrow = (page - 1) * limit + 1;
		// 읽기 시작할 row번호 (1 11 21 31...)
		int endrow = startrow + limit - 1;
		// 읽을 마지막 row번호 (10 20 30 40...)

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(review_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();

			// DB에서 가져온 데이터를 VO객체에 담기
			while (rs.next()) {
				ReviewVO review = new ReviewVO();
				review.setREVIEW_NUMBER(rs.getInt("review_number"));
				review.setMOVIE_ID(rs.getInt("movie_id"));
				review.setUSER_ID(rs.getString("user_id"));
				review.setREVIEW_TITLE(rs.getString("review_title"));
				review.setREVIEW_CONTENT(rs.getString("review_content"));
				review.setREVIEW_DATE(rs.getDate("review_date"));
				list.add(review); // 값을 담은 객체를 리스트에 저장.
			}
			return list; // 값을 담은 객체를 저장한 리스트를 호출한 곳으로 가져감.
		} catch (Exception e) {
			System.out.println("getreviewList() 에러 : " + e);
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
		return null;
	}

	

	// 글 내용 보기
	public ReviewVO getDetail(int num) {
		ReviewVO review = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select* from review where REVIEW_NUMBER = ?");

			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				review = new ReviewVO();

				review.setREVIEW_NUMBER(rs.getInt("review_number"));
				review.setMOVIE_ID(rs.getInt("movie_id"));
				review.setUSER_ID(rs.getString("user_id"));
				review.setREVIEW_TITLE(rs.getString("review_title"));
				review.setREVIEW_CONTENT(rs.getString("review_content"));
				review.setREVIEW_DATE(rs.getDate("review_date"));

			}
			return review;
		} catch (Exception e) {
			System.out.println("getreviewList() 에러 : " + e);
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
			System.out.println("isreviewWriter()에러:" + e);
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

	public boolean reviewModify(ReviewVO modifyreview) {
		String sql = "update review " 
				+ "set REVIEW_SUBJECT= ?,REVIEW_CONTENT=? " 
				+ " where REVIEW_NUM=? ";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifyreview.getREVIEW_TITLE());
			pstmt.setString(2, modifyreview.getREVIEW_CONTENT());
			pstmt.setInt(3, modifyreview.getREVIEW_NUMBER());
			int result = pstmt.executeUpdate();

			if (result == 1)
				return true;
		} catch (SQLException ex) {
			System.out.println("reviewModify()에러:" + ex);
			ex.printStackTrace();			
		}finally {
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
	//이 부분?? 수정하기
	public boolean reviewDelete(int num) {
		String select_sql = "select REVIEW_NUMBER, MOVIE_ID, USER_ID, "
						+ "REVIEW_TITLE, REVIEW_CONTENT, REVIEW_DATE "
						+ "from review "
						+ "where review_NUM = ? ";

		String review_delete_sql = "delete from review "
						+ "REVIEW_NUMBER, MOVIE_ID, USER_ID, "
						+ "REVIEW_TITLE, REVIEW_CONTENT, REVIEW_DATE "
						+ "from review "
						+ "where review_NUM = ? ";
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(select_sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			int review_RE_REF=0, review_RE_LEV=0, review_RE_SEQ=0;
			
			if (rs.next()) {
				review_RE_REF = rs.getInt("review_RE_REF");
				review_RE_LEV = rs.getInt("review_RE_LEV");
				review_RE_SEQ = rs.getInt("review_RE_SEQ");
				
				pstmt = con.prepareStatement(review_delete_sql);
				pstmt.setInt(1, review_RE_REF);
				pstmt.setInt(2, review_RE_LEV);
				pstmt.setInt(3, review_RE_SEQ);
				
				pstmt.setInt(4, review_RE_REF);
				pstmt.setInt(5, review_RE_LEV);
				pstmt.setInt(6, review_RE_SEQ);
				
				pstmt.setInt(7, review_RE_REF);

				int result = pstmt.executeUpdate();
				System.out.println(result + "개 삭제되었다!");
				if (result >= 1)
					return true;
			}
			
		} catch (SQLException ex) {
			System.out.println("reviewDelete()에러:" + ex);
			ex.printStackTrace();			
		}finally {
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
}