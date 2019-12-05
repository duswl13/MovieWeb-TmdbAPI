package movie2019.movie.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.movie.db.MovieDAO;

public class UpdateStarRatingAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response, ServletContext sc) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		MovieDAO movieDAO = new MovieDAO();

		int movieId = Integer.parseInt(request.getParameter("movieId"));
		int movieFace = Integer.parseInt(request.getParameter("movieStar"));
		String userId = "duswl13"; // 추후 session 수정

		// 별점점수 갱신
		int result = movieDAO.UpdateStarRating(movieId, movieFace, userId);
		System.out.println("별점 점수 갱신 : "+ result);
		response.getWriter().append(Integer.toString(result));

		return null;
	}

}
