package movie2019.movie.db;

import java.util.List;

public class MoviePersonVO {
	int id;
	List<MovieItemAPIVO> cast;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<MovieItemAPIVO> getCast() {
		return cast;
	}
	public void setCast(List<MovieItemAPIVO> cast) {
		this.cast = cast;
	}
	
	
}
