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

			// 원문의 경우 BOARD_RE_LEV, BOARD_RE_SEQ 필드 값은 0이다.
			pstmt.setInt(6, 0); // BOARD_RE_LEV 필드
			pstmt.setInt(7, 0); // BOARD_RE_SEQ 필드
			pstmt.setInt(8, 0); // BOARD_READCOUNT 필드

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
		// page:페이지
		// limit: 페이지 당 목록의 수
		// BOARD_RE_REF desc, BOARD_RE_SEQ asc에 의해 정렬한 것을
		// 조건절에 맞는 rnum의 범위만큼 가져오는 쿼리문이다.

		String board_list_sql = "select * " + "from (select rownum rnum, b.* " + " from (select * from mboard "
				+ " order by BOARD_RE_REF desc," + " BOARD_RE_SEQ asc) b) " + "where rnum>=? and rnum<=?";

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

			// DB에사 가져온 VO객체에 담는다.
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
				list.add(board); // 값을 담은 객체를 리스트에 저장한다.
			}
			return list; // 값을 담은 객체를 저장한 리스트를 호출한 곳으로 가져간다.

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
		String sql = "update MBOARD set " + "BOARD_READCOUNT = (BOARD_READCOUNT)+1 " + "where BOARD_NUM = ?";

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
				//board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				//board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
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
		      //board 테이블의 board_num 필드의 최대값을 구해와서 글을 등록할 떄
		      //글 번호를 순차적으로 지정하기 위함입니다.
		      //또한 DB에 저장한 후 다시 보여주기 위해 board_num 필드의 값을 리턴합니다.
		      String board_max_sql="select max(board_num) from mboard";
		    
		      int num=0;
		      /*
		       * 답변을 할 원문 글 그룹 번호입니다.
		       * 답변을 달게 되면 답변 글은 이 번호와 같은 관련 글 번호를 갖게 처리되면서 같은 그룹에 속하게 됩니다.
		       * 글 목록에서 보여줄 때 하나의 그룹으로 묶여서 출력됩니다.
		       */
		      int re_ref=board.getBOARD_RE_REF();
		      System.out.println("re_Ref="+re_ref);
		      /*
		       * 답글의 깊이를 의미합니다.
		       * 원문에 대한 답글이 출력될 때 한번 들여쓰기 처리가 되고 답글에 대한 답글은 들여쓰기가 두번 처리되게 합니다.
		       * 월문인 경우 이 값이 0이고 원문의 답글은 1, 답글의 답글은 2가 됩니다.
		       */
		      int re_lev=board.getBOARD_RE_LEV();
		      
		      //값은 관련 글 중에서 해당 글이 출력되는 순서입니다.
		      int re_seq=board.getBOARD_RE_SEQ();
		      
		      try {
		         con=ds.getConnection();
		         //트랜잭션을 이용하귀 위해서 setAutoCommit을 false로 설정합니다.
		         con.setAutoCommit(false);
		         
		         pstmt=con.prepareStatement(board_max_sql);
		         rs=pstmt.executeQuery();
		         if(rs.next())
		            num=rs.getInt(1)+1;   //답변 삽입할 글번호
		         
		         //BOARD_RE_REF, BOARD_RE_SEQ 값을 확인하여 원문 글에 다른 답글이 있으면
		         //다른 답글들의 BOARD_RE_SEQ값을 1씩 증가시킵니다.
		         //현재 글을 다른 답글보다 앞에 출력되게 하기 위해서입니다.
		         
		         String update_sql="update mboard" 
		               + "         set BOARD_RE_SEQ = BOARD_RE_SEQ + 1" 
		               + "         where BOARD_RE_REF = ?" 
		               + "         and BOARD_RE_SEQ>?";
		         
		         pstmt=con.prepareStatement(update_sql);
		         pstmt.setInt(1, re_ref);
		         pstmt.setInt(2, re_seq);
		         int result1=pstmt.executeUpdate();
		         //등록할 답변 글의 BOARD_RE_LEV, BOARD_RE_SEQ 값을 원문 글보다 1씩 증가시킵니다.
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
		         if(result1>=0&& result2==1) {
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

	   
	
	//글쓴이인지 확인 - 비밀번호로 확인한다.
	public boolean isBoardWriter(int num, String pass) {

		String board_sql = "select * from mboard "
				          +"where BOARD_NUM = ?";
		try {
			con =ds.getConnection();
			pstmt = con.prepareStatement(board_sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(pass.equals(rs.getString("BOARD_PASS"))) {
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

	public int getListCount(String field, String value) {
		int x = 0;

		try {
			con = ds.getConnection();
			String sql = "select count(*) from mboard "
                       + "where" + field + " like ? ";
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
	
	
	public List<BoardVO> getList(String field, String search_word, int page, int limit) {
		String sql = "select * "
			      +" from (select b.*, rownum rnum " 
			      + " from (select * from mboard "
			      +" order by board_num) b"
			      +" )"
			      +" where rnum >=? and rnum <= ?";
			      List<BoardVO> list = new ArrayList<BoardVO>();
			   
			      // 한 페이지 당 10개씩 목록인 경우 1페이지, 2페이지, 3페이지, 4페이지 ...
			      int startrow = (page - 1) * limit + 1;
			      // 읽기 시작할 row 번호(1 11 21 31 ...)
			      int endrow = startrow + limit - 1;
			      // 읽을 마지막 row 번호 (10 20 30 40 ...)
			      
			      try {
			         con = ds.getConnection();
			         pstmt = con.prepareStatement(sql);
			         pstmt.setInt(1, startrow);
			         pstmt.setInt(2, endrow);
			         rs = pstmt.executeQuery();

			         // DB에서 가져온 데이터를 VO 객체에 담습니다.
			         while (rs.next()) {
			            BoardVO b = new BoardVO();
			            b.setBOARD_NAME(rs.getString(1));
			            b.setBOARD_SUBJECT(rs.getString(2));
			            b.setBOARD_CONTENT(rs.getString(3));
			            b.setBOARD_FILE(rs.getString(4));
			            b.setBOARD_DATE(rs.getDate(5));
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
	
}//class