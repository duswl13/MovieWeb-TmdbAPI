package movie2019.movie.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movie2019.movie.db.MovieAPIDAO;
import movie2019.movie.db.MovieCreditVO;
import movie2019.movie.db.MovieDAO;
import movie2019.movie.db.MovieItemAPIVO;
import movie2019.movie.db.MovieItemDetailAPIVO;
import movie2019.movie.db.MoviePageAPIVO;
import movie2019.review.db.AllReviewVO;
import movie2019.review.db.ReviewVO;

public class MovieDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response, ServletContext sc)
			throws Exception {

		HttpSession session = request.getSession();
		String userId = null;

		String apikey = sc.getInitParameter("APIKEY");

		if (session.getAttribute("id") != null)
			userId = (String) session.getAttribute("id");

		int movieId = Integer.parseInt(request.getParameter("id"));
		String movieTitle = request.getParameter("title");
		
		String poster_path = request.getParameter("poster_path");
		System.out.println("movieTitle : " + movieTitle);

		MovieAPIDAO movieAPIDAO = new MovieAPIDAO();

		// 영화 비디오 가져옴
		String videoUrl = movieAPIDAO.getVideo(apikey, movieId);

		// 영화 세부정보 가져옴
		MovieItemDetailAPIVO p_vo = movieAPIDAO.getMovie(apikey, movieId);
		System.out.println(this.getClass().getName() + "제목: " + p_vo.getTitle());
		System.out.println(this.getClass().getName() + "내용:" + p_vo.getOverview());
		p_vo.setStar(addStar(p_vo));

		// 영화 출연진 가져옴
		MovieCreditVO c_vo = movieAPIDAO.getCredit(apikey, movieId);

		// 비슷한 영화 가져옴
		MoviePageAPIVO s_vo = movieAPIDAO.getSimilarMovie(apikey, movieId);

		// 비슷한 영화들에 별점 박아야함
		if (s_vo.getResults() != null && s_vo.getResults().size() > 1)
			s_vo.setResults(addStar(s_vo.getResults()));

		MovieDAO movieDAO = new MovieDAO();
		boolean isMovieId = movieDAO.isMovieId(movieId, movieTitle,poster_path);

		if (isMovieId) {

			int face = movieDAO.SelectFaceRating(movieId, userId);
			System.out.println("내 표정 점수: " + face);

			int star = movieDAO.SelectStarRating(movieId, userId);
			System.out.println("내 별점 점수 : " + star);

			int[] movieStar = movieDAO.MovieAllStar(movieId);

			int[] movieFace = movieDAO.MovieAllLike(movieId);

			ReviewVO review = movieDAO.MyReviewRating(movieId, userId);
			if (review != null) {
				System.out.println("리뷰 제목: " + review.getREVIEW_TITLE());
				System.out.println("리뷰 내용 : " + review.getREVIEW_CONTENT());
			}

			ArrayList<AllReviewVO> bestreview = movieDAO.BestReviewRating(movieId);

			ActionForward forward = new ActionForward();

			request.setAttribute("list", p_vo); // 세부정보 가져옴
			request.setAttribute("movieId", movieId);
			request.setAttribute("credit", c_vo.getCast()); // 출연진 가져옴
			request.setAttribute("similar", s_vo.getResults());
			request.setAttribute("face", face); // 내 평가
			request.setAttribute("star", star); // 내 평가
			request.setAttribute("allstar", movieStar);
			request.setAttribute("allface", movieFace);
			request.setAttribute("review", review);
			request.setAttribute("bestreview", bestreview);
			request.setAttribute("movieurl", videoUrl);
			forward.setRedirect(false);
			forward.setPath("Page/MovieDetail/MovieDetail.jsp");
			return forward;

		}

		return null;

	}

	private List<MovieItemAPIVO> addStar(List<MovieItemAPIVO> list) {

		MovieDAO moviedao = new MovieDAO();
		return moviedao.addStar(list);
	}

	private int addStar(MovieItemDetailAPIVO list) {
		MovieDAO moviedao = new MovieDAO();
		return moviedao.addStar(list);
	}

}
