package movie2019.movie.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movie2019.movie.db.MovieAPIDAO;
import movie2019.movie.db.MovieDAO;
import movie2019.movie.db.MovieItemAPIVO;
import movie2019.movie.db.MoviePageAPIVO;
import movie2019.movie.singleton.hiddenSingleton;

public class MainMovieAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response, ServletContext sc)
			throws Exception {

		HttpSession session = request.getSession();
		String userId = null;

		String apikey = sc.getInitParameter("APIKEY");

		if (session.getAttribute("id") != null)
			userId = (String) session.getAttribute("id");

		MovieAPIDAO movieAPIDAO = new MovieAPIDAO();

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String today = format.format(new Date());
		Calendar c = Calendar.getInstance();

		c.add(c.MONTH, -1);
		String pre_month = format.format(c.getTime());

		c.add(c.MONTH, +3);
		String next_month = format.format(c.getTime());

		MoviePageAPIVO p_vo = movieAPIDAO.getPopularityMovie(apikey);
		MoviePageAPIVO l_vo = movieAPIDAO.getLastMovie(apikey, pre_month, today);
		MoviePageAPIVO y_vo = movieAPIDAO.getComingsoonMovie(apikey, today, next_month);

		if (userId != null) {

			hiddenSingleton hidden = hiddenSingleton.getInstance();
			MovieDAO movieDAO = new MovieDAO();

			hidden.addHiddenList(movieDAO.getHiddenList(userId));
			System.out.println("hiddenMovieSize = " + hidden.getHiddenList().size());

			ArrayList<MovieItemAPIVO> p_item = (ArrayList<MovieItemAPIVO>) p_vo.getResults();
			ArrayList<MovieItemAPIVO> l_item = (ArrayList<MovieItemAPIVO>) l_vo.getResults();
			ArrayList<MovieItemAPIVO> y_item = (ArrayList<MovieItemAPIVO>) y_vo.getResults();

			p_vo.setResults((hidden(p_item)));
			l_vo.setResults((hidden(l_item)));
			y_vo.setResults((hidden(y_item)));

		}

		p_vo.setResults((addStar((ArrayList<MovieItemAPIVO>) p_vo.getResults())));
		l_vo.setResults((addStar((ArrayList<MovieItemAPIVO>) l_vo.getResults())));
		y_vo.setResults((addStar((ArrayList<MovieItemAPIVO>) y_vo.getResults())));

		/*
		 * 별점 넣기 for(MovieItemAPIVO m : p_vo.getResults()) {
		 * System.out.println(m.getId() + ":" + m.getStar()); }
		 */

		MovieItemAPIVO movieItem = p_vo.getResults().get((new Random().nextInt(5)));
		
		movieItem.setTitle(movieItem.getTitle().replaceAll(":", "<br>"));
		
		String videoUrl = movieAPIDAO.getVideo(apikey, movieItem.getId());
		System.out.println("videoUrl:" + videoUrl);

		ActionForward forward = new ActionForward();

		request.setAttribute("p_list", p_vo.getResults());
		request.setAttribute("l_list", l_vo.getResults());
		request.setAttribute("y_list", y_vo.getResults());
		request.setAttribute("movieitem", movieItem);
		request.setAttribute("movieurl", videoUrl);
		forward.setRedirect(false);
		forward.setPath("Page/MainPage/MainPage.jsp");
		return forward;

	}

	private List<MovieItemAPIVO> addStar(ArrayList<MovieItemAPIVO> list) {

		MovieDAO moviedao = new MovieDAO();
		return moviedao.addStar(list);
	}

	private ArrayList<MovieItemAPIVO> hidden(ArrayList<MovieItemAPIVO> item) {

		hiddenSingleton hidden = hiddenSingleton.getInstance();
		ArrayList<Integer> list = hidden.getHiddenList();

		for (int i = 0; i < item.size(); i++) {

			if (list.contains(item.get(i).getId())) {
				item.remove(i);
				i--;
			}
		}

		return item;
	}

}
