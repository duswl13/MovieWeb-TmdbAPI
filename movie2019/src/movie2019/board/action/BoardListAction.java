package movie2019.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.board.action.Action;
import movie2019.board.action.ActionForward;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
	  HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		forward.setPath("Page/Board/board/board_list.jsp");
		return forward;
	}

}
