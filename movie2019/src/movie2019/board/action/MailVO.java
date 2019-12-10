package movie2019.board.action;

public class MailVO {

	private String senderId;  
	private String senderMail;
	private String receiveMail;
	private String subject;
	private String content; 

	public String getSenderId() {
		return senderId; 
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getSenderMail() {
		return senderMail;
	}

	public void setSenderMail(String senderMail) {
		this.senderMail = senderMail;
	}

	public String getReceiveMail() {
		return receiveMail;
	}

	public void setReceiveMail(String receiveMail) {
		this.receiveMail = receiveMail;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "MailVO [senderId=" + senderId + ", senderMail=" + senderMail + ", receiveMail=" + receiveMail
				+ ", subject=" + subject + ", content=" + content + "]";
	}

}
