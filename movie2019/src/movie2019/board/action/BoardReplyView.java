package movie2019.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.board.action.Action;
import movie2019.board.action.ActionForward;

public class BoardReplyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		BoardDAO boarddao = new BoardDAO();
		BoardVO boarddata = new BoardVO();
		
		//파라미터로 전달받은 답변할 글 번호를 num변수에 저장한다.
		int num = Integer.parseInt(request.getParameter("num"));
		
		//글 번호 num에 해당하는 내용을 가져와서 boarddata 객체에 저장한다.
		boarddata = boarddao.getDetail(num);
		
		//글 내용이 없는 경우
		if(boarddata==null) {
			System.out.println("답장 페이지 이동 실패");
			forward.setRedirect(false);
			request.setAttribute("message","답장 페이지 상세보기 실패입니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		System.out.println("답장 페이지 이동 완료");
		//답변 폼 페이지로 이동할 때 원본 글 내용을 보여주기 위해
		//boarddata객체를 Request객체에 저장한다.
		request.setAttribute("boarddata", boarddata);
		forward.setRedirect(false);
		//글 답변 페이지 경로 지정한다.
		forward.setPath("Page/Board/board/board_reply.jsp");
		return forward;
		
	}
}