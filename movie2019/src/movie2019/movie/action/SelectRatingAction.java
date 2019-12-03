package movie2019.movie.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.review.db.AllReviewVO;
import movie2019.review.db.ReviewVO;

public class SelectRatingAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		MovieDAO movieDAO = new MovieDAO();

		int movieId = Integer.parseInt(request.getParameter("id"));
		String movieTitle = (String) request.getParameter("title");
		String userId = "duswl13"; // 추 후 session

		System.out.println("movieTitle : " + movieTitle);
		// movieID 있는지 확인, 없으면 추가까지
		boolean isMovieId = movieDAO.isMovieId(movieId, movieTitle);

		if (isMovieId) {

			// 표정점수 가져오기
			int face = movieDAO.SelectFaceRating(movieId, userId);
			System.out.println("내 표정 점수 : " + face);
			// 별점점수 가져오기
			int star = movieDAO.SelectStarRating(movieId, userId);
			System.out.println("내 별점 점수 : " + star);
			
			//해당 별점 분포
			int[] movieStar = movieDAO.MovieAllStar(movieId);
			//해당 좋아요 분포
			int[] movieFace = movieDAO.MovieAllLike(movieId);
			
			
			
			// 내 리뷰 가져오기
			ReviewVO review = movieDAO.MyReviewRating(movieId, userId);
			if (review != null) {
				System.out.println("내 리뷰 : " + review.getREVIEW_TITLE());
				System.out.println("내 내용 : " + review.getREVIEW_CONTENT());
			}
			// 베스트 리뷰 3개 가져오기
			ArrayList<AllReviewVO> bestreview = movieDAO.BestReviewRating(movieId);

			ActionForward forward = new ActionForward();

			request.setAttribute("face", face);
			request.setAttribute("star", star);
			request.setAttribute("allstar", movieStar);
			request.setAttribute("allface", movieFace);
			request.setAttribute("review", review);
			request.setAttribute("bestreview", bestreview);

			forward.setRedirect(false);
			forward.setPath("Page/MovieDetail/MovieDetail.jsp");
			return forward;

		}

		return null;

	}

}
