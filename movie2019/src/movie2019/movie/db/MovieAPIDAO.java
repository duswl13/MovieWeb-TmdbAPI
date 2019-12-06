package movie2019.movie.db;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.google.gson.Gson;

public class MovieAPIDAO {

	public MoviePageAPIVO getComingsoonMovie(String apikey, String startdate, String enddate) {
		String json = null;

		try {
			json = readUrl("https://api.themoviedb.org/3/discover/movie?api_key=" + apikey
					+ "&language=ko-KO&region=KR&sort_by=release_date.desc&include_adult=false&release_date.gte="
					+ startdate + "&release_date.lte=" + enddate);
		} catch (Exception e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		MoviePageAPIVO page = gson.fromJson(json, MoviePageAPIVO.class);

		page.setResults(filter(page.getResults()));

		return page;
	}

	private List<MovieItemAPIVO> filter(List<MovieItemAPIVO> results) {
		for (int i = 0; i < results.size(); i++) {

			if (results.get(i).getPoster_path() == null || results.get(i).getOverview() == null
					|| results.get(i).getGenre_ids() == null || results.get(i).getOverview().equals("")
					|| results.get(i).getGenre_ids().equals("") || results.get(i).getOverview().contains("섹스")
					|| results.get(i).getTitle().contains("섹스")) {

				results.remove(i);
				i--;

			}
		}
		return results;

	}

	private List<MovieCreditItemVO> CreditFilter(List<MovieCreditItemVO> results) {
		for (int i = 0; i < results.size(); i++) {

			if (results.get(i).getProfile_path() == null || results.get(i).getName() == null
					|| results.get(i).getProfile_path().equals("") || results.get(i).getName().equals("")) {

				results.remove(i);
				i--;

			}
		}
		return results;

	}

	public MoviePageAPIVO getPopularityMovie(String apikey) {
		String json = null;

		try {
			json = readUrl("https://api.themoviedb.org/3/movie/popular?api_key=" + apikey
					+ "&language=ko-KO&page=1&region=KR");

		} catch (Exception e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		MoviePageAPIVO page = gson.fromJson(json, MoviePageAPIVO.class);

		page.setResults(filter(page.getResults()));

		return page;
	}

	public MoviePageAPIVO getLastMovie(String apikey, String startdate, String enddate) {
		String json = null;

		try {
			json = readUrl("https://api.themoviedb.org/3/discover/movie?api_key=" + apikey
					+ "&language=ko-KO&region=KR&sort_by=release_date.desc&include_adult=false&release_date.gte="
					+ startdate + "&release_date.lte=" + enddate);

		} catch (Exception e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		MoviePageAPIVO page = gson.fromJson(json, MoviePageAPIVO.class);
		page.setResults(filter(page.getResults()));

		return page;
	}

	public String getVideo(String apikey, int id) {

		String url = "http://api.themoviedb.org/3/movie/" + +id + "/videos?api_key=" + apikey;

		String json = null;

		try {
			json = readUrl(url);

		} catch (Exception e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		VideoAPIVO page = gson.fromJson(json, VideoAPIVO.class);

		if (page != null && page.getResults().size() > 0)
			return page.getResults().get(0).key;

		return null;

	}

	private static String readUrl(String urlString) throws Exception {
		BufferedReader reader = null;
		try {
			URL url = new URL(urlString);
			reader = new BufferedReader(new InputStreamReader(url.openStream()));
			StringBuffer buffer = new StringBuffer();
			int read;
			char[] chars = new char[1024];
			while ((read = reader.read(chars)) != -1)
				buffer.append(chars, 0, read);

			return buffer.toString();
		} finally {
			if (reader != null)
				reader.close();
		}
	}

	public MoviePageAPIVO getSearchMovie(String apikey, String key, int page) {
		String json = null;

		try {
			json = readUrl("https://api.themoviedb.org/3/search/movie?" + "api_key=" + apikey + "&language=ko-KO&query="
					+ key + "&page=" + page + "&include_adult=false&region=KR");

		} catch (Exception e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		MoviePageAPIVO vo = gson.fromJson(json, MoviePageAPIVO.class);
		vo.setResults(filter(vo.getResults()));

		return vo;
	}

	public MoviePageAPIVO getMovieList(String apikey, int option, int page, String genre) {

		String json = null;

		String url = "https://api.themoviedb.org/3/";

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String today = format.format(new Date());
		Calendar c = Calendar.getInstance();
		c.add(c.MONTH, +3);
		String next_month = format.format(c.getTime());

		// 선택 종류에 따라 url 나눔
		switch (option) {

		// 인기영화 목록
		case 1:
			url += "movie/popular?api_key=" + apikey + "&language=ko-KO&page=" + page + "&region=KR";
			break;
		// 최신 영화 목록 현재날짜가 end
		case 2:
			url += "discover/movie?api_key=" + apikey + "&language=ko-KO&page=" + page
					+ "&region=KR&sort_by=release_date.desc&release_date.lte=" + today;
			break;

		// 개봉 예정 영화 목록 오늘날짜start +3달 날짜end
		case 3:
			url += "discover/movie?api_key=" + apikey + "&language=ko-KO&page=" + page
					+ "&region=KR&sort_by=release_date.asc&include_adult=false&release_date.gte=" + today
					+ "&release_date.lte=" + next_month;
			break;
		}

		// 장르옵션 선택되어있다면
		if (genre != null && !genre.equals(""))
			url += "&with_genres=" + genre;

		try {
			json = readUrl(url);

		} catch (Exception e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		MoviePageAPIVO pp = gson.fromJson(json, MoviePageAPIVO.class);

		pp.setResults(filter(pp.getResults()));

		return pp;
	}

	public MovieItemDetailAPIVO getMovie(String apikey, int movieId) {

		String json = null;
		String url = "https://api.themoviedb.org/3/movie/" + movieId
				+ "?api_key=139dd374c866d879d4ac74f2f897ac19&language=ko-KO";

		try {
			json = readUrl(url);
		} catch (Exception e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		MovieItemDetailAPIVO page = gson.fromJson(json, MovieItemDetailAPIVO.class);
		return page;

	}

	public MovieCreditVO getCredit(String apikey, int movieId) {

		String json = null;
		String url = "https://api.themoviedb.org/3/movie/" + movieId + "/credits?api_key=" + apikey;

		try {
			json = readUrl(url);
		} catch (Exception e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		MovieCreditVO page = gson.fromJson(json, MovieCreditVO.class);

		page.setCast(CreditFilter(page.getCast()));

		// 출연진 6개까지만 나타냄
		if (page.getCast().size() > 6)
			page.setCast(page.getCast().subList(0, 6));
		return page;

	}

	public MoviePageAPIVO getSimilarMovie(String apikey, int movieId) {

		String json = null;
		String url = "https://api.themoviedb.org/3/movie/" + movieId + "/similar?api_key=" + apikey
				+ "&language=ko-KO&page=1";

		try {
			json = readUrl(url);
		} catch (Exception e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		MoviePageAPIVO page = gson.fromJson(json, MoviePageAPIVO.class);

		page.setResults(filter(page.getResults()));

		// 비슷한 영화 6개까지만 나타냄
		if (page.getResults().size() > 6)
			page.setResults(page.getResults().subList(0, 6));

		return page;

	}

	public MoviePersonVO getPersonMovie(String apikey, String personId) {

		String json = null;
		String url = "https://api.themoviedb.org/3/person/" + personId + "/movie_credits?api_key=" + apikey
				+ "&language=ko-KO";

		try {
			json = readUrl(url);
		} catch (Exception e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		MoviePersonVO page = gson.fromJson(json, MoviePersonVO.class);

		page.setCast(filter(page.getCast()));

		return page;
	}

}
