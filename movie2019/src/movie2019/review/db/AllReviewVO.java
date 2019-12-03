package movie2019.review.db;

import java.sql.Date;

public class AllReviewVO {

	private int REVIEW_LIKE;
	private int REVIEW_FACE;
	private int REVIEW_STAR;
	private int MOVIE_ID;
	private String USER_ID;
	private String REVIEW_TITLE;
	private String REVIEW_CONTENT;
	private Date REVIEW_DATE;
	
	public int getREVIEW_LIKE() {
		return REVIEW_LIKE;
	}
	public void setREVIEW_LIKE(int rEVIEW_LIKE) {
		REVIEW_LIKE = rEVIEW_LIKE;
	}
	public int getREVIEW_FACE() {
		return REVIEW_FACE;
	}
	public void setREVIEW_FACE(int rEVIEW_FACE) {
		REVIEW_FACE = rEVIEW_FACE;
	}
	public int getREVIEW_STAR() {
		return REVIEW_STAR;
	}
	public void setREVIEW_STAR(int rEVIEW_STAR) {
		REVIEW_STAR = rEVIEW_STAR;
	}
	public int getMOVIE_ID() {
		return MOVIE_ID;
	}
	public void setMOVIE_ID(int mOVIE_ID) {
		MOVIE_ID = mOVIE_ID;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getREVIEW_TITLE() {
		return REVIEW_TITLE;
	}
	public void setREVIEW_TITLE(String rEVIEW_TITLE) {
		REVIEW_TITLE = rEVIEW_TITLE;
	}
	public String getREVIEW_CONTENT() {
		return REVIEW_CONTENT;
	}
	public void setREVIEW_CONTENT(String rEVIEW_CONTENT) {
		REVIEW_CONTENT = rEVIEW_CONTENT;
	}
	public Date getREVIEW_DATE() {
		return REVIEW_DATE;
	}
	public void setREVIEW_DATE(Date rEVIEW_DATE) {
		REVIEW_DATE = rEVIEW_DATE;
	}
	

}
