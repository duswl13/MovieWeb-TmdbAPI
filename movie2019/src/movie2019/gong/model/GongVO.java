package movie2019.gong.model;

public class GongVO {

	private String title;
	private String content;
	private String gong_date;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getGong_date() {
		return gong_date;
	}
	public void setGong_date(String gong_date) {
		this.gong_date = gong_date;
	}
	@Override
	public String toString() {
		return "GongVO [title=" + title + ", content=" + content + ", gong_date=" + gong_date + "]";
	}
	
	
	
}
