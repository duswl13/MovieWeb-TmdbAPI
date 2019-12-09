/*package movie2019.board.action;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
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


public class MailSend2 implements Action {

  public void Send() {
	
	MemberDAO mdao = new MemberDAO();
	
	String id = null;
	if(session.getAttribute("id")!=null) {
		id = (String) session.getAttribute("id");
	}
	if(id==null || id=="") {
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('로그인한 회원만 가능합니다');");
		out.println("</script>");
		out.close();
		return;
	}
	  
	request.setCharacterEncoding("utf-8");
	
	String title = null;
	String content = null;
	if(request.getParameter("title")!= null) {
		title = request.getParameter("title");
	}
	if(request.getParameter("content")!= null) {
		content = request.getParameter("content");
	}
	if(title == null || content == null) {
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('입력하세요');");
		out.println("</script>");
		out.close();
		return;
	}
	
	String host = "http://localhost:8088/movie2019/";
	String from = "dlwldus0922@gmail.com";
	String to = "dlwldus0922@gmail.com";
    String subject = "게시판에서 접수된 신고 메일입니다.";
    String message = "신고자:"+id+"<br>제목:"+title+"<br>내용:"+content;
    
	//SMTP 서버 정보 설정  
	Properties prop = new Properties();
	prop.put("mail.smtp.user",from);
	prop.put("mail.stmp.ssl.enable","true");
	prop.put("mail.stmp.host","smtp.gmail.com");
	prop.put("mail.stmp.trust","smtp.gmail.com");
	prop.put("mail.stmp.debug","true");
	prop.put("mail.smpt.starttls.enable","true");
	prop.put("mail.stmp.auth","true");
	prop.put("mail.stmp.port","465"); //gmail 서버
	prop.put("mail.stmp.socketFactory.port","465");
	prop.put("mail.stmp.sockectFactory.class","javax.net.ssl.SSLSocketFactory");
	
		
	
		
	try {
		Authenticator au = new Gmail();
		Session session = Session.getInstance(p, au);
		session.setDebug(true);
		MimeMessage msg = new MimeMessage(session);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		
		//수신자 메일 주소
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html; charset=utf-8");

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
*/