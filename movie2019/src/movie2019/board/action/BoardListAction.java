package movie2019.board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
	
		BoardDAO boarddao = new BoardDAO();
		List<BoardVO> boardlist = 
				new ArrayList<BoardVO>();
		
		//기본 값 페이지
		int page = 1;
		int limit = 10;
		
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("넘어온 페이지="+ page);
		
		//검색된 리스트의 limit값이 넘어오면...?
		if(request.getParameter("limit")!=null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		}
		System.out.println("넘어온 limit="+limit);
		
		//총 리스트 받아온다.
		int listcount = boarddao.getListCount();
		System.out.println("listcount>>>"+listcount);
		
		//리스트 받아온다.
		boardlist = boarddao.getBoardList(page,limit);
		

		int maxpage = (listcount+limit-1)/limit;
		System.out.println("총 페이지 수="+maxpage);
		

		int startpage = ((page-1)/10)*10+1;
		System.out.println("현재 페이지에 보여줄 시작 페이지 수="+startpage);
		
		//endpage: 현재 페이지 그룹에서 보여줄 마지막 페이지 수([10],[20],[30] 등)
		int endpage = startpage + 10 -1;
		System.out.println("현재 페이지에 보여줄 마지막 페이지 수="+endpage);
		

		if(endpage>maxpage) endpage = maxpage;
		
		String state = request.getParameter("state");
		
		if(state==null) {
			System.out.println("state=null");
		
		request.setAttribute("page", page); //현재 페이지 수
        request.setAttribute("maxpage", maxpage); //최대 페이지 수
        
        request.setAttribute("startpage", startpage);
        
        request.setAttribute("endpage", endpage);
        request.setAttribute("listcount", listcount); //총 글의 수
        
        //해당 페이지의 글 목록을 갖고 있는 리스트
        request.setAttribute("boardlist", boardlist);
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        
        //글 목록 페이지로 이동하기 위해 경로를 설정한다.
        forward.setPath("Page/Board/board/board_list.jsp");
        return forward; //BoardFrontController.java로 리턴된다.
	
	}else {
        System.out.println("state=ajax");
        JsonObject object = new JsonObject();
        object.addProperty("page", page);
        object.addProperty("maxpage", maxpage);
        object.addProperty("startpage", startpage);
        object.addProperty("endpage", endpage);
        object.addProperty("listcount", listcount);
        object.addProperty("limit", limit);
        //List => JsonArray
         JsonArray je =
        		 new Gson().toJsonTree(boardlist)
        		           .getAsJsonArray();
	
         //List => JsonElement
         //JsonElement je = new Gson().toJsonTree(boardlist);
         System.out.println("je="+je);
         object.add("boardlist", je);
         
         Gson gson = new Gson();
         String json = gson.toJson(object);
         
         response.setContentType("text/html;charset=utf-8");
         response.getWriter().append(json);
         System.out.println(json);
         return null;
	}
	
	}
}