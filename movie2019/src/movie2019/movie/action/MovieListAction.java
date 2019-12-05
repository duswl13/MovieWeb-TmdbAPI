package movie2019.movie.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.movie.db.MovieAPIDAO;
import movie2019.movie.db.MovieDAO;
import movie2019.movie.db.MovieItemAPIVO;
import movie2019.movie.db.MoviePageAPIVO;
import movie2019.movie.singleton.hiddenSingleton;

public class MovieListAction implements Action {

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
			re = Boolean.parseBoolean(request.getParameter("option"));
		if (request.getParameter("genre") != null)
			genre = request.getParameter("genre");

		// 처음은 false, 그다음부터 ajax로 true
		System.out.println(this.getClass().getName() + ":rs - " + re);
		System.out.println(this.getClass().getName() + ":page - " + page);
		System.out.println(this.getClass().getName() + ":option - " + option);
		System.out.println(this.getClass().getName() + ":genre - " + genre);

		//re 여부에 따라 다름
		//MoviePageAPIVO p_vo = movieAPIDAO.getSearchMovie(apikey,option,page);
		//p_vo.setResults((addStar((ArrayList<MovieItemAPIVO>) p_vo.getResults())));

		
		ActionForward forward = new ActionForward();

		forward.setRedirect(false);
		forward.setPath("Page/MovieList/MovieList.jsp");
		return forward;
	}
	
	private List<MovieItemAPIVO> addStar(ArrayList<MovieItemAPIVO> list) {

		MovieDAO moviedao = new MovieDAO();
		return moviedao.addStar(list);
	}

}
