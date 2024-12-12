package back;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String username = request.getParameter("username");

        // 디버깅 로그
        System.out.println("폼 데이터: email=" + email + ", password=" + password + ", username=" + username);

        if (email == null || email.isEmpty() || password == null || password.isEmpty() || username == null || username.isEmpty()) {
            response.sendRedirect("register.jsp?error=emptyFields");
            return;
        }

        try (Connection conn = dbConnect.connect()) {
            if (conn == null) {
                System.out.println("DB 연결 실패");
                response.sendRedirect("register.jsp?error=dbConnection");
                return;
            }

            System.out.println("DB 연결 성공");

            String insertQuery = "INSERT INTO user (email, password, username) VALUES (?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(insertQuery)) {
                stmt.setString(1, email);
                stmt.setString(2, password);
                stmt.setString(3, username);

                int rowsInserted = stmt.executeUpdate();
                System.out.println("삽입된 행 수: " + rowsInserted);

                if (rowsInserted > 0) {
                    request.setAttribute("message", "회원가입이 완료되었습니다.");
                    request.getRequestDispatcher("main.jsp").forward(request, response);
                } else {
                    response.sendRedirect("register.jsp?error=insertFailed");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=systemError");
        }
    }
}
