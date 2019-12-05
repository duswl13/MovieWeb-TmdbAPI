package movie2019.mypage.review;

import java.sql.Date;

public class Review {
	private int REVIEW_NUMBER;
	private String MOVIE_ID;
	private String USER_ID;	
	private String REVIEW_TITLE;
	private String REVIEW_CONTENT;
	private Date REVIEW_DATE;
	public int getREVIEW_NUMBER() {
		return REVIEW_NUMBER;
	}
	public void setREVIEW_NUMBER(int rEVIEW_NUMBER) {
		REVIEW_NUMBER = rEVIEW_NUMBER;
	}
	public String getMOVIE_ID() {
		return MOVIE_ID;
	}
	public void setMOVIE_ID(String mOVIE_ID) {
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
