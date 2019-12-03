package movie2019.mypage.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import movie2019.admin.notice.NoticeVO;

public class GenresDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	int result;
	Boolean bool;
	
	public List<Genres> getGenres(String id) {

		String sql = "select * from genres where USER_ID=?";
		

		List<Genres> list = new ArrayList<Genres>();

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			// DB에서 가져온 데이터를 VO객체에 담습니다.
			while (rs.next()) {
				Genres genres = new Genres();
				genres.setUSER_GENRES_NUMBER(rs.getInt("USER_GENRES_NUMBER"));
				genres.setGENRES_ID(rs.getInt("GENRES_ID"));
				genres.setUSER_ID(rs.getString("USER_ID"));

				list.add(genres);
			}
			return list; // 값을 담을 객체를 저장한 리스트를 호출한 곳으로 가져갑니다.
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
		return null;
	}

}
