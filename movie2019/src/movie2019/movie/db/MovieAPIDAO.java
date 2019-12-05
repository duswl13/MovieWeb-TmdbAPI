package movie2019.movie.db;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
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
			System.out.println(results.get(i).getTitle());
			if (results.get(i).getPoster_path() == null || results.get(i).getOverview() == null
					|| results.get(i).getGenre_ids() == null || results.get(i).getOverview().equals("")
					|| results.get(i).getGenre_ids().equals("") || results.get(i).getOverview().contains("섹스")) {

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
			json = readUrl("https://api.themoviedb.org/3/search/movie?"
					+ "api_key="+apikey+"&language=ko-KO&query="
					+ key+"&page="+page+"&include_adult=false&region=KR");

		} catch (Exception e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		MoviePageAPIVO vo = gson.fromJson(json, MoviePageAPIVO.class);
		vo.setResults(filter(vo.getResults()));

		return vo;
	}

}
