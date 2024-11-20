package chat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ChatServlet
 */
@WebServlet("/chat")
public class ChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String room = request.getParameter("room");  //고른 방의 이름을 저장
		if(room != null) {
			request.getSession().setAttribute("chatRoom", room); //그 이름을 넘겨줌(이건꼼수고 사실 다 만들어야함)
			response.sendRedirect("chatRoom.jsp"); //그리고 넘기기
		} else {
			response.sendRedirect("main.jsp");
		}
	}

}
