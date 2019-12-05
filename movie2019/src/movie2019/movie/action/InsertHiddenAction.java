package movie2019.movie.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import movie2019.movie.db.MovieDAO;
import movie2019.movie.singleton.hiddenSingleton;

public class InsertHiddenAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response, ServletContext sc)
			throws Exception {

		hiddenSingleton hidden = hiddenSingleton.getInstance();

		MovieDAO movieDAO = new MovieDAO();
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		String movieTitle = request.getParameter("movieTitle");
		HttpSession session = request.getSession();
		String userId;

		if (session.getAttribute("id") != null) {
			userId = (String) session.getAttribute("id");

			int result = 0;
			if (movieDAO.isMovieId(movieId, movieTitle)) {
				result = movieDAO.InsertHidden(movieId, userId);
				if (result == 1) {
					hidden.addHiddenValue(movieId);
				}
			}

			ArrayList<Integer> list = hidden.getHiddenList();

			Gson gson = new Gson();
			JsonElement element = gson.toJsonTree(list, new TypeToken<List<Integer>>() {
			}.getType());

			if (element.isJsonArray()) {

				String json = gson.toJson(element);

				response.getWriter().append(json);
				System.out.println(json);
			}
		} else {

			response.getWriter().append(Integer.toString(0));
		}
		return null;

	}

}
