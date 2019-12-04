package movie2019.signup.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
	   HttpServletResponse response) throws Exception {
		 
		MemberDAO dao = new MemberDAO();
		  int result = dao.isId(request.getParameter("USER_ID"));
		  response.getWriter().append(Integer.toString(result));
		  return null;
  }

}
