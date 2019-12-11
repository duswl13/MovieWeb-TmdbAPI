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

		request.setCharacterEncoding("UTF-8");
		

		ReviewDAO reviewdao = new ReviewDAO();
		ReviewVO reviewvo = new ReviewVO();

		ActionForward forward = new ActionForward();
		
		boolean result = false;
		String userId = null;
		
		HttpSession session = request.getSession();
		if (session.getAttribute("id") != null) 
			userId = (String) session.getAttribute("id");
		
		int num = Integer.parseInt(request.getParameter("movieId"));
		result = reviewdao.PriReviewDelete(num,userId);
	
		//삭제 처리 실패한 경우
		if (result == false) {
			System.out.println("리뷰 삭제 실패");
			forward.setRedirect(false);
			request.setAttribute("message", "리뷰 ㅅ각제 실패!");
			forward.setPath("error/error.jsp");
			return forward;
		}
		
		//삭제 성공한 경우 - 글 목록보기 요청 전송
		System.out.println("리뷰 삭제 성공");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제 완료~ 안녀엉');");
		out.println("history.back();");
		out.println("</script>");
		out.close();
		return null;		
	}
}
