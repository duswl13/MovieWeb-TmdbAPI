package movie2019.gong.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.gong.model.FAQDAO;
import movie2019.gong.model.FAQVO;
import movie2019.gong.model.GongDAO;
import movie2019.gong.model.GongVO;

public class FListCommand implements GCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		FAQDAO dao = new FAQDAO();
		int curPage =Integer.parseInt(request.getParameter("curPage"));
		int start =(curPage-1)*10+1;
		int end=start+(10-1); 
		List<FAQVO> list = dao.FAQList(start,end);
		request.setAttribute("list", list);
		
		
	
		int rows =dao.FAQCount();
		int total_page=(int)(Math.ceil(rows/10.0));
		request.setAttribute("total_page", total_page);
		
		int page_list_size=10;		
		int total_block=(int)Math.ceil(total_page*1.0/page_list_size);		
		int current_block=(int)Math.ceil((curPage-1)/page_list_size)+1;		
		int block_start=(current_block-1)*page_list_size+1;
		int block_end=block_start+page_list_size-1; 	
		int prev_page = current_block ==1 ? 1:(current_block-1)*page_list_size;
		int next_page =current_block > total_block ? (current_block*page_list_size) : (current_block*page_list_size)+1;
		
		
		if(block_end > total_page) {
			block_end = total_page;
		}
		
		if(next_page >=total_page) {
			next_page = total_page;
		}
		
	
		request.setAttribute("total_block", total_block);
		request.setAttribute("current_block", current_block);
		request.setAttribute("block_start", block_start);
		request.setAttribute("block_end", block_end);
		request.setAttribute("prev_page", prev_page);
		request.setAttribute("next_page", next_page);
		request.setAttribute("current_page", curPage);	
		
	}
	
	

}
