package movie2019.gong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface GCommand {

	void execute(HttpServletRequest request, HttpServletResponse response);
}
