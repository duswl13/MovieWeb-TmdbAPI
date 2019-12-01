package movie2019.admin.faq;

import java.sql.Date;

public class FAQVO {
	private int FAQ_NUMBER;
	private String FAQ_NAME;
	private String FAQ_SUBJECT;
	private String FAQ_CONTENT;
	private Date FAQ_DATE;
	public int getFAQ_NUMBER() {
		return FAQ_NUMBER;
	}
	public void setFAQ_NUMBER(int fAQ_NUMBER) {
		FAQ_NUMBER = fAQ_NUMBER;
	}
	public String getFAQ_NAME() {
		return FAQ_NAME;
	}
	public void setFAQ_NAME(String fAQ_NAME) {
		FAQ_NAME = fAQ_NAME;
	}
	public String getFAQ_SUBJECT() {
		return FAQ_SUBJECT;
	}
	public void setFAQ_SUBJECT(String fAQ_SUBJECT) {
		FAQ_SUBJECT = fAQ_SUBJECT;
	}
	public String getFAQ_CONTENT() {
		return FAQ_CONTENT;
	}
	public void setFAQ_CONTENT(String fAQ_CONTENT) {
		FAQ_CONTENT = fAQ_CONTENT;
	}
	public Date getFAQ_DATE() {
		return FAQ_DATE;
	}
	public void setFAQ_DATE(Date fAQ_DATE) {
		FAQ_DATE = fAQ_DATE;
	}
	
	
}
