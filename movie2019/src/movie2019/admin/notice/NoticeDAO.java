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
			String sql = "insert into NOTICE(NOTICE_NUMBER," 
					+ "NOTICE_NAME, NOTICE_SUBJECT, "
					+ "NOTICE_CONTENT, NOTICE_DATE) "
					+ "values((select nvl(max(NOTICE_NUMBER),0)+1 from NOTICE)," 
					+ "?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
		//	pstmt.setInt(1, nv.getNOTICE_NUMBER());
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
			pstmt = con.prepareStatement("select count(*) from NOTICE");
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
	
		String sql = "select * from ("
				+ "select rownum rnum, b.* from ("
				+ "select * from NOTICE order by NOTICE_NUMBER DESC) b) "
				+ "where rnum>=? and rnum<=? order by NOTICE_DATE DESC";
		

		List<NoticeVO> list = new ArrayList<NoticeVO>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				NoticeVO notice = new NoticeVO();
				notice.setNOTICE_NUMBER(rs.getInt("NOTICE_NUMBER"));
				notice.setNOTICE_NAME(rs.getString("NOTICE_NAME"));
				notice.setNOTICE_SUBJECT(rs.getString("NOTICE_SUBJECT"));
				notice.setNOTICE_CONTENT(rs.getString("NOTICE_CONTENT"));
				notice.setNOTICE_DATE(rs.getDate("NOTICE_DATE"));
				list.add(notice);
			}
			return list; 
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
			pstmt = con.prepareStatement("select * from NOTICE where NOTICE_NUMBER=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				notice = new NoticeVO();
				notice.setNOTICE_NUMBER(rs.getInt("NOTICE_NUMBER"));
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
		String sql = "update NOTICE set NOTICE_SUBJECT=?, NOTICE_CONTENT=? where NOTICE_NUMBER=?";

		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, modifyNotice.getNOTICE_SUBJECT());
			pstmt.setString(2, modifyNotice.getNOTICE_CONTENT());
			pstmt.setInt(3, modifyNotice.getNOTICE_NUMBER());
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
		String sql="delete from NOTICE where NOTICE_NUMBER=? ";
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			int result=pstmt.executeUpdate();

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
