package movie2019.chu.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;

import movie2019.chu.mybatis.MybatisManager;

public class GenDAO {
		
	public List<GenresVO> GenChu(String id){
		SqlSession session = MybatisManager.getInstance().openSession();		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		List<GenresVO> items =session.selectList("Chu.ChMain",map);
		
		session.close();	
		return items;
		
	}
	
	public List<Rating_faceVO> matchings(String id){
		SqlSession session = MybatisManager.getInstance().openSession();		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		List<Rating_faceVO> items =session.selectList("Chu.Chmachings",map);	
		session.close();
		
		return items;
		
	}
	
	
	public String matching(String id) {
		
		DataSource ds = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		String sql="SELECT user_id ,count(*) c " + 
				"FROM (select * from rating_face where RATING_FACE_value=1) r1 " + 
				" WHERE MOVIE_ID in " + 
				"(select  MOVIE_ID from rating_face where "
				+ "user_id=? and RATING_FACE_value=1) "
						+ "and r1.user_id <> ? GROUP BY user_id" + 
				" order by c desc";
		
		String result="";
		
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result +=rs.getString("user_id");				
			}
			return result; 
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("건수 에러: " + e);
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
	
}
