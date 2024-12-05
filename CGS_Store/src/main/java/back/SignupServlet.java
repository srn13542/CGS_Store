package back;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/web_project_db"; // 변경된 DB URL
    private static final String USER = "root"; // MySQL 사용자 이름
    private static final String PASSWORD = ""; // MySQL 비밀번호

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Set request and response encoding
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Get form data from the request
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String username = request.getParameter("name"); // HTML 폼의 "name"이 username에 해당

        // Validate form inputs
        if (email == null || email.isEmpty() || password == null || password.isEmpty() || username == null || username.isEmpty()) {
            try (PrintWriter out = response.getWriter()) {
                out.println("<script>alert('모든 필드를 입력해주세요!'); history.back();</script>");
            }
            return;
        }

        // Save data to the database
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("INSERT INTO user (email, password, username) VALUES (?, ?, ?)")) {

            // Set query parameters
            stmt.setString(1, email);
            stmt.setString(2, password);
            stmt.setString(3, username);

            int rowsInserted = stmt.executeUpdate();

            // Check if insert was successful
            if (rowsInserted > 0) {
                response.sendRedirect("login.jsp?signup=success");
            } else {
                try (PrintWriter out = response.getWriter()) {
                    out.println("<script>alert('회원가입에 실패했습니다. 다시 시도해주세요.'); history.back();</script>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            try (PrintWriter out = response.getWriter()) {
                out.println("<script>alert('에러가 발생했습니다: " + e.getMessage() + "'); history.back();</script>");
            }
        }
    }
}
