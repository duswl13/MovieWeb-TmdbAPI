package movie2019.board.action;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.login.db.MemberDAO;

public class MailSend implements Action {

  public void Send() {
	
	String user = null;
	String password = null;
    
	//SMTP 서버 정보 설정  
	Properties prop = new Properties();
	prop.put("mail.stmp.ssl.enable","true");
	prop.put("mail.stmp.host","smtp.gmail.com");
	prop.put("mail.stmp.trust","smtp.gmail.com");
	prop.put("mail.stmp.auth","true");
	prop.put("mail.stmp.port",465); //gmail 서버
	
		
	Session session = Session.getDefaultInstance(prop, 
			new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(user, password);
		}
	});
	
		
	try {
		MimeMessage msg = new MimeMessage(session);
		msg.setSentDate(new Date());
		msg.setFrom(new InternetAddress(user));
		//수신자 메일 주소
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress("dlwldus0922@gmail.com"));

		msg.setText("욕설 및 비방글 게시");
		
		//메일 전송
		Transport.send(msg);
		System.out.println("메일 전송 성공");
		} catch(AddressException ae) {
			System.out.println("AddressException 에러="+ae);
			ae.printStackTrace();
		}catch(MessagingException me) {
			System.out.println("MessagingExcpeiotn 에러="+me);
		    me.printStackTrace();
		}
	
  }

@Override
public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	// TODO Auto-generated method stub
	return null;
}

	
}