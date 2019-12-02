package movie2019.gong.emailService;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import movie2019.gong.model.EmailVO;

public class EmailService {
	public void mailSendr(EmailVO vo) throws Exception{
		String host = "smtp.gmail.com";
		String username= "rjstn19339";
		String password = "Kh123456!@";
		int port =587;		
		String senderMail = vo.getSenderMail();
		String senderName = vo.getSenderName();
		String recipient = vo.getReceiveMail();
		String subject = vo.getSubject();
		String body = vo.getMessage();
		
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", host);
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		
		
		
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			String un = username;
			String pw = password;
			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication(un, pw);
			}
		});
			
		session.setDebug(true);
		Message mimeMessage = new MimeMessage(session);
		
		mimeMessage.addFrom(new InternetAddress[] {
				new InternetAddress(senderMail,senderName)});
		// �닔�떊�옄 To , CC(李몄“), BCC(�닲��李몄“)
		mimeMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(recipient));
		mimeMessage.setSubject(subject);
		mimeMessage.setText(body);
		Transport.send(mimeMessage);
		
		
				
				
		
		
	}

}
