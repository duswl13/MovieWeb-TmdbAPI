package movie2019.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardModifyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
		HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        
		ActionForward forward = new ActionForward();
		BoardDAO boarddao = new BoardDAO();
		BoardVO boarddata = new BoardVO();
		
		//파라미터로 전달받은 수정할 글 번호를 num변수에 저장한다.
		int num = Integer.parseInt(request.getParameter("num"));
		//글 내용을 불러와서 boarddata객체에 저장한다.
		boarddata = boarddao.getDetail(num);
		
		//글 내용 불러오기 실패한 경우이다.
		if(boarddata==null) {
			System.out.println("(수정)상세보기 실패");
			forward.setRedirect(false);
			request.setAttribute("message", "게시판 상세보기 실패입니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		System.out.println("(수정)상세보기 성공");
		//수정 폼 페이지로 이동할 때 원본 글 내용을 보내주기 때문에 boarddata객체를
		//request객체로 지정한다.
		request.setAttribute("boarddata", boarddata);
		forward.setRedirect(false);
		//글 수정 폼 페이지로 이동하기 위해 경로를 설정한다.
		forward.setPath("Page/Board/board/board_modify.jsp");
		return forward;

	}

}
