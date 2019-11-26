package movie2019.gong.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import movie2019.chu.mybatis.MybatisManager;

public class GongDAO {
	public List<GongVO> GongList(int start, int end){//공지사항 리스트
		SqlSession session = MybatisManager.getInstance().openSession();		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		List<GongVO> items =session.selectList("gong.gongList",map);
		session.close();			
		return items;
		
	}
	
	public int GongCount() {//카운트 페이징처리
		SqlSession session = MybatisManager.getInstance().openSession();
		//건수야 selectone이랑 List랑 햇갈리지마라
		int count = session.selectOne("gong.gongCount");
		session.close();
		return count;
		
	}
	
}
