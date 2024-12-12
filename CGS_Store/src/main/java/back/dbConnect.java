package back;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbConnect {
    // MySQL 연결 정보
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/web_project_db";
    private static final String USER = "root"; // 사용자 이름
    private static final String PASSWORD = ""; // 비밀번호

    // DB 연결 메서드
    public static Connection connect() {
        Connection conn = null;
        try {
            // MySQL JDBC 드라이버 로드
            Class.forName("com.mysql.cj.jdbc.Driver");
            // 데이터베이스 연결
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("[성공] 데이터베이스 연결 성공");
        } catch (ClassNotFoundException e) {
            System.err.println("[오류] JDBC 드라이버를 찾을 수 없습니다.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("[오류] 데이터베이스 연결 실패");
            e.printStackTrace();
        }
        return conn;
    }
}

