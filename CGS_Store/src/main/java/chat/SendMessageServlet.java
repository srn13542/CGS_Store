package chat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Logger;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
/**
 * Servlet implementation class SendMessageServlet
 */
@WebServlet("/sendMessage")
public class SendMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(SendMessageServlet.class.getName());

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String message = request.getParameter("message"); // 메세지를 가져옴
		String chatRoom = (String) request.getSession().getAttribute("chatRoom"); // 채팅방 이름을 가져옴
		String username = (String) request.getSession().getAttribute("username"); // 유저이름을 가져옴

		if (message != null && chatRoom != null && username != null) {
			LOGGER.log(Level.INFO, "Message from {0} in {1}: {2}", new Object[] { username, chatRoom, message });
			List<String> messages = (List<String>) request.getSession().getAttribute("messages"); //배열에 메세지 추가
			if (messages == null) {
				messages = new ArrayList<>();
			} // 새로운 메시지 추가
			messages.add(username + ": " + message);  //메세지배열에 추가
			request.getSession().setAttribute("messages", messages);//전송
			response.sendRedirect("chatRoom.jsp"); //후 다시 돌아옴
		} else {
			response.sendRedirect("main.jsp");
		}
	}
}

