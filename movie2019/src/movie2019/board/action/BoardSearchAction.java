package movie2019.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		
		//기본 값 페이지
	    int page = 1;
		int limit = 3;
				
		if(request.getParameter("page")!=null) {
		page=Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("넘어온 페이지="+ page);
		
		//총 리스트 수를 받아온다.
		int listcount = 0;
		List<BoardVO> list = null;
		int index = -1; //search_field에 존재하지 않는 값으로 초기화 (search_field는 0부터2까지있음)
		String search_word = "";

		if(request.getParameter("search_word")==null
				|| request.getParameter("search_word").equals("")) {
			
			
		}else { //검색어 클릭한 경우
			index 
			=Integer.parseInt(request.getParameter("search_field"));
			String[] search_field
			   = new String[] {"BOARD_NAME","BOARD_SUBJECT","BOARD_CONTENT"};
			
			search_word = request.getParameter("search_word");
			listcount =
					bdao.getListCount(search_field[index],search_word);
			list 
			= bdao.getList(search_field[index], search_word, page, limit);
			
			
		}
		int maxpage = (listcount+limit-1)/limit;
		System.out.println("총 페이지 수="+maxpage);
		
		int startpage = ((page-1)/5)*5+1;
		System.out.println("현재 페이지에 보여줄 시작 페이지 수="+startpage);
		
		//endpage: 현재 페이지 그룹에서 보여줄 마지막 페이지 수([5],[10],[15] 등)
		int endpage = startpage + 5 -1;
		System.out.println("현재 페이지에 보여줄 마지막 페이지 수="+endpage);
	  
		if(endpage>maxpage) endpage = maxpage;
		request.setAttribute("page", page); //현재 페이지 수
        request.setAttribute("maxpage", maxpage); //최대 페이지 수
        
        //현재 페이지에 표시할 첫 페이지 수
        request.setAttribute("startpage", startpage);
        
        //현재 페이지에 표시할 끝 페이지 수
        request.setAttribute("endpage", endpage);
        request.setAttribute("listcount", listcount); //총 글의 수
        
        request.setAttribute("search_word", search_word);
        request.setAttribute("search_field", index);
		//글목록 보여주는 페이지로 경로 설정
	    forward.setPath("Page/Board/board/board_list.jsp");
	    request.setAttribute("totallist", list);
	    forward.setRedirect(false);
		return forward;
	}

}
