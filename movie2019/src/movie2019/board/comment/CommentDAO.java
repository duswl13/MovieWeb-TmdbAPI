package movie2019.board.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class CommentDAO {
	//데이터 베이스 작업에 필요한 변수 참조
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//생성자에서 리소스 참조하여 connection 객체 얻어온다
	public CommentDAO(){
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}

	//글의 갯수 구하기
	public int getListCount(int BOARD_RE_REF) {
		int x = 0;
		String sql = "select count(*) "
				   + "from bcomments where BOARD_RE_REF = ?";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, BOARD_RE_REF);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("getListCount 에러="+e);
		
	    }finally {
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
	  return x;
  }

	//댓글 목록 가져가기
	public JsonArray getCommentList(int BOARD_RE_REF) {
		String sql = "select num, id, content, reg_date "
				   + "from bcomments where BOARD_RE_REF = ? "
				   + "order by reg_date desc";
		JsonArray array = new JsonArray();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, BOARD_RE_REF);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JsonObject object = new JsonObject();
				object.addProperty("num", rs.getInt(1));
				object.addProperty("id", rs.getString(2));
				object.addProperty("content", rs.getString(3));
                object.addProperty("reg_date", rs.getString(4));
                array.add(object);
                }
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("getCommentList 에러="+e);
		}finally {
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
		return array;
	}

	//댓글 등록하기
	public int commentsInsert(CommentVO c) throws Exception{
        int result = 0;
        
        try {
        	con = ds.getConnection();
        	
        	String sql = "insert into bcomments "
        			   + "(num, id, content, reg_date, BOARD_RE_REF) "
        			   + "values(com_seq.nextval,?,?,sysdate,?)";
        	
        	//새로운 글을 등록하는 부분
        	pstmt = con.prepareStatement(sql);
        	pstmt.setString(1, c.getId());
        	pstmt.setString(2, c.getContent());
        	pstmt.setInt(3, c.getBoard_re_ref());
        	result = pstmt.executeUpdate();
        	if(result==1)
        		System.out.println("데이터 삽입 완료");
        	
        }finally {
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

	//댓글 수정
	public int commentsUpdate(CommentVO co) throws Exception {
		int result = 0;
		
		try {
			con = ds.getConnection();
			String sql = "update bcomments set content = ? "
					   + "where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, co.getContent());
			pstmt.setInt(2, co.getNum());
			
			result = pstmt.executeUpdate();
			if(result==1)
			System.out.println("데이터 수정 완료");
		}finally {
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

	//댓글 삭제
	public int commentsDelete(int num) throws Exception {
        int result = 0;
        
        try {
        	con = ds.getConnection();
        	
        	String sql = "delete bcomments where num = ?";
        	
        	pstmt = con.prepareStatement(sql);
        	pstmt.setInt(1, num);
        	result = pstmt.executeUpdate();
        	if(result==1) {
        		System.out.println("데이터 삭제 완료");
        	}
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
 
}
