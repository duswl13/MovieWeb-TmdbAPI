package movie2019.movie.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movie2019.movie.db.MovieDAO;

public class InsertStarRatingAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response, ServletContext sc)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		MovieDAO movieDAO = new MovieDAO();

		int movieId = Integer.parseInt(request.getParameter("movieId"));
		int movieFace = Integer.parseInt(request.getParameter("movieStar"));

		HttpSession session = request.getSession();
		String userId = null;

		if (session.getAttribute("id") != null)
			userId = (String) session.getAttribute("id");

		if (userId != null) {
			int result = movieDAO.InsertStarRating(movieId, movieFace, userId);
			response.getWriter().append(Integer.toString(result));
		} else
			response.getWriter().append(Integer.toString(-5));
		return null;
	}

}
