package movie2019.mypage.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.admin.user.UserDAO;
import movie2019.admin.user.Users;

public class UserEditViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		UserDAO udao=new UserDAO();
		Users users = new Users();
			String id = request.getParameter("user_id");
			
			users=udao.user_info(id);
			
			if(users==null) {
				forward.setRedirect(false);
				request.setAttribute("message", "정보 수정 실패.");
				forward.setPath("error/error.jsp");
				return forward;
			}

			request.setAttribute("userinfo", users);
			forward.setRedirect(false);
			forward.setPath("Page/MyPage/MyInfo/MyInfoModify.jsp");
			
			return forward;
	}

}
