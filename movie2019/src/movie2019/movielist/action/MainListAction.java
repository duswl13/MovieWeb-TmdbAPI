package movie2019.movielist.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MainListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		

		response.setContentType("text/html;charset=utf-8");

		ActionForward forward = new ActionForward();

		return forward;
	}

}
