package movie2019.chu.parse;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class Movie {

	public static ArrayList<id> Movies(String id) throws Exception {
		JSONParser jsonparser = new JSONParser();
		JSONObject jsonobject = (JSONObject) jsonparser.parse(readUrl(id));
		JSONArray array = (JSONArray) jsonobject.get("results");
		ArrayList<id> list = new ArrayList<id>();
		for (int i = 0; i < array.size(); i++) {
			JSONObject entity = (JSONObject) array.get(i);
			String movieNm = (String) entity.get("poster_path");
			String movietitle = (String) entity.get("title");
			int num = ((Long) entity.get("id")).intValue();
			System.out.println(num);
			System.out.println(movieNm);
			System.out.println(movietitle);

		}

		return list;
	}

	private static String readUrl(String id) throws Exception {

		BufferedInputStream reader = null;
		try {
			URL url = new URL(
					"https://api.themoviedb.org/3/movie/"+id+"?api_key=4b3aa211760fe451c0edcb032c99f6b2&language=ko-KO&region=KR&page=1&include_adult=false");
			System.out.println(url.toString());
			reader = new BufferedInputStream(url.openStream());

			StringBuffer buffer = new StringBuffer();
			int i;
			byte[] b = new byte[4096];
			while ((i = reader.read(b)) != -1) {
				buffer.append(new String(b, 0, i));
			}
			return buffer.toString();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}
	public static void main(String[] args) throws Exception {
		Movie m = new Movie();
		m.Movies("330457");
	}

}