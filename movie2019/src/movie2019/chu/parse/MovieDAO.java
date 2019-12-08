package movie2019.chu.parse;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.print.attribute.standard.Sides;

import com.google.gson.Gson;

import movie2019.chu.model.GenresVO;
import movie2019.chu.model.Rating_faceVO;

public class MovieDAO {
	
	
	
	public List<MovieInfoVO> getinfo(List<Rating_faceVO> matchings) {//유저매칭쪽
		String json = null;
		Collections.shuffle(matchings);
		Gson gson = new Gson();
		List<MovieInfoVO> info =new ArrayList<MovieInfoVO>();
		try {
			for(int i=0; i<matchings.size();i++) {
				MovieInfoVO result = new MovieInfoVO();
			json = readUrl("https://api.themoviedb.org/3/movie/"+matchings.get(i).getMovie_id()+"?api_key=4b3aa211760fe451c0edcb032c99f6b2&language=ko-KO"
					+ "&region=KR&page=1&include_adult=false");
			 result = gson.fromJson(json, MovieInfoVO.class);			
			info.add(result);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}
	

	public MoviePageVO getChu(List<GenresVO> gen, String p) {//장르분석쪽
		String json = null;
		try {
			Collections.shuffle(gen);
			String Id2 = "";
			for (int i = 0; i < gen.size(); i++) {
			         Id2 += gen.get(i).getGENRES_ID();
			         if (i < gen.size() - 1)
		            Id2 += "|";
			      }
			json = readUrl("https://api.themoviedb.org/3/discover/movie?api_key=139dd374c866d879d4ac74f2f897ac19&language=ko-KO&region=KR&"
					+ "sort_by=popularity.desc&include_adult=false&i"
					+ "nclude_video=false&page="+p+"&with_genres="+Id2);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		MoviePageVO page = gson.fromJson(json, MoviePageVO.class);

		page.setResults(filter(page.getResults()));
		

		return page;
	}

	public MoviePageVO getComingsoonMovie(String apikey, String startdate, String enddate) {
		String json = null;
		try {
			json = readUrl("https://api.themoviedb.org/3/discover/movie?api_key=" + apikey
					+ "&language=ko-KO&region=KR&sort_by=release_date.desc&include_adult=false&release_date.gte="
					+ startdate + "&release_date.lte=" + enddate);
		} catch (Exception e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		MoviePageVO page = gson.fromJson(json, MoviePageVO.class);

		page.setResults(filter(page.getResults()));
		

		return page;
	}

	private List<MovieItemVO> filter(List<MovieItemVO> results) {
			for(int i = 0; i < results.size(); i ++) {
				//System.out.println(results.get(i).getTitle());
				if(results.get(i).getPoster_path() == null ||
						results.get(i).getOverview() == null ||
						results.get(i).getGenre_ids() == null ||
						results.get(i).getOverview().equals("")||
						results.get(i).getGenre_ids().equals("")||
						results.get(i).getOverview().contains("섹스")) {
					
							results.remove(i);
								i--;
								
			}
			}
			return results;
			
	}

	public MoviePageVO getPopularityMovie(String apikey) {
		String json = null;

		try {
			json = readUrl("https://api.themoviedb.org/3/movie/popular?api_key=" + apikey
					+ "&language=ko-KO&page=1&region=KR");

		} catch (Exception e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		MoviePageVO page = gson.fromJson(json, MoviePageVO.class);

		page.setResults(filter(page.getResults()));
		
		

		return page;
	}

	public MoviePageVO getLastMovie(String apikey, String startdate, String enddate) {
		String json = null;

		try {
			json = readUrl("https://api.themoviedb.org/3/discover/movie?api_key=" + apikey
					+ "&language=ko-KO&region=KR&sort_by=release_date.desc&include_adult=false&release_date.gte="
					+ startdate + "&release_date.lte=" + enddate);

		} catch (Exception e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();
		MoviePageVO page = gson.fromJson(json, MoviePageVO.class);
		page.setResults(filter(page.getResults()));
		
		return page;
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

}
