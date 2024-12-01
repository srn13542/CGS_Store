package login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 세션 종료
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // 현재 페이지로 리다이렉트
        String referer = request.getHeader("Referer"); // 이전 페이지 URL 가져오기
        if (referer != null) {
            response.sendRedirect(referer); // 이전 페이지로 리다이렉트
        } else {
            response.sendRedirect("login.jsp"); // 이전 페이지 정보가 없으면 로그인 페이지로 이동
        }
    }
}
