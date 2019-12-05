package movie2019.movie.db;

import java.util.List;


public class MoviePageAPIVO {
	
	int page;
	int total_results;
	int total_pages;
	List<MovieItemAPIVO> results;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotal_results() {
		return total_results;
	}
	public void setTotal_results(int total_results) {
		this.total_results = total_results;
	}
	public int getTotal_pages() {
		return total_pages;
	}
	public void setTotal_pages(int total_pages) {
		this.total_pages = total_pages;
	}
	public List<MovieItemAPIVO> getResults() {
		return results;
	}
	public void setResults(List<MovieItemAPIVO> results) {
		this.results = results;
	}
	
	
	
}
