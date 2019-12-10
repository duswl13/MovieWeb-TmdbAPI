package movie2019.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movie2019.review.db.ReviewDAO;
import movie2019.review.db.ReviewDetailVO;
import movie2019.review.db.ReviewVO;

public class ReviewDetail implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		String Movie_h =request.getParameter("Movie_h");
		String id = (String)session.getAttribute("id");
		ReviewDAO dao = new ReviewDAO();
		System.out.println("--------------------------------");
		System.out.println(id);
		System.out.println(Movie_h);
		ReviewDetailVO vo= dao.detail(id, Movie_h);
		System.out.println(vo);
		System.out.println("--------------------------------");
		request.setAttribute("vo", vo);
		return forward;
		
		

	}
	

}
