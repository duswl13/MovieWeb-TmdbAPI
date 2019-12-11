package movie2019.mypage.hidden;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HiddenDAO hdao = new HiddenDAO();
		request.setCharacterEncoding("utf-8");
		String user_id=request.getParameter("user_id");
		String movie_id=request.getParameter("movie_id");
		int result=hdao.delete(user_id, movie_id);
		if(result!=1) {
			System.out.println("숨김 항목 삭제 실패");
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("location.href='hidden_list.mh'");
		out.println("</script>");
		return null;
	}

}
