package movie2019.review.db;

import java.sql.Date;

public class ReviewVO {

	private int REVIEW_NUMBER;
	private int MOVIE_ID;
	private String USER_ID;
	private String REVIEW_TITLE;
	private String REVIEW_CONTENT;
	private Date REVIEW_DATE;
	
	public int getREVIEW_NUMBER() {
		return REVIEW_NUMBER;
	}
	public void setREVIEW_NUMBER(int review_number) {
		REVIEW_NUMBER = review_number;
	}
	public int getMOVIE_ID() {
		return MOVIE_ID;
	}
	public void setMOVIE_ID(int movie_id) {
		MOVIE_ID = movie_id;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String user_id) {
		USER_ID = user_id;
	}
	public String getREVIEW_TITLE() {
		return REVIEW_TITLE;
	}
	public void setREVIEW_TITLE(String review_title) {
		REVIEW_TITLE = review_title;
	}
	public String getREVIEW_CONTENT() {
		return REVIEW_CONTENT;
	}
	public void setREVIEW_CONTENT(String review_content) {
		REVIEW_CONTENT = review_content;
	}
	public Date getREVIEW_DATE() {
		return REVIEW_DATE;
	}
	public void setREVIEW_DATE(Date review_date) {
		REVIEW_DATE = review_date;
	}
	
	

}
