package movie2019.gong.model;

import java.sql.Date;

public class GongVO {

	private String title;
	private String content;
	private Date date;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "GongVO [title=" + title + ", content=" + content + ", date=" + date + "]";
	}
	
	
	
}
