package movie2019.admin.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class USERInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO userdao = new UserDAO();
		Users user = new Users();

		String id=request.getParameter("user_id");
		user=userdao.user_info(id);
		
		ActionForward forward = new ActionForward();
		
		if(user==null) {
			forward.setRedirect(false);
			request.setAttribute("message", "사용자 정보보기 실패.");
			forward.setPath("error/error.jsp");
			return null;
		}
		
		request.setAttribute("userinfo",user);
		forward = new ActionForward();
		forward.setRedirect(false);
		
		forward.setPath("Page/AdminPage/UserList/UserInfo.jsp");
		return forward;
	}


}
