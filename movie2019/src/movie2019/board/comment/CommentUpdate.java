package movie2019.board.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CommentUpdate implements movie2019.board.action.Action {

	@Override
	public movie2019.board.action.ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

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
			movie2019.board.action.ActionForward forward = 
					new movie2019.board.action.ActionForward();
			 request.setAttribute("message", "댓글 수정 실패입니다.");
	            forward.setPath("error/error.jsp");
	            forward.setRedirect(false);
	    		return forward;
		}
		
		return null;
	}
}
