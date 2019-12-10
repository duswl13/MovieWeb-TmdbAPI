package movie2019.board.action;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import movie2019.board.action.MailVO;

public class MailSender {
		public void mailSend(MailVO vo) throws Exception{
			String host = "smtp.gmail.com";
			String userid= "dlwldus0922";
			String password = "semiproject1";
			int port =465;	
			String senderId = vo.getSenderId();
			String senderMail = vo.getSenderMail();
			String recipient = vo.getReceiveMail();
			String subject = vo.getSubject();
			String content = vo.getContent();
			
			Properties props = System.getProperties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", host);
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			
			Session session = Session.getDefaultInstance(props, new Authenticator() {
				String id = userid;
				String pw = password;
				protected PasswordAuthentication getPasswordAuthentication(){
					return new PasswordAuthentication(id, pw);
				}
			});
				
			session.setDebug(true);
			Message mimeMessage = new MimeMessage(session);
			
			mimeMessage.addFrom(new InternetAddress[] {
					new InternetAddress(senderMail,senderId)});

			mimeMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(recipient));
			mimeMessage.setSubject(subject);
			mimeMessage.setText(content);
			Transport.send(mimeMessage);
		}

}
