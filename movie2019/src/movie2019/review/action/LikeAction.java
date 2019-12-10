package movie2019.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movie2019.review.db.ReviewDAO;
import movie2019.review.db.ReviewVO;

public class LikeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ReviewDAO reviewdao = new ReviewDAO();
		ReviewVO reviewvo = new ReviewVO();

		HttpSession session = request.getSession();
		String likeId = null;

		if (session.getAttribute("id") != null)
			likeId = (String) session.getAttribute("id");

		String userId = request.getParameter("likeId");
		int movieid = Integer.parseInt(request.getParameter("movieId"));

		System.out.println("userId : " + userId);
		System.out.println("movieid : " + movieid);

		int result = -2;

		if (likeId != null) {

			try {

				result = reviewdao.addLike(movieid, userId, likeId);

				if (result == 0) {
					// 등록 실패
					System.out.println("좋아요 등록 실패");

				} else if (result == 1) {
					System.out.println("좋아요 등록 성공");
					// 등록 성공

				} else {
					System.out.println("좋아요 이미 있음");
				}

			} catch (Exception ex) {
				ex.printStackTrace();
			}

		}
		response.getWriter().append(Integer.toString(result));
		return null;

	}

}
