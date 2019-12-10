//delete는 내 리뷰 모아보기에서만 가능한 기능
//아이디 검증 필요 X
package movie2019.review.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PriReviewDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {

		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String userId = null;

		if (session.getAttribute("id")==request.getParameter(userId)) {
			userId = (String) session.getAttribute("id");
			System.out.println("리뷰 삭제 성공");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('리뷰를 삭제했습니다.");
			out.println("location.href='ReviewPrivateList.rv';");
			out.println("</script>");
			out.close();
			return null;		
		}

		System.out.println("리뷰 삭제 실패");
		forward.setRedirect(false);
		request.setAttribute("message", "리뷰 삭제를 실패했습니다.");
		forward.setPath("error/error.jsp");
		return forward;

	}

}
