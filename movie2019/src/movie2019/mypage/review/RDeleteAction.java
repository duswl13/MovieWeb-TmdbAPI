package movie2019.mypage.review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ReviewDAO rdao = new ReviewDAO();
		request.setCharacterEncoding("utf-8");
		int review_number=Integer.parseInt(request.getParameter("review_number"));
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		int result=rdao.delete(review_number);
		String message = "선택한 리뷰가 삭제 되었습니다.";
		if(result!=1) {
			message="삭제가 되지 않았습니다.";
		}
		out.println("<script>");
		out.println("alert('"+message+"');");
		out.println("location.href='review_list.mr'");
		out.println("</script>");
		return null;
	}

}
