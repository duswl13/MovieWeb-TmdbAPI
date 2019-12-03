package movie2019.mypage.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.admin.user.UserDAO;
import movie2019.admin.user.Users;

public class USERInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO userdao = new UserDAO();
		Users user = new Users();

		String id=request.getParameter("user_id");
		user=userdao.user_info(id);
		ActionForward forward = new ActionForward();
		
		if(user==null) {
			System.out.println("정보가져오기 실패");
			forward.setRedirect(false);
			request.setAttribute("message", "정보가져오기 실패입니다.");
			forward.setPath("error/error.jsp");
			return null;
		}
		System.out.println("상세보기 성공");
		
		request.setAttribute("userinfo",user);
		forward = new ActionForward();
		forward.setRedirect(false);
		
		//글 내용 보기 페이지로 이동하기 위해 경로를 설정합니다.
		forward.setPath("Page/MyPage/MyInfo/MyInfo.jsp");
		return forward;
	}


}
