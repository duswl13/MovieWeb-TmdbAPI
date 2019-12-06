package movie2019.admin.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO mdao=new UserDAO();
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("user_id");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		int result=mdao.delete(id);
		String message = id+"님 회원 정보가 삭제 되었습니다.";
		if(result!=1) {
			message="삭제가 되지 않았습니다.";
		}
		out.println("<script>");
		out.println("alert('"+message+"');");
		out.println("location.href='user_list.ul'");
		out.println("</script>");

		return null;
	}

}
