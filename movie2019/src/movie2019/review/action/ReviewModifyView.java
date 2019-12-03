package movie2019.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.review.db.ReviewDAO;
import movie2019.review.db.ReviewVO;

public class ReviewModifyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {

		ActionForward forward = new ActionForward();

		ReviewDAO reviewdao = new ReviewDAO();
		ReviewVO reviewvo = new ReviewVO();

		// 파라미터로 전달받은 수정할 글 번호를 num변수에 저장
		int num = Integer.parseInt(request.getParameter("num"));
		// 글 내용 불러와서 boarddata객체에 저장
		reviewvo = reviewdao.getDetail(num);

		// 글 내용이 없는 경우
		if (reviewvo == null) {
			System.out.println("수정 상세 보기 실패");
			forward.setRedirect(false);
			request.setAttribute("message", "리뷰 상세보기 실패");
			forward.setPath("error/error.jsp");
			return forward;
		}
		System.out.println("수정 상세보기 성공");

		// 수정 폼 페이지로 이동할 때 원본 글 내용을 보여주기 위해
		// boarddata객체를 Request객체에 저장.
		request.setAttribute("reviewvo", reviewvo);
		forward.setRedirect(false);
		// 글 수정 페이지 경로 지정
		forward.setPath("");
		return forward;
	}

}
