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

public class SearchMovieAction implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response, ServletContext sc)
			throws Exception {

		MovieAPIDAO movieAPIDAO = new MovieAPIDAO();

		String apikey = sc.getInitParameter("APIKEY");
		String key = request.getParameter("key");
		boolean re = false;
		int page = 1;

		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		if (request.getParameter("re") != null)
			re = Boolean.parseBoolean(request.getParameter("re"));

		System.out.println(this.getClass().getName() + ":rs - " + re);
		System.out.println(this.getClass().getName() + ":key - " + key);
		
		MoviePageAPIVO p_vo = movieAPIDAO.getSearchMovie(apikey, key, page);

		p_vo.setResults((addStar((ArrayList<MovieItemAPIVO>) p_vo.getResults())));

		System.out.println(this.getClass().getName() + ":page? - " + (p_vo.getPage() < p_vo.getTotal_pages()));

		if (!re) {

			System.out.println(this.getClass().getName() + ":p_vo.getResults() - " + p_vo.getResults().size());
			
			request.setAttribute("list", p_vo.getResults());
			
			request.setAttribute("more", p_vo.getPage() < p_vo.getTotal_pages());
			request.setAttribute("key",key);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("Page/Search/Search.jsp");

			return forward;

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
			System.out.println("searchList 가져옴 : " + json);

			return null;
		}
	}

	private List<MovieItemAPIVO> addStar(ArrayList<MovieItemAPIVO> list) {

		MovieDAO moviedao = new MovieDAO();
		return moviedao.addStar(list);
	}

}
