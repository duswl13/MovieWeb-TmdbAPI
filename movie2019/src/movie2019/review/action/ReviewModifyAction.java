package movie2019.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movie2019.review.db.ReviewDAO;
import movie2019.review.db.ReviewVO;

public class ReviewModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ReviewDAO reviewdao = new ReviewDAO();
		ReviewVO reviewvo = new ReviewVO();

		ActionForward forward = new ActionForward();
		boolean result = false;

		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("id");
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		reviewvo.setUSER_ID(userId);
		reviewvo.setMOVIE_ID(movieId);
		reviewvo.setREVIEW_TITLE(request.getParameter("rvtitle"));
		reviewvo.setREVIEW_CONTENT(request.getParameter("rvcontent"));

		result = reviewdao.reviewModify(reviewvo);

		// 실패
		if (result == false) {
			System.out.println("리뷰 수정 실패");
			forward.setRedirect(false);
			request.setAttribute("message", "리뷰 수정 실패");
			forward.setPath("error/error.jsp");
			return forward;
		}
		// 수정 성공
		System.out.println("리뷰 수정 성공");

		response.getWriter().print("<script>alert('리뷰가 정상적으로 수정되었습니다.'); location.href='moviedetail.ml?open=false&id="+movieId+"';</script>");
		return null;

	}
}
