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
			System.out.println("DB ���� ���� : " + ex);
		}
	}

	public boolean reviewInsert(ReviewVO reviewdata) {
		String sql = "";
		boolean result = false;
		try {
			con = ds.getConnection();
			sql = "insert into review " + "(REVIEW_NUMBER, "
					+ " MOVIE_ID, USER_ID, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_DATE) "
					+ " values((select nvl(max(REVIEW_NUMBER),0)+1 from review)," + " ?,?,?,?, "
					+ " sysdate)";

			// ���ο� ���� ����ϴ� �κ�
			pstmt = con.prepareStatement(sql);
		
			pstmt.setInt(1, reviewdata.getMOVIE_ID());
			pstmt.setString(3, reviewdata.getREVIEW_TITLE());
			pstmt.setString(4, reviewdata.getREVIEW_CONTENT());
		

			int result2 = pstmt.executeUpdate();

			if (result2 == 1) {
				System.out.println("������ ���� �Ϸ�");
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
			System.out.println("getListCount ���� : " + ex);
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
//�����ϱ�
	public List<ReviewVO> getreviewList(int page, int limit) {

		// page ������
		// limit �������� ��� ��
		// review_RE_REF desc, review_RE_SEQ asc�� ���� ������ ���� �������� �´� rnum
		String review_list_sql = "select * " + "from (select rownum rnum, b.* " + " from (select* from review "
				+ " order by review_RE_REF desc," + " review_RE_SEQ asc) b" + ") " + "where rnum>=? and rnum<=?";

		List<ReviewVO> list = new ArrayList<ReviewVO>();
		// �� �������� 10���� ����� ��� 1������, 2������, 3������...
		int startrow = (page - 1) * limit + 1;
		// �б� ������ row��ȣ (1 11 21 31...)
		int endrow = startrow + limit - 1;
		// ���� ������ row��ȣ (10 20 30 40...)

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(review_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();

			// DB���� ������ �����͸� VO��ü�� ���
			while (rs.next()) {
				ReviewVO review = new ReviewVO();
				review.setREVIEW_NUMBER(rs.getInt("review_number"));
				review.setMOVIE_ID(rs.getInt("movie_id"));
				review.setUSER_ID(rs.getString("user_id"));
				review.setREVIEW_TITLE(rs.getString("review_title"));
				review.setREVIEW_CONTENT(rs.getString("review_content"));
				review.setREVIEW_DATE(rs.getDate("review_date"));
				list.add(review); // ���� ���� ��ü�� ����Ʈ�� ����.
			}
			return list; // ���� ���� ��ü�� ������ ����Ʈ�� ȣ���� ������ ������.
		} catch (Exception e) {
			System.out.println("getreviewList() ���� : " + e);
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

	

	// �� ���� ����
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
			System.out.println("getreviewList() ���� : " + e);
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
			System.out.println("isreviewWriter()����:" + e);
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
			System.out.println("reviewModify()����:" + ex);
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
	//�� �κ�?? �����ϱ�
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
				System.out.println(result + "�� �����Ǿ���!");
				if (result >= 1)
					return true;
			}
			
		} catch (SQLException ex) {
			System.out.println("reviewDelete()����:" + ex);
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