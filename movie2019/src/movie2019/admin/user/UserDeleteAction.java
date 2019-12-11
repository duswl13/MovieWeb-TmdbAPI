package movie2019.admin.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO mdao=new UserDAO();
		request.setCharacterEncoding("utf-8");
		int result=-1;
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		Users users=new Users();
		users=mdao.user_info(id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String message="";

		if(users.getUSER_PASS().equals(request.getParameter("USER_PASS")))
		{		
			result=mdao.delete(id);
			if(result==1) {
			session.invalidate();
			message = "정상적으로 탈퇴 되었습니다.";
			out.println("<script>");
			out.println("alert('"+message+"');");
			out.println("location.href='main.ml'");
			out.println("</script>");
			return null;
			}
			if(result!=1) {
				message="탈퇴중 문제가 발생하였습니다. 다시 시도해주세요.";
			}	
		}else {
			message="비밀번호가 일치하지 않았습니다.";
		}
		out.println("<script>");
		out.println("alert('"+message+"');");
		out.println("history.back();");
		out.println("</script>");
		return null;
	}

}
