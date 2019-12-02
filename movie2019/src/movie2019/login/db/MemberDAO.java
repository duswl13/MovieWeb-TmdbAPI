package movie2019.login.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	int result;

	public MemberDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}

	public int isId(String id) {
		try {
			con = ds.getConnection();
			System.out.println("getConnection");

			String sql = "select id from users where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 0; // DB에 해당 ID가 있습니다.
			} else {
				result = -1; // DB에 해당 ID가 있습니다.
			}
		} catch (Exception e) {
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
		return result;
	}

	public int insertMember(Member m) {
		try {
			con = ds.getConnection();
			System.out.println("getConnection");

			pstmt = con.prepareStatement("insert into users values (?,?,?,?,?,?)");
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getName());
			pstmt.setInt(4, m.getAge());
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getEmail());

			result = pstmt.executeUpdate();

			//
		} catch (Exception e) {
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
		return result;
	}

	public int isId(String id, String pass) {
		try {
			con = ds.getConnection();
			System.out.println("getConnection");

			String sql = "select id, password from users where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString(2).equals(pass)) {
					result = 1; // 아이디, 비번 둘 다 일치하는 경우
				} else {
					result = 0; // 비밀번호 일치하지 않는 경우
				}
			} else {
				result = -1; // 아이디 존재X
			}
		} catch (Exception e) {
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
		return result;
	}

	public Member member_info(String id) {
		Member m = null;

		try {
			con = ds.getConnection();
			String sql = "select* from users where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				m = new Member();
				m.setId(rs.getString(1));
				m.setPassword(rs.getString(2));
				m.setName(rs.getString(3));
				m.setAge(rs.getInt(4));
				m.setGender(rs.getString(5));
				m.setEmail(rs.getString(6));
			}
		} catch (Exception e) {
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
		return m;
	}

	public int update(Member m) {
		int result = 0;
		try {
			con = ds.getConnection();

			String sql = "update users set name=?, " 
					+ "age=?, gender=?, email=? " 
					+ "where id=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getName());
			pstmt.setInt(2, m.getAge());
			pstmt.setString(3, m.getGender());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getId());
			result = pstmt.executeUpdate();

		} catch (

		Exception e) {
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
		return result;
	}

	
	
	public List<Member> getList() {
		List<Member> list = new ArrayList<Member>();
		
		try {
			con = ds.getConnection();
			
			String sql = "select* from users where id != 'admin'";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			/*
			create table member (
			id varchar2(15),
			password varchar2(10),
			name varchar2(15),
			age Number,
			gender varchar2(5),
			email varchar2(30),
			primary key(id)
			);
			 */
			
		while (rs.next()) {
			Member m = new Member();
			m.setId(rs.getString(1));
			m.setPassword(rs.getString(2));
			m.setName(rs.getString(3));
			m.setAge(rs.getInt(4));
			m.setGender(rs.getString(5));
			m.setEmail(rs.getString(6));
			list.add(m);  //시험! 문제해결 시나리오 (Arraylist인데 add가 없음)
		}
		
		} catch (

				Exception e) {
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
				return list;
			}

	public int getListCount() {
		int x = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from users where id != 'admin'");

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

	public List<Member> getList(int page, int limit) {
	
		
			List<Member> list = new ArrayList<Member>();
			String sql = "select * " + "from (select b.*, rownum rnum" 
											+ " from (select* from users "
											+ " where id != 'admin'"
									 		+ " order by id) b"
											+ ")"
											+ "where rnum>=? and rnum<=?";
		
			int startrow = (page - 1) * limit + 1;
			int endrow = startrow + limit - 1;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startrow);
				pstmt.setInt(2, endrow);
				rs = pstmt.executeQuery();
				
			while (rs.next()) {
				Member m = new Member();
				m.setId(rs.getString(1));
				m.setPassword(rs.getString(2));
				m.setName(rs.getString(3));
				m.setAge(rs.getInt(4));
				m.setGender(rs.getString(5));
				m.setEmail(rs.getString(6));
				list.add(m); // 값을 담은 객체를 리스트에 저장.
			}
			return list; // 값을 담은 객체를 저장한 리스트를 호출한 곳으로 가져감.
		} catch (Exception e) {
			System.out.println("getMemberList() 에러 : " + e);
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

	
	public int delete(String id) {
		
		result = 0;
		try {
			con = ds.getConnection();
			
			String sql = "delete from users where id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("geMemberList() 에러 : " + e);
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
		return result;
	}

	
	
	public int getListCount(String field, String value) {
		int x = 0;
		
		try {
			con = ds.getConnection();
			String sql = "select count(*) from users "
					+ " where id !='admin' "
					+ "and "
					+ field
					+ " like ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + value + "%");
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

	
	public List<Member> getList(String field, String value, int page, int limit){
	      List<Member> list = new ArrayList<Member>();
	      try {
	         con = ds.getConnection();
	         
	         String sql = 
	               "select * "
	               +"from (select b.*, rownum rnum"
	                     +" from (select * from users "
	                     +" where id != 'admin' "
	                     +" and "+field + " like ?"
	                     +" order by id) b"
	                     +" )"
	                     +" where rnum between ? and ?";
	         
	         
	         // 한 페이지 당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지 ...
	         int startrow = (page - 1) * limit + 1;
	         // 읽기 시작할 row 번호(1 11 21 31 ...)
	         int endrow = startrow + limit - 1;
	         // 읽을 마지막 row 번호 (10 20 30 40 ...)
	         
	      
	            con = ds.getConnection();
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1,"%"+value+"%");
	            pstmt.setInt(2, startrow);
	            pstmt.setInt(3, endrow);
	            rs = pstmt.executeQuery();
	            
	            
	            // DB에서 가져온 데이터를 VO 객체에 담습니다.
	            while (rs.next()) {
	               Member member = new Member();
	               member.setId(rs.getString(1));
	               member.setPassword(rs.getString(2));
	               member.setName(rs.getString(3));
	               member.setAge(rs.getInt(4));
	               member.setGender(rs.getString(5));
	               list.add(member); // 값을 담은 객체를 리스트에 저장합니다.
	            }
	            

	         } catch (SQLException e) {
	            e.printStackTrace();
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
	         return list; // 값을 담은 객체를 리스트를 호출한 곳으로 가져갑니다.

	      }

}
