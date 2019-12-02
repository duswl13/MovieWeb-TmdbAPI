package movie2019.gong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.gong.emailService.EmailService;
import movie2019.gong.model.EmailVO;

public class MailCommand implements GCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String senderName= request.getParameter("senderName");
		String senderMail = request.getParameter("senderMail");
		String receiveMail = request.getParameter("receiveMail");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");		
		EmailVO vo =new EmailVO();
		vo.setSenderName(senderName);
		vo.setSenderMail(senderMail);  
		vo.setReceiveMail(receiveMail);
		vo.setSubject(subject);
		vo.setMessage(message);
		EmailService service = new EmailService();
		try {
			service.mailSendr(vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
