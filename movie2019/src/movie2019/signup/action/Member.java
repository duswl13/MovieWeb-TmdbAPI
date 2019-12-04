package movie2019.signup.action;

import java.util.Date;

public class Member {
      private String USER_ID;
      private String USER_PASS;
      private String USER_EMAIL;
      private String USER_PHONE;
      private Date USER_JOIN_DATE;
      
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getUSER_PASS() {
		return USER_PASS;
	}
	public void setUSER_PASS(String uSER_PASS) {
		USER_PASS = uSER_PASS;
	}
	public String getUSER_EMAIL() {
		return USER_EMAIL;
	}
	public void setUSER_EMAIL(String uSER_EMAIL) {
		USER_EMAIL = uSER_EMAIL;
	}
	public String getUSER_PHONE() {
		return USER_PHONE;
	}
	public void setUSER_PHONE(String uSER_PHONE) {
		USER_PHONE = uSER_PHONE;
	}
	public Date getUSER_JOIN_DATE() {
		return USER_JOIN_DATE;
	}
	public void setUSER_JOIN_DATE(Date uSER_JOIN_DATE) {
		USER_JOIN_DATE = uSER_JOIN_DATE;
	}
      
      
      
}
