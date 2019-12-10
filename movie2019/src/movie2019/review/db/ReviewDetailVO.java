package movie2019.review.db;

public class ReviewDetailVO {
	
	private int movie_id;
	private String review_title;
	private String review_content;
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	@Override
	public String toString() {
		return "ReviewDetailVO [movie_id=" + movie_id + ", review_title=" + review_title + ", review_content="
				+ review_content + "]";
	}
	
	
	
	
	
	
	
	

}
