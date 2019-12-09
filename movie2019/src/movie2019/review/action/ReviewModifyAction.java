package movie2019.review.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movie2019.review.db.ReviewDAO;
import movie2019.review.db.ReviewVO;

public class ReviewModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {

		request.setCharacterEncoding("UTF-8");

		ReviewDAO reviewdao = new ReviewDAO();
		ReviewVO reviewvo = new ReviewVO();

		ActionForward forward = new ActionForward();
		boolean result = false;

		HttpSession session = request.getSession();
		String userId = null;

		// 아이디 비교
		if (session.getAttribute("id") == request.getParameter(userId)) {
			reviewvo.setUSER_ID(userId);
			reviewvo.setREVIEW_TITLE(request.getParameter("REVIEW_TITLE"));
			reviewvo.setREVIEW_CONTENT(request.getParameter("REVIEW_CONTENT"));

			result = reviewdao.reviewModify(reviewvo);
		}

		// 로그인아이디 != 글쓴이아이디
		if (session.getAttribute("id") != userId) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글쓴이만 수정 가능합니다.')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}

		// 실패
		if (result == false) {
			System.out.println("리뷰 수정 실패");
			forward.setRedirect(false);
			request.setAttribute("message", "리뷰 수정 실패하였습니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		// 수정 성공
		System.out.println("리뷰를 수정했습니다.");

		forward.setRedirect(true);
		// 수정 내용 확인
		forward.setPath("ReviewDetailAction.rv?num=" + reviewvo.getREVIEW_NUMBER());

		return forward;

	}
}
