package movie2019.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movie2019.login.db.Member;







public class BoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {

		BoardDAO boarddao = new BoardDAO();
		BoardVO boarddata = new BoardVO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		boarddao.setReadCountUpdate(num);
		
		boarddata = boarddao.getDetail(num);
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		
		
		//로그인한 회원 메일 가져와야하는디...
		Member mem = new Member();
		mem = boarddao.usermail(id);
	      
	      request.setAttribute("mem", mem);
	      
		ActionForward forward = new ActionForward();

		if(boarddata==null) {
			System.out.println("상세보기 실패");
		 
			forward.setRedirect(false);
			return forward;
		}
		System.out.println("상세보기 성공");
		
		movie2019.board.comment.CommentDAO cdao
		  = new movie2019.board.comment.CommentDAO();
		int count = cdao.getListCount(num);
		request.setAttribute("count", count);
		request.setAttribute("boarddata", boarddata);
        forward.setRedirect(false);
   
        forward.setPath("Page/Board/board/board_view.jsp");
        return forward;
	}

}
