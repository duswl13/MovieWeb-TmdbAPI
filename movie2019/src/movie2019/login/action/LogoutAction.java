package movie2019.login.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
		session.invalidate();
		
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('안녀엉 다음에 또 보슈~')");
		out.println("location.href='main.ml'"); 
		out.println("</script>");
		return null;
	}

}
