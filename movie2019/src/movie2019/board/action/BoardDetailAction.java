package movie2019.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.board.action.Action;
import movie2019.board.action.ActionForward;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
		HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		BoardDAO boarddao = new BoardDAO();
		BoardVO boarddata = new BoardVO();
		
		//글번호 파라미터 값을 num변수에 저장한다.
		int num = Integer.parseInt(request.getParameter("num"));
		
		//내용을 확인할 글의 조회수를 증가시킨다.
		boarddao.setReadCountUpdate(num);
		
		//글의 내용을 DAO에서 읽은 후 얻은 결과를 boarddata 객체에 저장한다.
		boarddata = boarddao.getDetail(num);
		
		//boarddata = null;
		//DAO에서 글의 내용을 읽지 못했을 경우 null을 반환한다.
		if(boarddata==null) {
			System.out.println("상세보기 실패");
		 //error/error.jsp이동하기
			forward.setRedirect(false);
			request.setAttribute("message","게시판 상세보기 실패입니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		System.out.println("상세보기 성공");
		
		//boarddata 객체를 Request객체에 저장한다.
		request.setAttribute("boarddata", boarddata);
        forward.setRedirect(false);
        
        //글 내용 보기 페이지로 이동하기 위해 경로를 설정한다.
        forward.setPath("/Page/Board/board/board_view.jsp");
        return forward;
	}


}
