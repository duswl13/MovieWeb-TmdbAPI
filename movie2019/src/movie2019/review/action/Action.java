package movie2019.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie2019.login.action.ActionForward;

/*
특정 비지니스 요청으로 수행하고 결과 값을 ActionForward타입으로 변환하는 메소드가 정의돼 있다.
Action : 인터페이스명
ActionForward : 반환형
- 여기는 interface
*/

public interface Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
