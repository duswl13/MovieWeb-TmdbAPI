package movie2019.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			    HttpServletResponse response) throws Exception {
		
		String senderId= request.getParameter("senderId");
		String senderMail = request.getParameter("senderMail");
		String receiveMail = request.getParameter("receiveMail");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");	
		
		MailVO vo =new MailVO();
		vo.setSenderId(senderId);
		vo.setSenderMail(senderMail);  
		vo.setReceiveMail(receiveMail);
		vo.setSubject(subject);
		vo.setContent(content);
		System.out.println(vo);
		
		MailSender sender = new MailSender();
		try {
			sender.mailSend(vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		

	}

}
