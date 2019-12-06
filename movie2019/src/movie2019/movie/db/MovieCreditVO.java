package movie2019.movie.db;

import java.util.List;

public class MovieCreditVO {
	int id;
	List<MovieCreditItemVO> cast;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<MovieCreditItemVO> getCast() {
		return cast;
	}
	public void setCast(List<MovieCreditItemVO> cast) {
		this.cast = cast;
	}
	
	
}
