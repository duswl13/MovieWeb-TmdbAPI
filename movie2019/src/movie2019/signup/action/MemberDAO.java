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
	
	//context.xml �ڿ� ã�ƾ��� �޼ҵ�
	 public MemberDAO() {
	      try {
	         Context init = new InitialContext();
	         ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
                 //��ȯ���� DataSource
	      } catch (Exception ex) {
	         System.out.println("DB ���� ���� : " + ex);
	      }
	   }
	 
		//���Ե� ȸ������ Ȯ�� id�ߺ�üũ
		public int isId(String uSER_ID) {
			try{
				con = ds.getConnection();
				System.out.println("getConnection");
				
				String sql =
						"SELECT USER_ID FROM USERS WHERE USER_ID = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uSER_ID);
				rs=pstmt.executeQuery();
				if(rs.next()) {
		            result=0;      //DB�� �ش� ID�� �ִ�.
		         }else {
		            result=-1;      //DB�� �ش� ID�� ����.
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

		//�����ϴ� ȸ�� ���� ����
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
		
      //선호장르 개수 체크 
	  public int choice(String[] genres, String uSER_ID) {
		try{
			con = ds.getConnection();
			System.out.println("getConnection");
			//한번에 여러개의 로우를 넣을 수 있는 insert all 사용
			String sql = "INSERT ALL ";
		      for(int i = 0; i < genres.length; i++) {
		         sql += "INTO USER_GENRES VALUES("
		        	 + genres[i]+ ", '" +uSER_ID+"') ";
		      }
		   //오라클에서 제공되는 dual 테이블에서 select  		      
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
