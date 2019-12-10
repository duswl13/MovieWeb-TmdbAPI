package movie2019.board.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

import movie2019.login.db.Member;




public class BoardDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public BoardDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}

	//글 작성 
	public boolean boardInsert(BoardVO boarddata) {
		String sql = "";
		boolean result = false;

		try {
			con = ds.getConnection();
			System.out.println("getConnection");

			sql = "insert into MBOARD(" + "BOARD_NUM, BOARD_NAME, BOARD_PASS,"
					+ "BOARD_SUBJECT, BOARD_CONTENT, BOARD_FILE," + "BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ,"
					+ "BOARD_READCOUNT, BOARD_DATE) " + "values((select nvl(max(BOARD_NUM),0)+1 from mboard),"
					+ "?,?,?,?," // board_content까지
					+ "?,(select nvl(max(BOARD_NUM),0)+1 from mboard)," // board_re_ref까지
					+ "?,?,?,sysdate)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boarddata.getBOARD_NAME());
			pstmt.setString(2, boarddata.getBOARD_PASS());
			pstmt.setString(3, boarddata.getBOARD_SUBJECT());
			pstmt.setString(4, boarddata.getBOARD_CONTENT());
			pstmt.setString(5, boarddata.getBOARD_FILE());

			// 원문의 경우 BOARD_RE_LEV, BOARD_RE_SEQ 필드 값은 0
			pstmt.setInt(6, 0); 
			pstmt.setInt(7, 0); 
			pstmt.setInt(8, 0); 

			int result2 = pstmt.executeUpdate();

			// result2가 1이면 성공이라 true반환,0이면 실패라 false
			if (result2 == 1) {
				System.out.println("데이터 삽입이 완료되었습니다.");
				result = true;
			}

		} catch (Exception e) {
			System.out.println("boardInsert()에러:" + e);
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

	public int getListCount() {
		int x = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from mboard");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getListCount()에러:" + e);
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

		return x;
	}

	// 글 목록 보기
	public List<BoardVO> getBoardList(int page, int limit) {
	
		String board_list_sql = "select * " 
		                      + "from (select rownum rnum, b.* " 
				              + " from (select * from mboard "
				              + " order by BOARD_RE_REF desc," 
				              + " BOARD_RE_SEQ asc) b) " 
				              + "where rnum>=? and rnum<=?";

		List<BoardVO> list = new ArrayList<BoardVO>();
		// 한 페이지당 10개씩 목록인 경우 1페이지,2페이지, 3페이지 ...
		int startrow = (page - 1) * limit + 1;
		// 읽기 시작할 row 번호(1, 11, 21 ...)
		int endrow = startrow + limit - 1;
		// 읽을 마지막 row 번호(10, 20, 30...)

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();

			
			while (rs.next()) {
				BoardVO board = new BoardVO();
				board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				board.setBOARD_NAME(rs.getString("BOARD_NAME"));
				board.setBOARD_PASS(rs.getString("BOARD_PASS"));
				board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				// board.setBOARD_FILE(rs.getString("BOARD_FILE"));
				// board.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
				board.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
				// board.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
				board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				list.add(board); 
			}
			return list;

		} catch (Exception e) {
			System.out.println("getBoardList()에러:" + e);
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

	// 조회수 업데이트 : 글번호에 해당하는 조회수를 1 증가시킨다.
	public void setReadCountUpdate(int num) {
		String sql = "update MBOARD set " 
	               + "BOARD_READCOUNT = (BOARD_READCOUNT)+1 " 
				   + "where BOARD_NUM = ?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("setReadCountUpdate()에러:" + e);
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

	}

	public BoardVO getDetail(int num) {
		BoardVO board = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(
					"select * " + "from mboard " + "where BOARD_NUM = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = new BoardVO();
				// 필요한 것들만 가져와서 setter에 담음
				board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				board.setBOARD_NAME(rs.getString("BOARD_NAME"));
				board.setBOARD_PASS(rs.getString("BOARD_PASS"));
				board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				board.setBOARD_FILE(rs.getString("BOARD_FILE"));
				board.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF")); //답변 달 때 필요
				board.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV")); //답변 달 때 필요
				board.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ")); //답변 달 때 필요
				//board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT")); //조회수는 안보여줌
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
			}
			return board;
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
		} // finally
		return null;
	}// getDetail
	
	//글 답변
	   public int boardReply(BoardVO board) {
		   
		      String board_max_sql="select max(board_num) from mboard";
		    
		      int num=0;
		     
		      int re_ref=board.getBOARD_RE_REF();
		      System.out.println("re_Ref="+re_ref);
		     
		      int re_lev=board.getBOARD_RE_LEV();
		    
		      int re_seq=board.getBOARD_RE_SEQ();
		      
		      try {
		         con=ds.getConnection();
		         //트랜잭션을 이용하귀 위해서 setAutoCommit을 false로 설정
		         con.setAutoCommit(false);
		         
		         pstmt=con.prepareStatement(board_max_sql);
		         rs=pstmt.executeQuery();
		         if(rs.next())
		            num=rs.getInt(1)+1;   //답변 삽입할 글번호
		         
		         String update_sql="update mboard" 
		               + "         set BOARD_RE_SEQ = BOARD_RE_SEQ + 1" 
		               + "         where BOARD_RE_REF = ?" 
		               + "         and BOARD_RE_SEQ>?";
		         
		         pstmt=con.prepareStatement(update_sql);
		         pstmt.setInt(1, re_ref);
		         pstmt.setInt(2, re_seq);
		         int result1=pstmt.executeUpdate();
		         //등록할 답변 글의 BOARD_RE_LEV, BOARD_RE_SEQ 값을 원문 글보다 1씩 증가
		         re_seq=re_seq+1;
		         re_lev=re_lev+1;
		         
		         String insert_sql=" insert into mboard" 
		               + "    (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT," 
		               + "     BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF," 
		               + "     BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT," 
		               + "     BOARD_DATE) " 
		               + "        values(?,?,?,?,?," 
		               + "               ?,?,?," 
		               + "             ?,?,sysdate)";
		         
		         pstmt = con.prepareStatement(insert_sql);
		         pstmt.setInt(1, num);
		         pstmt.setString(2, board.getBOARD_NAME());
		         pstmt.setString(3, board.getBOARD_PASS());
		         pstmt.setString(4, board.getBOARD_SUBJECT());
		         pstmt.setString(5, board.getBOARD_CONTENT());
		         pstmt.setString(6, "");
		         pstmt.setInt(7, re_ref);
		         pstmt.setInt(8, re_lev);
		         pstmt.setInt(9, re_seq);   
		         pstmt.setInt(10, 0);      //BOARD_READCOUNT(조회수)는 0
		         int result2=pstmt.executeUpdate();
		         if(result1>=0 && result2==1) {
		            con.commit();
		            con.setAutoCommit(true);   //다시 true로 설정
		         }else {
		            con.rollback();
		            System.out.println("rollback()");
		         }
		         
		      }
		      catch(SQLException ex) {
		         System.out.println("boardReply()에러:"+ex);
		         if(con!=null)
		            try {
		               con.rollback();
		            }catch(SQLException e) {
		               e.printStackTrace();
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
		      }
		      return num;
		   }//boardReply end
	   
	   //글 수정
	   public boolean boardModify(BoardVO modifyboard) {
		   String sql = "update mboard "
				      + "set BOARD_SUBJECT = ?, "
				      + "BOARD_CONTENT=?, BOARD_FILE=? "
				      + "where BOARD_NUM=? ";
		   try {
			   con = ds.getConnection();
			   pstmt = con.prepareStatement(sql);
			   pstmt.setString(1, modifyboard.getBOARD_SUBJECT());
			   pstmt.setString(2, modifyboard.getBOARD_CONTENT());
			   pstmt.setString(3, modifyboard.getBOARD_FILE());
			   pstmt.setInt(4, modifyboard.getBOARD_NUM());
			   int result =pstmt.executeUpdate();
			   if(result==1) {
				   System.out.println("업데이트 성공");
				   return true;
			   }
			} catch (Exception e) {
				System.out.println("boardModify()에러:" + e);
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
			return false;
	   }//boardModify end

	   
	
	//글쓴이인지 확인 - 로그인 한 비밀번호로 확인
	public boolean isBoardWriter(int num, String pass) {

		String board_sql = "select * from USERS "
				         +"where USER_ID IN(SELECT BOARD_NAME FROM MBOARD "
				         +"where BOARD_NUM = ?)";

		
		try {
			con =ds.getConnection();
			pstmt = con.prepareStatement(board_sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {    
				 
				//입력받은 보드패스가 유저패스와 같다면 삭제
				if(pass.equals(rs.getString("USER_PASS"))) {
				return true;				
			   }
			}
		}catch (SQLException se) {
			System.out.println("isBoardWriter()에러"+se);
			se.printStackTrace();
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
		return false;
	}//isBoardWriter end
	
	//글 삭제 (아래 달린 답변글도 같이 삭제)
	public boolean boardDelete(int num) {
		String select_sql 
		      = "select BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ "
		      + "from mboard "
		      + "where BOARD_NUM = ?";
		String board_delete_sql
		      = "delete from mboard "
		      + "where BOARD_RE_REF = ? "
		      + "and   BOARD_RE_LEV >= ? "
		      + "and   BOARD_RE_SEQ >= ? "
		      + "and   BOARD_RE_SEQ <("
		      + "                     nvl((select min(board_re_seq )"
		      + "                          from   MBOARD "
		      + "                          where  BOARD_RE_REF = ? "
		      + "                          and    BOARD_RE_LEV = ? "
		      + "                          and    BOARD_RE_SEQ > ?), "
		      + "                          (SELECT max(board_re_seq)+1 "
		      + "                            FROM  MBOARD "
		      + "                            WHERE BOARD_RE_REF = ?)))";
		//String board_delete_sql = "delete from board where board_num =?" 하면 선택한 글만 삭제
		
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(select_sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			int BOARD_RE_REF=0, BOARD_RE_LEV=0, BOARD_RE_SEQ=0;
			if(rs.next()) {
				BOARD_RE_REF = rs.getInt("BOARD_RE_REF");
				BOARD_RE_LEV = rs.getInt("BOARD_RE_LEV");
				BOARD_RE_SEQ = rs.getInt("BOARD_RE_SEQ");
			
				pstmt = con.prepareStatement(board_delete_sql);
				pstmt.setInt(1, BOARD_RE_REF);
				pstmt.setInt(2, BOARD_RE_LEV);
				pstmt.setInt(3, BOARD_RE_SEQ);
				
				pstmt.setInt(4, BOARD_RE_REF);
				pstmt.setInt(5, BOARD_RE_LEV);
				pstmt.setInt(6, BOARD_RE_SEQ);
				
				pstmt.setInt(7, BOARD_RE_REF);
				//쿼리 실행 후 삭제된 로우(레코드) 갯수가 반환된다.
				int result = pstmt.executeUpdate();
				System.out.println(result+"개 삭제되었습니다.");
				if(result >= 1)
				   return true;
			}
		}catch(Exception e) {
			System.out.println("boardDelete()에러:"+e);
			e.printStackTrace();
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
		return false;
	}//boardDelete end

	
	//검색한 글 목록 개수
	public int getListCount(String field, String value) {
		int x = 0;

		try {
			con = ds.getConnection();
			String sql = "select count(*) from mboard "
                       + "where " + field + " like ? ";
			System.out.println(sql);
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%"+value+"%");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getListCount()에러:" + e);
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

		return x;

	}
	
	//검색한 글 목록 가져오는거
	public List<BoardVO> getList(String field, String value, int page, int limit) {
		String sql = "select * "
			      +" from (select b.*, rownum rnum " 
			      +" from (select * from mboard "
			      +" where "+field+" like ? "
			      +" order by BOARD_NUM) b"
			      +" )"
			      +" where rnum >= ? and rnum <= ?";
			      List<BoardVO> list = new ArrayList<BoardVO>();
			   
			      // 한 페이지 당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지 ...
			      int startrow = (page - 1) * limit + 1;
			      // 읽기 시작할 row 번호(1 11 21 31 ...)
			      int endrow = startrow + limit - 1;
			      // 읽을 마지막 row 번호 (10 20 30 40 ...)
			      
			      try {
			         con = ds.getConnection();
			         pstmt = con.prepareStatement(sql);
			         pstmt.setString(1, "%"+value+"%");
			         pstmt.setInt(2, startrow);
			         pstmt.setInt(3, endrow);
			         rs = pstmt.executeQuery();

			         // DB에서 가져온 데이터를 VO 객체에 담는다
			         while (rs.next()) {
			            BoardVO b = new BoardVO();
			            b.setBOARD_NUM(rs.getInt("BOARD_NUM"));
			            b.setBOARD_NAME(rs.getString("BOARD_NAME"));
			            b.setBOARD_PASS(rs.getString("BOARD_PASS"));
			            b.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
			            b.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
			            b.setBOARD_FILE(rs.getString("BOARD_FILE"));
			            b.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
			            b.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
			            b.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
			            b.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
			            b.setBOARD_DATE(rs.getDate("BOARD_DATE"));
			            list.add(b); // 값을 담은 객체를 리스트에 저장합니다.
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

			   }//getList end

	
	public List<BoardVO> getList(int page, int limit) {
		
		
				
		String sql = "select * from (select rownum rnum, b.*  from " + 
				"				(select * from mboard  order by BOARD_RE_REF desc, BOARD_RE_SEQ asc) b) " + 
				"				where rnum>=? and rnum<=?";
			      List<BoardVO> list = new ArrayList<BoardVO>();
			   
			      int startrow = (page - 1) * limit + 1;
			    
			      int endrow = startrow + limit - 1;
			     
			      
			      try {
			         con = ds.getConnection();
			         pstmt = con.prepareStatement(sql);
			         pstmt.setInt(1, startrow);
			         pstmt.setInt(2, endrow);
			         rs = pstmt.executeQuery();

			         while (rs.next()) {
			            BoardVO b = new BoardVO();
			           
			            b.setBOARD_NUM(rs.getInt("BOARD_NUM"));
			            b.setBOARD_NAME(rs.getString("BOARD_NAME"));
			            b.setBOARD_PASS(rs.getString("BOARD_PASS"));
			            b.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
			            b.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
			            b.setBOARD_FILE(rs.getString("BOARD_FILE"));
			            b.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
			            b.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
			            b.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
			            b.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
			            b.setBOARD_DATE(rs.getDate("BOARD_DATE"));
			            System.out.println(b.getBOARD_NUM() + ":"+b.getBOARD_SUBJECT());
			            list.add(b); 
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
			      return list; 

	}

	public Member usermail(String id) {
         
		//유저 이멜 갖고왕
		String sql = "select USER_EMAIL from USERS "
				   + "where USER_ID = ? ";
		Member user = null;
		try {
			con =ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {  
				user = new Member();
			
				user.setEmail(rs.getString("USER_EMAIL"));
				
			}
		}catch (SQLException se) {
			System.out.println("usermail()에러"+se);
			se.printStackTrace();
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
		
		return user;
		
	}
	
}//class