package movie2019.board.comment;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.board.action.Action;
import movie2019.board.action.ActionForward;



public class CommentAdd implements  Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
	
		CommentDAO dao = new CommentDAO();
		CommentVO co = new CommentVO();
		
		//ajax이용시 한글 깨짐방지
		request.setCharacterEncoding("utf-8");
		
		
		co.setId(request.getParameter("id"));
		co.setContent(request.getParameter("content"));
		System.out.println("content="+co.getContent());
		co.setBoard_re_ref(
	Integer.parseInt(request.getParameter("BOARD_RE_REF")));
		System.out.println("ttt"+Integer.parseInt(request.getParameter("BOARD_RE_REF")));
		
		if(co.getContent()=="" || co.getContent() == null) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('댓글을 입력하세요')");
			out.println("</script>");
			out.close();
			return null;
		}
		
		try{
			int ok = dao.commentsInsert(co);
			response.getWriter().print(ok);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("댓글 등록 실패");
			ActionForward forward =
					new ActionForward();
			    request.setAttribute("message", "댓글 등록 실패");
	            forward.setRedirect(false);
	    		return forward;
		}
		
		return null;
	}
              
}
