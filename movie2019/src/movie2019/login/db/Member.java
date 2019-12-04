
/* DataBean 데이터빈 클래스 
 
게시판에서 사용되는 정보들을 데이터빈이라는 하나의 객체에 저장하고,
이 객체를 전달하면 정보를 하나씩 전달할 필요 없이 한꺼번에 모든 정보가 전달된다.

이런 클래스를 DTO(Data Transfer Object), VO(Value Object)라고 한다.
DB에서 만들었던 컬럼명과 동일하게 프로퍼티들을 생성해야 함.
*/

package movie2019.login.db;

public class Member {

	private String id;
	private String pass;
	private String email;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return pass;
	}
	public void setPassword(String pass) {
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
