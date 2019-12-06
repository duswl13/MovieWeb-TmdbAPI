package movie2019.chu.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

}
