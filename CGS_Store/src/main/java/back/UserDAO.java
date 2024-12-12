package back;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    // 데이터 추가
    public void insertUser(String name, int age) {
        String query = "INSERT INTO users (name, age) VALUES (?, ?)";
        try (Connection conn = dbConnect.connect();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            // SQL 파라미터 설정
            pstmt.setString(1, name);
            pstmt.setInt(2, age);
            // 실행
            pstmt.executeUpdate();
            System.out.println("[성공] 사용자 데이터가 추가되었습니다: Name = " + name + ", Age = " + age);
        } catch (SQLException e) {
            System.out.println("[오류] 사용자 데이터 추가 중 문제가 발생했습니다.");
            e.printStackTrace();
        }
    }

    // 데이터 조회
    public void readUsers() {
        String query = "SELECT * FROM users";
        try (Connection conn = dbConnect.connect();
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {
            System.out.println("[조회 결과]");
            while (rs.next()) {
                // 결과 데이터 출력
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int age = rs.getInt("age");
                System.out.printf("ID: %d, Name: %s, Age: %d%n", id, name, age);
            }
        } catch (SQLException e) {
            System.out.println("[오류] 사용자 데이터 조회 중 문제가 발생했습니다.");
            e.printStackTrace();
        }
    }

    // 데이터 수정
    public void updateUser(int id, String name, int age) {
        String query = "UPDATE users SET name = ?, age = ? WHERE id = ?";
        try (Connection conn = dbConnect.connect();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            // SQL 파라미터 설정
            pstmt.setString(1, name);
            pstmt.setInt(2, age);
            pstmt.setInt(3, id);
            // 실행
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("[성공] ID = " + id + " 사용자 데이터가 수정되었습니다.");
            } else {
                System.out.println("[실패] 수정할 데이터가 존재하지 않습니다: ID = " + id);
            }
        } catch (SQLException e) {
            System.out.println("[오류] 사용자 데이터 수정 중 문제가 발생했습니다.");
            e.printStackTrace();
        }
    }

    // 데이터 삭제
    public void deleteUser(int id) {
        String query = "DELETE FROM users WHERE id = ?";
        try (Connection conn = dbConnect.connect();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            // SQL 파라미터 설정
            pstmt.setInt(1, id);
            // 실행
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("[성공] ID = " + id + " 사용자 데이터가 삭제되었습니다.");
            } else {
                System.out.println("[실패] 삭제할 데이터가 존재하지 않습니다: ID = " + id);
            }
        } catch (SQLException e) {
            System.out.println("[오류] 사용자 데이터 삭제 중 문제가 발생했습니다.");
            e.printStackTrace();
        }
    }
}
