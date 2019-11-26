package movie2019.gong.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.gong.model.GongDAO;
import movie2019.gong.model.GongVO;

public class GListCommand implements GCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		GongDAO dao = new GongDAO();
		int curPage =Integer.parseInt(request.getParameter("curPage"));
		int start =(curPage-1)*10+1; //시작번호 = (현재페이지 -1) * 페이지당게시물수 +1
		int end=start+(10-1); //끝번호 = 시작페이지 +(페이지당 게시물수 -1)
		List<GongVO> list = dao.GongList(start,end);
		request.setAttribute("list", list);
		
		
		//페이지갯수 계산 ex 991/10 =>99.1 = > 올림 => 100 count쿼리
		int rows =dao.GongCount();
		int total_page=(int)(Math.ceil(rows/10.0));//ceil올림함수
		request.setAttribute("total_page", total_page);
		
		//블록당 표시 페이지 갯수 10개씩출력하겠다
		int page_list_size=10;
		//페이지 블록의 갯수(전체 페이지갯수 / 블록당 페이지 갯수)
		int total_block=(int)Math.ceil(total_page*1.0/page_list_size);
		//현재 페이지가 몇번째 블록인지 계산 공식=(현재페이지-1)/페이지블록단위+1
		int current_block=(int)Math.ceil((curPage-1)/page_list_size)+1;
		//n번째 블록의 시작페이지번호, 끝페이지 번호 계산
		int block_start=(current_block-1)*page_list_size+1;
		int block_end=block_start+page_list_size-1; //시작번호에 무조건 +9임 
		//이전페이지 번호, 다음페이지 번호
		int prev_page = current_block ==1 ? 1:(current_block-1)*page_list_size;
		int next_page =current_block > total_block ? (current_block*page_list_size) : (current_block*page_list_size)+1;
		
		//마지막 블록의 끝번호가 범위 초과 ㄴㄴ
		if(block_end > total_page) {
			block_end = total_page;
		}
		//마지막 페이지가 범위 초과 ㄴㄴ
		if(next_page >=total_page) {
			next_page = total_page;
		}
		
		//페이지 네이게이션 저장지역
		request.setAttribute("total_block", total_block);//블록갯수
		request.setAttribute("current_block", current_block);//현재블록
		request.setAttribute("block_start", block_start);//시작페이지번호
		request.setAttribute("block_end", block_end);//끝페이지번호
		request.setAttribute("prev_page", prev_page);//이전페이지번호
		request.setAttribute("next_page", next_page);//다음페이지번호
		request.setAttribute("current_page", curPage);	//현재페이지번호
	}

}
