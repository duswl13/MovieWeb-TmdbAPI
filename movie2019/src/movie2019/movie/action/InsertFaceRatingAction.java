package movie2019.movie.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertFaceRatingAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		MovieDAO movieDAO = new MovieDAO();

		int movieId = Integer.parseInt(request.getParameter("movieId"));
		String movieTitle = (String) request.getParameter("movieTitle");
		int movieFace = Integer.parseInt(request.getParameter("movieFace"));
		String userId = "duswl13"; // 추후 session 수정
		System.out.println("movieTitle : "+ movieTitle);
		// movieID 있는지 확인, 없으면 추가까지
		boolean isMovieId = movieDAO.isMovieId(movieId, movieTitle);

		if (isMovieId) {
			// 표정점수 등록
			int result = movieDAO.InsertFaceRating(movieId, movieFace, userId);
			response.getWriter().append(Integer.toString(result));
		
		} else {
			response.getWriter().append(Integer.toString(-1));
		}
		return null;
	}

}
