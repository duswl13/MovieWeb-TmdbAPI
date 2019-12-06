package movie2019.movie.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import movie2019.movie.db.MovieAPIDAO;
import movie2019.movie.db.MovieDAO;
import movie2019.movie.db.MovieItemAPIVO;
import movie2019.movie.db.MoviePageAPIVO;

public class MovieListAction implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response, ServletContext sc)
			throws Exception {

		MovieAPIDAO movieAPIDAO = new MovieAPIDAO();

		String apikey = sc.getInitParameter("APIKEY");

		boolean re = false;
		int page = 1;
		int option = 1;
		String genre = "";

		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		if (request.getParameter("re") != null)
			re = Boolean.parseBoolean(request.getParameter("re"));
		if (request.getParameter("option") != null)
			option = Integer.parseInt(request.getParameter("option"));
		if (request.getParameter("genre") != null)
			genre = request.getParameter("genre");

		// 처음은 false, 그다음부터 ajax로 true
		// System.out.println(this.getClass().getName() + ":re - " + re);
		// System.out.println(this.getClass().getName() + ":page - " + page);
		// System.out.println(this.getClass().getName() + ":option - " + option);
		// System.out.println(this.getClass().getName() + ":genre - " + genre);

		MoviePageAPIVO p_vo = movieAPIDAO.getMovieList(apikey, option, page, genre);
		p_vo.setResults((addStar((ArrayList<MovieItemAPIVO>) p_vo.getResults())));

		// 첫 로딩일경우
		if (!re) {

			ActionForward forward = new ActionForward();
			request.setAttribute("more", p_vo.getPage() < p_vo.getTotal_pages());
			request.setAttribute("list", p_vo.getResults());
			request.setAttribute("option", option);
			forward.setRedirect(false);
			forward.setPath("Page/MovieList/MovieList.jsp");
			return forward;

			// ajax 요청일 경우 json으로 반환
		} else {
			JSONObject jObject = new JSONObject();
			jObject.put("page", p_vo.getPage());
			jObject.put("more", p_vo.getPage() < p_vo.getTotal_pages());

			jObject.put("total_results", p_vo.getTotal_results());
			jObject.put("total_pages", p_vo.getTotal_pages());

			JSONArray jArray = new JSONArray();
			for (MovieItemAPIVO m : p_vo.getResults()) {

				JSONObject item = new JSONObject();
				item.put("poster_path", m.getPoster_path());
				item.put("id", m.getId());
				item.put("original_title", m.getOriginal_title());
				item.put("title", m.getTitle());
				item.put("Star", m.getStar());
				jArray.add(item);
			}

			jObject.put("results", jArray);
			Gson gson = new Gson();
			String json = gson.toJson(jObject);
			response.getWriter().append(json);
			System.out.println("movieList 가져옴 : " + json);

			return null;
		}
	}

	private List<MovieItemAPIVO> addStar(ArrayList<MovieItemAPIVO> list) {

		MovieDAO moviedao = new MovieDAO();
		return moviedao.addStar(list);
	}

}
