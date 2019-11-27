package movie2019.gong.model;

public class GongVO {
	private String NOTICE_SUBJECT;
	private String NOTICE_CONTENT;
	private String NOTICE_DATE;

	public String getNOTICE_SUBJECT() {
		return NOTICE_SUBJECT;
	}

	public void setNOTICE_SUBJECT(String nOTICE_SUBJECT) {
		NOTICE_SUBJECT = nOTICE_SUBJECT;
	}

	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}

	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		NOTICE_CONTENT = nOTICE_CONTENT;
	}

	public String getNOTICE_DATE() {
		return NOTICE_DATE;
	}

	public void setNOTICE_DATE(String nOTICE_DATE) {
		NOTICE_DATE = nOTICE_DATE;
	}

	@Override
	public String toString() {
		return "GongVO [NOTICE_SUBJECT=" + NOTICE_SUBJECT + ", NOTICE_CONTENT=" + NOTICE_CONTENT + ", NOTICE_DATE="
				+ NOTICE_DATE + "]";
	}

}
