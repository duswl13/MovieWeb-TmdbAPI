package movie2019.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
		HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("Page/Board/board/board_view.jsp");
        return forward;
		
	}

}
