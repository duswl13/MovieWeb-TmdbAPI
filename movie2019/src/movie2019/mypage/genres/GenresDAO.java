package movie2019.mypage.genres;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import movie2019.admin.notice.NoticeVO;

public class GenresDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	int result;
	Boolean bool;
	
	public GenresDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}


	public JsonArray getGenres(String id) {
	//	String sql = "select * from USER_GENRES where USER_ID=?";
		String sql = "select GENRES.genres_id, user_id, GENRES_NAME  "
				+ "from USER_GENRES, GENRES  "
				+ "where GENRES.GENRES_ID=USER_GENRES.GENRES_ID and user_id=?";
		JsonArray array=new JsonArray();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while (rs.next()) {
				JsonObject object=new JsonObject();				
				object.addProperty("GENRES_ID", rs.getInt(1));
				object.addProperty("USER_ID", rs.getString(2));
				object.addProperty("GENRES_NAME", rs.getString(3));
				array.add(object);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getGenres() 에러: " + e);
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
		return array;
	}


	public int update_genres(String[] genres, String id) {
	      try{
	          con = ds.getConnection();
	          System.out.println("getConnection");
	          String delete_sql = "delete from user_genres where user_id=?";
	          pstmt = con.prepareStatement(delete_sql);
	          pstmt.setString(1, id);
	          pstmt.executeUpdate();
	          
	          
	          String insert_sql = "INSERT ALL ";	    
	             for(int i = 0; i < genres.length; i++) {	                               
	            	 insert_sql += "INTO USER_GENRES VALUES("
	                   + genres[i]+ ", '" +id+"') ";              
	             }
	                         
	            insert_sql += " SELECT * FROM DUAL";
	            pstmt = con.prepareStatement(insert_sql);
	          
	          result=pstmt.executeUpdate();
	          
	        } catch(java.sql.SQLIntegrityConstraintViolationException e) {
	           e.printStackTrace();
	        
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
}
