package movie2019.movie.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateFaceRatingAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		MovieDAO movieDAO = new MovieDAO();

		int movieId = Integer.parseInt(request.getParameter("movieId"));
		int movieFace = Integer.parseInt(request.getParameter("movieFace"));
		String userId = "duswl13"; // 추후 session 수정

		// 표정점수 등록
		int result = movieDAO.UpdateFaceRating(movieId, movieFace, userId);
		response.getWriter().append(Integer.toString(result));

		return null;

	}

}
