package movie2019.login.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.login.db.MemberDAO;


public class IdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		MemberDAO dao = new MemberDAO();
		int result = dao.isId(request.getParameter("id"));
		response.getWriter().append(Integer.toString(result));		
		return null;
	}

}
