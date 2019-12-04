package movie2019.movie.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

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

		ArrayList<Integer> list = hidden.getHiddenList();

		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(list, new TypeToken<List<Integer>>() {
		}.getType());

		if (!element.isJsonArray()) {
			System.out.println("aaaa");
			throw new Exception();
		}

		System.out.println("bbbb");
		String json = gson.toJson(element);

		// response.getWriter().append(Integer.toString(result));
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().append(json);
		System.out.println(json);
		return null;

	}

}
