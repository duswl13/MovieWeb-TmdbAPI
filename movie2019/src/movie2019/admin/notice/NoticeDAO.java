package movie2019.admin.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoticeDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	int result;
	Boolean bool;

	public NoticeDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}
	public boolean NoticeInsert(NoticeVO nv) {
		try {
			con = ds.getConnection();
			String sql = "insert into NOTICE_TBL(NOTICE_NUM," 
					+ "NOTICE_NAME, NOTICE_SUBJECT, "
					+ "NOTICE_CONTENT, NOTICE_DATE) "
					+ "values((select nvl(max(NOTICE_NUM),0)+1 from NOTICE_TBL)," 
					+ "?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
		//	pstmt.setInt(1, nv.getNOTICE_NUM());
			pstmt.setString(1, nv.getNOTICE_NAME());
			pstmt.setString(2, nv.getNOTICE_SUBJECT());
			pstmt.setString(3, nv.getNOTICE_CONTENT());
//			pstmt.setDate(4, nv.getNOTICE_DATE());
	
			result = pstmt.executeUpdate();
			System.out.println("TESTdoa=>" + nv.getNOTICE_NAME());
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
			pstmt = con.prepareStatement("select count(*) from NOTICE_TBL");
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

	public List<NoticeVO> getNoticeList(int page, int limit) {
		// page : 페이지
		// limit : 페이지 당 목록의 수
		// NOTICE_RE_REF desc, NOTICE_RE_SEQ asc에 의해 정렬한 것을
		// 조건절에 맞는 rnum의 범위 만큼 가져오는 쿼리문입니다.

		String sql = "select * from NOTICE_TBL"
				+ "	where NOTICE_NUM>=? and NOTICE_NUM<=?";

		List<NoticeVO> list = new ArrayList<NoticeVO>();
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
				NoticeVO notice = new NoticeVO();
				notice.setNOTICE_NUM(rs.getInt("NOTICE_NUM"));
				notice.setNOTICE_NAME(rs.getString("NOTICE_NAME"));
				notice.setNOTICE_SUBJECT(rs.getString("NOTICE_SUBJECT"));
				notice.setNOTICE_CONTENT(rs.getString("NOTICE_CONTENT"));
				notice.setNOTICE_DATE(rs.getDate("NOTICE_DATE"));
				list.add(notice);
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

	
	public NoticeVO getDetail(int num) {
		NoticeVO notice = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from NOTICE_TBL where NOTICE_NUM=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				notice = new NoticeVO();
				notice.setNOTICE_NUM(rs.getInt("NOTICE_NUM"));
				notice.setNOTICE_NAME(rs.getString("NOTICE_NAME"));
				notice.setNOTICE_SUBJECT(rs.getString("NOTICE_SUBJECT"));
				notice.setNOTICE_CONTENT(rs.getString("NOTICE_CONTENT"));
				// NOTICE.setNOTICE_DATE(rs.getDate("NOTICE_DATE"));
			}
			return notice;
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


	public Boolean NoticeModify(NoticeVO modifyNotice) {
		String sql = "update NOTICE_TBL set NOTICE_SUBJECT=?, NOTICE_CONTENT=? where NOTICE_NUM=?";

		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, modifyNotice.getNOTICE_SUBJECT());
			pstmt.setString(2, modifyNotice.getNOTICE_CONTENT());
			pstmt.setInt(3, modifyNotice.getNOTICE_NUM());
			int result=pstmt.executeUpdate();
			if(result==1)
				return true;
		}catch(SQLException ex) {
			System.out.println("NOTICEModify() 에러"+ex);
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
	
	public Boolean noticeDelete(int num) {
		String sql="delete from NOTICE_TBL where NOTICE_NUM=? ";
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
