package movie2019.gong.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import movie2019.chu.mybatis.MybatisManager;

public class SearchDAO {
	public List<GongVO> GongSearchList(int start, int end, String keyword){//�������� ����Ʈ
		SqlSession session = MybatisManager.getInstance().openSession();		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);
		List<GongVO> items =session.selectList("gong.gongSearch",map);
	
		
		session.close();	
		return items;
		
	}
	
	
	public int GongSearchCount(String keyword) {
		SqlSession session = MybatisManager.getInstance().openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		int count = session.selectOne("gong.gongSearchCount",map);	
		session.close();
		return count;
		
	}
	
	public List<FAQVO> FSearchList(int start, int end, String keyword){//�������� ����Ʈ
		SqlSession session = MybatisManager.getInstance().openSession();		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);
		List<FAQVO> items =session.selectList("gong.fSearch",map);
		session.close();	
		return items;
		
	}
	
	
	public int FSearchCount(String keyword) {
		SqlSession session = MybatisManager.getInstance().openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		int count = session.selectOne("gong.FSearchCount",map);	
		session.close();
		return count;
		
	}
	

}
