package movie2019.admin.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	int result;
	
	public UserDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}
	
	public int isId(String id) {
		try {
			con=ds.getConnection();
			System.out.println("getConnection");
			
			String sql="select id from users where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=0;		//DB에 해당 ID가 있습니다.
			}else {
				result=-1;		//DB에 해당 ID가 없습니다.
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) {
				try {
					pstmt.close();
				}catch(SQLException ex){
					ex.printStackTrace();					
				}
			}
			if(con!=null) {
				try {
					con.close();
				}catch(SQLException ex) {
					ex.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				}catch(SQLException ex) {
					ex.printStackTrace();
				}
			}
		}
		return result;
	}
	

	public Users user_info(String id) {
		Users m= null;
		try {
			con=ds.getConnection();			
			String sql= "select * from USERS where USER_ID=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				m=new Users();
				m.setUSER_ID(rs.getString(1));
				m.setUSER_PASS(rs.getString(2));
				m.setUSER_NICKNAME(rs.getString(3));
				m.setUSER_EMAIL(rs.getString(4));
				m.setUSER_JOIN_DATE(rs.getDate(5));
				m.setUSER_PHONE(rs.getString(6));
				m.setUSER_TYPE(rs.getString(7));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					pstmt.close();
				}catch(SQLException ex){
					ex.printStackTrace();					
				}
			}
			if(con!=null) {
				try {
					con.close();
				}catch(SQLException ex) {
					ex.printStackTrace();
				}
			}
		}
		return m;
	}


	public List<Users> getList(){
		List<Users> list = new ArrayList<Users>();
		try {
			con = ds.getConnection();
			String sql = "select * from users";

			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();

			while(rs.next()) {
				Users m = new Users();
				m.setUSER_ID(rs.getString(1));
				m.setUSER_PASS(rs.getString(2));
				m.setUSER_NICKNAME(rs.getString(3));
				m.setUSER_EMAIL(rs.getString(4));
				m.setUSER_JOIN_DATE(rs.getDate(5));
				m.setUSER_PHONE(rs.getString(6));
				m.setUSER_TYPE(rs.getString(7));
				list.add(m);
			}


		//primary key 제약조건을 위반했을 경우 발생하는 에러
		} catch(java.sql.SQLIntegrityConstraintViolationException e) {
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
		return list;
	}
	
	public int getListCount() {
		int x = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from users");
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

	public List<Users> getList(int page, int limit) {
		

		 String sql = "select * "
			      +" from (select b.*, rownum rnum " 
			      + " from (select * from users "
			      +" order by user_id) b"
			      +" )"
			      +" where rnum >=? and rnum <= ?";

		

		List<Users> list = new ArrayList<Users>();

		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();

			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while (rs.next()) {
				Users user = new Users();
				user.setUSER_ID(rs.getString("USER_ID"));
				user.setUSER_PASS(rs.getString("USER_PASS"));
				user.setUSER_NICKNAME(rs.getString("USER_NICKNAME"));
				user.setUSER_EMAIL(rs.getString("USER_EMAIL"));
				user.setUSER_JOIN_DATE(rs.getDate("USER_JOIN_DATE"));
				user.setUSER_PHONE(rs.getString("USER_PHONE"));
				user.setUSER_TYPE(rs.getString("USER_TYPE"));

				list.add(user);
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

	public int delete(String id) {
		result=0;
		try {
			con=ds.getConnection();
			
			String sql="delete from users where USER_ID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			result=pstmt.executeUpdate();
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
		return result;
	}

}
