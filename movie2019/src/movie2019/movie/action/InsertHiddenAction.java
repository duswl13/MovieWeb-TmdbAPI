package movie2019.movie.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.movie.singleton.hiddenSingleton;

public class InsertHiddenAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// hidden ΩÃ±€≈Ê
		hiddenSingleton hidden = hiddenSingleton.getInstance();

		MovieDAO movieDAO = new MovieDAO();
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		String movieTitle = request.getParameter("movieTitle");

		int result = 0;
		if (movieDAO.isMovieId(movieId, movieTitle)) {
			result = movieDAO.InsertHidden(movieId, "duswl13");
			if (result == 1) {
				hidden.addHiddenValue(movieId);
			}
		}

		response.getWriter().append(Integer.toString(result));

		return null;

	}

}
