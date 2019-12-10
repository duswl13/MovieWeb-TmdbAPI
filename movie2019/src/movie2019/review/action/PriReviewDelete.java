//delete는 내 리뷰 모아보기에서만 가능한 기능
//아이디 검증 필요 X
package movie2019.review.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movie2019.review.db.ReviewDAO;
import movie2019.review.db.ReviewVO;

public class PriReviewDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {

		ReviewDAO reviewdao = new ReviewDAO();
		ReviewVO reviewvo = new ReviewVO();
		
		request.setCharacterEncoding("UTF-8");
		boolean result = false;
		int num = Integer.parseInt(request.getParameter("REVIEW_NUMBER"));

		result = reviewdao.PriReviewDelete(num);
		ActionForward forward = new ActionForward();
		
		if (result != false) {
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
