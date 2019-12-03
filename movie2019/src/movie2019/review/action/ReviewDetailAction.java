package movie2019.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import movie2019.review.db.ReviewDAO;
import movie2019.review.db.ReviewVO;

public class ReviewDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ReviewDAO reviewdao = new ReviewDAO();
		ReviewVO reviewvo = new ReviewVO();

		// 글번호 파라미터값을 num변수에 저장
		int num = Integer.parseInt(request.getParameter("num"));

		// 글의 내용을 DAO에서 읽은 후 얻은 결과를 boarddata 객체에 저장
		reviewvo = reviewdao.getDetail(num);

		ActionForward forward = new ActionForward();

		// DAO에서 글의 내용을 읽지 못했을 경우 null 반환
		if (reviewvo == null) {
			System.out.println("상세보기 실패");
			forward.setRedirect(false);
			request.setAttribute("message", "게시판 상세보기 실패다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		System.out.println("상세보기 성공");

		// boarddata객체를 Request객체에 저장
		request.setAttribute("reviewvo", reviewvo);
		forward.setRedirect(false);

		// 글 내용 보기 페이지로 이동하기 위해 경로를 설정review합니다.
		forward.setPath("review/review_view.jsp");
		return forward;
	}

}
