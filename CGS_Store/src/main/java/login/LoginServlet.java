package login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        response.getWriter().println("jsp 호출 성공!");
        // 여기에 실제 인증 로직 추가 (예: 데이터베이스 확인)
        if (true) { //일단 ture로 해놓음 수정필요
            request.getSession().setAttribute("username", username);
            response.sendRedirect("main.jsp");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
