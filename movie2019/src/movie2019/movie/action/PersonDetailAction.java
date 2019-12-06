package movie2019.movie.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.movie.db.MovieAPIDAO;
import movie2019.movie.db.MovieDAO;
import movie2019.movie.db.MovieItemAPIVO;
import movie2019.movie.db.MoviePersonVO;

public class PersonDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response, ServletContext sc)
			throws Exception {

		String personId = request.getParameter("id");
		String name = request.getParameter("name");
		String apikey = sc.getInitParameter("APIKEY");

		MovieAPIDAO movieAPIDAO = new MovieAPIDAO();
		MoviePersonVO c_vo = movieAPIDAO.getPersonMovie(apikey, personId);
		c_vo.setCast((addStar((ArrayList<MovieItemAPIVO>) c_vo.getCast())));

		for(MovieItemAPIVO i : c_vo.getCast())
			System.out.println(i.getTitle() + ":"+i.getStar());
		
		ActionForward forward = new ActionForward();
		request.setAttribute("list", c_vo.getCast());
		request.setAttribute("name", name);
		forward.setRedirect(false);
		forward.setPath("Page/MovieDetail/PersonDetail.jsp");
		return forward;
	}

	private List<MovieItemAPIVO> addStar(ArrayList<MovieItemAPIVO> list) {

		MovieDAO moviedao = new MovieDAO();
		return moviedao.addStar(list);
	}

}
