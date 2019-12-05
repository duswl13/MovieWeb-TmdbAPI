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
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		int result=hdao.delete(user_id, movie_id);
		String message = user_id+"님 선택한 영화가 숨김 항목에서 삭제 되었습니다.";
		if(result!=1) {
			message="삭제가 되지 않았습니다.";
		}
		out.println("<script>");
		out.println("alert('"+message+"');");
		out.println("location.href='hidden_list.mh'");
		out.println("</script>");
		return null;
	}

}
