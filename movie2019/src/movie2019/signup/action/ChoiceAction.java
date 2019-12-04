package movie2019.signup.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChoiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
		HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		//ÇÑ±Û±úÁü ¹æÁö
		request.setCharacterEncoding("utf-8");
		
		int USER_GENRES_NUMBER = Integer.parseInt(request.getParameter("USER_GENRES_NUMBER"));
        int GENRES_ID = Integer.parseInt(request.getParameter("GENRES_ID"));
		String USER_ID = request.getParameter("USER_ID");
		
		
		
		return forward;
	}

}
