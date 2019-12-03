package movie2019.review.action;

/* ActionForward클래스
Action인터페이스에서 명령을 수행하고 그 결과 값을 가지고 포워딩 할 때 사용되는 클래스.
이 클래스는 Redirect 여부 값과 포워딩할 페이지의 위치를 가지고 있다.
이 값들은 FrontController에서 ActionForward 클래스 타입으로 반환값을 가져오면
그 값을 확인해 해당하는 요청 페이지로 포워딩 처리함.
- 즉, 페이지 이동에 대한 정보를 담는 클래스 **
*/
public class ActionForward {
	private boolean redirect = false;
	private String path = null;

	// property redirect의 is메소드
	public boolean isRedirect() {
		// 프로퍼티 타입이 boolean일 경우 get 대신 is를 앞에 붙일 수 있다.
		return redirect;
	}

	// property redirect의 set메소드
	public void setRedirect(boolean b) {
		redirect = b;
	}

	// property path의 get메소드
	public String getPath() {
		return path;
	}

	// property path의 set메소드
	public void setPath(String string) {
		path = string;
	}
}
