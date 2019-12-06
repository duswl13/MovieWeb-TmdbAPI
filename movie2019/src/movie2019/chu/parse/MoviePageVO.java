package movie2019.chu.parse;

import java.util.List;


public class MoviePageVO {
	
	int page;
	int total_results;
	int total_pages;
	List<MovieItemVO> results;
	
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
	public List<MovieItemVO> getResults() {
		return results;
	}
	public void setResults(List<MovieItemVO> results) {
		this.results = results;
	}
	@Override
	public String toString() {
		return "MoviePageVO [page=" + page + ", total_results=" + total_results + ", total_pages=" + total_pages
				+ ", results=" + results + "]";
	}
	
	
	
}
