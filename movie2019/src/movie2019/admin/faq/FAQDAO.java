package movie2019.admin.faq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FAQDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	int result;
	Boolean bool;

	public FAQDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}
	public boolean FAQInsert(FAQVO nv) {
		try {
			con = ds.getConnection();
			String sql = "insert into FAQ(FAQ_NUMBER," 
					+ "FAQ_NAME, FAQ_SUBJECT, "
					+ "FAQ_CONTENT, FAQ_DATE) "
					+ "values((select nvl(max(FAQ_NUMBER),0)+1 from FAQ)," 
					+ "?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
		//	pstmt.setInt(1, nv.getFAQ_NUMBER());
			pstmt.setString(1, nv.getFAQ_NAME());
			pstmt.setString(2, nv.getFAQ_SUBJECT());
			pstmt.setString(3, nv.getFAQ_CONTENT());
//			pstmt.setDate(4, nv.getFAQ_DATE());
	
			result = pstmt.executeUpdate();
			System.out.println("TESTdoa=>" + nv.getFAQ_NAME());
			if (result == 1) {
				bool = true;
			} else {
				bool = false;
			}
		} catch (java.sql.SQLIntegrityConstraintViolationException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		return bool;
	}

	public int getListCount() {
		int x = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from FAQ");
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

	public List<FAQVO> getFAQList(int page, int limit) {
		// page : 페이지
		// limit : 페이지 당 목록의 수
		// FAQ_RE_REF desc, FAQ_RE_SEQ asc에 의해 정렬한 것을
		// 조건절에 맞는 rnum의 범위 만큼 가져오는 쿼리문입니다.

		String sql = "select * from FAQ"
				+ "	where FAQ_NUMBER>=? and FAQ_NUMBER<=?";

		List<FAQVO> list = new ArrayList<FAQVO>();
		// 한 페이지당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지...
		int startrow = (page - 1) * limit + 1;
		// 읽기 시작할 row 번호( 1 11 21 31 ...
		int endrow = startrow + limit - 1;
		// 읽을 마지막 row 번호(10 20 30 40 ...

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();

			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while (rs.next()) {
				FAQVO faq = new FAQVO();
				faq.setFAQ_NUMBER(rs.getInt("FAQ_NUMBER"));
				faq.setFAQ_NAME(rs.getString("FAQ_NAME"));
				faq.setFAQ_SUBJECT(rs.getString("FAQ_SUBJECT"));
				faq.setFAQ_CONTENT(rs.getString("FAQ_CONTENT"));
				faq.setFAQ_DATE(rs.getDate("FAQ_DATE"));
				list.add(faq);
			}
			return list; // 값을 담을 객체를 저장한 리스트를 호출한 곳으로 가져갑니다.
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
		return null;
	}

	
	public FAQVO getDetail(int num) {
		FAQVO faq = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from FAQ where FAQ_NUMBER=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				faq = new FAQVO();
				faq.setFAQ_NUMBER(rs.getInt("FAQ_NUMBER"));
				faq.setFAQ_NAME(rs.getString("FAQ_NAME"));
				faq.setFAQ_SUBJECT(rs.getString("FAQ_SUBJECT"));
				faq.setFAQ_CONTENT(rs.getString("FAQ_CONTENT"));
				// FAQ.setFAQ_DATE(rs.getDate("FAQ_DATE"));
			}
			return faq;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getDetail() 에러: " + e);
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


	public Boolean FAQModify(FAQVO modifyFAQ) {
		String sql = "update FAQ set FAQ_SUBJECT=?, FAQ_CONTENT=? where FAQ_NUMBER=?";

		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, modifyFAQ.getFAQ_SUBJECT());
			pstmt.setString(2, modifyFAQ.getFAQ_CONTENT());
			pstmt.setInt(3, modifyFAQ.getFAQ_NUMBER());
			int result=pstmt.executeUpdate();
			if(result==1)
				return true;
		}catch(SQLException ex) {
			System.out.println("FAQModify() 에러"+ex);
		}
			finally {
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
	
	public Boolean faqDelete(int num) {
		String sql="delete from FAQ where FAQ_NUMBER=? ";
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			int result=pstmt.executeUpdate();

			System.out.println(result+"개 삭제 되었습니다.");
			if(result>=1)
				return true;
			
		}catch(SQLException ex) {
			System.out.println("boardDelete() 에러"+ex);
		}
			finally {
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
