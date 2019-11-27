package movie2019.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
		HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		forward.setPath("BoardList.bd");
		return forward;
	}

}
