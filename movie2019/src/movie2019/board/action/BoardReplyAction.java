package movie2019.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.board.action.Action;
import movie2019.board.action.ActionForward;

public class BoardReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
	      BoardDAO boarddao = new BoardDAO();
	      BoardVO boarddata = new BoardVO();
	      int result = 0;
	      
	      
	      //파라미터로 넘어온 값들을 boarddata객체에 저장
	      boarddata.setBOARD_NAME(request.getParameter("BOARD_NAME"));
	      boarddata.setBOARD_PASS(request.getParameter("BOARD_PASS"));
	      boarddata.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
	      boarddata.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
	      boarddata.setBOARD_RE_REF(Integer.parseInt(request.getParameter("BOARD_RE_REF")));
	      boarddata.setBOARD_RE_LEV(Integer.parseInt(request.getParameter("BOARD_RE_LEV")));
	      boarddata.setBOARD_RE_SEQ(Integer.parseInt(request.getParameter("BOARD_RE_SEQ")));
	      
	      //답변을 DB에 저장하기 위해 boarddata객체를 파라미터로 
	      //DAO에 있는 boardReply메소드 호출
	      result = boarddao.boardReply(boarddata);
	      
	      //답변 저장 실패
	      if (result == 0) {
	         System.out.println("답변 실패");
	         forward.setRedirect(false);
	         request.setAttribute("message", "답변 작성 실패");
	         forward.setPath("error/error.jsp");
	         return forward;
	      }
	      //답변 저장이 제대로 된 경우
	      System.out.println("답변 완료");
	      forward.setRedirect(true);
	      //답변 글 내용 확인을 위해 글 내용보기 페이지를 경로로 설정 
	      forward.setPath("BoardDetailAction.bd?num="+result);

	      return forward;
	   }
}
