package movie2019.board.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class CommentAdd implements movie2019.board.action.Action {

	@Override
	public movie2019.board.action.ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		CommentDAO dao = new CommentDAO();
		CommentVO co = new CommentVO();
		
		//ajax이용시 한글 깨짐방지
		request.setCharacterEncoding("utf-8");
		co.setId(request.getParameter("id"));
		co.setContent(request.getParameter("content"));
		System.out.println("content="+co.getContent());
		co.setBoard_re_ref(
	Integer.parseInt(request.getParameter("BOARD_RE_REF")));
		try{
			int ok = dao.commentsInsert(co);
			response.getWriter().print(ok);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("댓글 등록 실패");
			movie2019.board.action.ActionForward forward =
					new movie2019.board.action.ActionForward();
			    request.setAttribute("message", "댓글 등록 실패입니다.");
	          
	            forward.setRedirect(false);
	    		return forward;
		}
		
		return null;
	}
              
}
