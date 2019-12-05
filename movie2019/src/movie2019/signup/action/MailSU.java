package movie2019.signup.action;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailSU extends Authenticator{
    
    PasswordAuthentication pa;
    
    public MailSU() {
        String mail_id = "gmail 아이디";
        String mail_pw = "패스워드 입력";
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }


}
