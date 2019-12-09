package movie2019.board.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.board.action.Action;
import movie2019.board.action.ActionForward;


public class CommentUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		CommentDAO dao = new CommentDAO();
		CommentVO co = new CommentVO();
		
		//ajax 한글 깨짐방지
		request.setCharacterEncoding("utf-8");
		co.setContent(request.getParameter("content"));
		System.out.println("content="+co.getContent());
		co.setNum(Integer.parseInt(request.getParameter("num")));
		try{
			int ok = dao.commentsUpdate(co);
			response.getWriter().print(ok);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("댓글 수정 실패");
			ActionForward forward = 
					new ActionForward();
			 request.setAttribute("message", "댓글 수정 실패입니다.");
	            forward.setRedirect(false);
	    		return forward;
		}
		
		return null;
	}
}
