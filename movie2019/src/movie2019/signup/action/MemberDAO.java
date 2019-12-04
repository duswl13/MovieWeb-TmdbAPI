package movie2019.signup.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	int result;
	
	//context.xml 자원 찾아쓰는 메소드
	 public MemberDAO() {
	      try {
	         Context init = new InitialContext();
	         ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
                 //반환형이 DataSource
	      } catch (Exception ex) {
	         System.out.println("DB 연결 실패 : " + ex);
	      }
	   }
	 
		//가입된 회원인지 확인 id중복체크
		public int isId(String USER_ID) {
			try{
				con = ds.getConnection();
				System.out.println("getConnection");
				
				String sql =
						"SELECT USER_ID FROM USERS WHERE USER_ID = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, USER_ID);
				rs=pstmt.executeQuery();
				if(rs.next()) {
		            result=0;      //DB에 해당 ID가 있다.
		         }else {
		            result=-1;      //DB에 해당 ID가 없다.
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

		//가입하는 회원 정보 저장
		public int insert(Member m) {
			try{
				con = ds.getConnection();
				System.out.println("getConnection");
				
				String sql =
						"INSERT INTO USERS VALUES( "
				     + "?,?,?, sysdate , ?, 'n')";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m.getUSER_ID());
				pstmt.setString(2, m.getUSER_PASS());
				pstmt.setString(3, m.getUSER_EMAIL());
				pstmt.setString(4, m.getUSER_PHONE());
				
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
		
      //회원이 선호하는 영화 장르 
	  public int choice(String[] genres, String uSER_ID) {
		try{
			con = ds.getConnection();
			System.out.println("getConnection");
			
			String sql = "INSERT ALL ";
	
		      for(int i = 0; i < genres.length; i++) {
		    	  		    	  
		         sql += "INTO USER_GENRES VALUES("
		        	 + genres[i]+ ", '" +uSER_ID+"') ";
		           
		      }
		      		      
		      sql += " SELECT * FROM DUAL";
		      System.out.println(sql);
		     pstmt = con.prepareStatement(sql);
			
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
