package movie2019.gong.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import movie2019.chu.mybatis.MybatisManager;

public class FAQDAO {

	public List<FAQVO> FAQList(int start, int end) {
		SqlSession session = MybatisManager.getInstance().openSession();		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		List<FAQVO> items =session.selectList("gong.faqList",map);
		
		session.close();	
		return items;
	}

	public int FAQCount() {
		SqlSession session = MybatisManager.getInstance().openSession();
		int count = session.selectOne("gong.faqCount");
		
		session.close();
		return count;
	}

	

}
