import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

@WebServlet("/sendPassword")
public class SendPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        
        // 비밀번호 조회 예시 (실제 DB 연동 필요)
        String password = findPasswordByEmail(email);
        
        if (password != null) {
            // 이메일 전송 로직
            boolean isSent = sendEmail(email, password);
            if (isSent) {
                response.getWriter().write("비밀번호가 이메일로 전송되었습니다.");
            } else {
                response.getWriter().write("이메일 전송에 실패했습니다. 다시 시도해주세요.");
            }
        } else {
            response.getWriter().write("입력하신 이메일에 해당하는 계정이 없습니다.");
        }
    }

    // 이메일과 매칭되는 비밀번호 조회 메서드 (DB에서 비밀번호 가져오는 로직 필요)
    private String findPasswordByEmail(String email) {
        if (email.equals("test@example.com")) { // 예제용
            return "password123!";
        }
        return null;
    }

    // 이메일 전송 메서드
    private boolean sendEmail(String recipient, String password) {
        final String senderEmail = "yourEmail@gmail.com";
        final String senderPassword = "yourEmailPassword"; // 이메일 비밀번호 설정
        
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        try {
            Session session = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(senderEmail, senderPassword);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject("비밀번호 찾기 안내");
            message.setText("회원님의 비밀번호는: " + password + " 입니다.");
            
            Transport.send(message);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
