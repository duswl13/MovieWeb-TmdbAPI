package movie2019.gong.model;

public class FAQVO {
	private String FAQ_SUBJECT;
	private String FAQ_CONTENT;
	private String FAQ_DATE;
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
	public String getFAQ_DATE() {
		return FAQ_DATE;
	}
	public void setFAQ_DATE(String fAQ_DATE) {
		FAQ_DATE = fAQ_DATE;
	}
	@Override
	public String toString() {
		return "FAQVO [FAQ_SUBJECT=" + FAQ_SUBJECT + ", FAQ_CONTENT=" + FAQ_CONTENT + ", FAQ_DATE=" + FAQ_DATE + "]";
	}



}
