package movie2019.review.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.review.db.ReviewDAO;
import movie2019.review.db.ReviewVO;

public class ReviewModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();

		Boolean result = false;

		ReviewDAO reviewdao = new ReviewDAO();
		ReviewVO reviewvo = new ReviewVO();



		try {
			
			int num = Integer.parseInt(request.getParameter("BOARD_NUM"));
			String id = request.getParameter("USER_ID");

			// 글쓴이가 맞는지 확인하기 위해 저장된 비번 & 입력 비번 비교
			boolean usercheck = reviewdao.isReviewWriter(num, id);

			// 다른 경우
			if (usercheck == false) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('본인이 작성한 리뷰만 수정/삭제 가능합니다.')");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				return null;
			}

			// 일치하는 경우 수정 내용 설정한다.
			// BoardBean객체에 글 등록 폼에서 입력받은 정보들을 저장.
			reviewvo.setUSER_ID(id);
			reviewvo.setREVIEW_TITLE(request.getParameter("REVIEW_TITLE"));
			reviewvo.setREVIEW_CONTENT(request.getParameter("REVIEW_CONTENT"));

			
			// DAO에서 수정 메소드 호출해 수정하기
			result = reviewdao.reviewModify(reviewvo);

			// 수정 실패한 경우
			if (result == false) {
				System.out.println("리뷰 수정 실패");
				forward.setRedirect(false);
				request.setAttribute("message", "리뷰 수정 실패");
				forward.setPath("error/error.jsp");
				return forward;
			}
			// 게시글 수정이 제대로 된 경우
			System.out.println("리뷰 수정 완료!");

			forward.setRedirect(true);
			// 수정한 글 내용 확인을 위해 글 내용보기 페이지를 경로로 설정
			forward.setPath("ReviewDetailAction.rv?num=" + reviewvo.getREVIEW_NUMBER());

			return forward;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
