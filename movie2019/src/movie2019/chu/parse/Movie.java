package movie2019.chu.parse;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class Movie {

	public static ArrayList<id> Movies() throws Exception {
		JSONParser jsonparser = new JSONParser();
		JSONObject jsonobject = (JSONObject) jsonparser.parse(readUrl());
		JSONArray array = (JSONArray) jsonobject.get("results");
		ArrayList<id> list = new ArrayList<id>();
		for (int i = 0; i < array.size(); i++) {
			JSONObject entity = (JSONObject) array.get(i);
			String movieNm = (String) entity.get("poster_path");
			String movietitle = (String) entity.get("title");
			int num = ((Long) entity.get("id")).intValue();
			id id = new id();
			id.setId(num);
			id.setTitle(movietitle);
			list.add(id);

		}

		return list;
	}

	private static String readUrl() throws Exception {

		BufferedInputStream reader = null;
		try {
			URL url = new URL(
					"https://api.themoviedb.org/3/movie/upcoming?api_key=4b3aa211760fe451c0edcb032c99f6b2&language=ko-KR&page=1");
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

}