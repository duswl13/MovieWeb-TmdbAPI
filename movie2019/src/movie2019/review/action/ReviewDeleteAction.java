package movie2019.review.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.login.action.ActionForward;
import movie2019.review.db.ReviewDAO;

public class ReviewDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		boolean result = false;
		boolean usercheck = false;

		int num = Integer.parseInt(request.getParameter("num"));

		ReviewDAO reviewdao = new ReviewDAO();

		// 글을 삭제하려는 사용자가 글쓴이가 맞는지 판단하기 위해
		// 입력한 아이디와 글쓴이 아이디를 비교해 일치하면 삭제.
		usercheck = reviewdao.isReviewWriter(num, request.getParameter("USER_ID"));

		// 일치하지 않는 경우

		if (usercheck == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('다른 회원의 리뷰는 삭제할 수 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}

		// 비밀번호 일치하는 경우 삭제 진행ㄱㄱ
		result = reviewdao.reviewDelete(num);
		ActionForward forward = new ActionForward();

		// 삭제 처리 실패한 경우
		if (result == false) {
			System.out.println("리뷰 삭제 실패");
			forward.setRedirect(false);
			request.setAttribute("message", "리뷰 삭제 실패!");
			forward.setPath("error/error.jsp");
			return forward;
		}

		// 삭제 성공한 경우 - 글 목록보기 요청 전송
		System.out.println("리뷰 삭제 성공");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제 완료~ 안녀엉');");
		out.println("location.href='ReviewList.rv';");
		out.println("</script>");
		out.close();
		return null;

	}

}
