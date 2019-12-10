package movie2019.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
		HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		boolean result = false;
		boolean usercheck = false;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO boarddao = new BoardDAO();
		
		usercheck = boarddao.isBoardWriter(num, 
				            request.getParameter("BOARD_PASS"));
		
		//비밀번호 일치하지 않는 경우
		if(usercheck==false) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		
		//비밀번호가 일치하는 경우 삭제 처리 한다.
		result = boarddao.boardDelete(num);
		
		ActionForward forward = new ActionForward();
		//삭제 처리 실패한 경우
		if(result==false) {
			System.out.println("게시판 삭제 실패");
			forward.setRedirect(false);
            return forward;
		}
		//삭제 처리 성공한 경우 - 글 목록 보기 요청을 전송하는 부분이다.
		System.out.println("게시판 삭제 성공");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("alert('삭제되었습니다.');");
        out.println("location.href='BoardList.bd';");
        out.println("</script>");
        out.close();
		return null;
	}

}
