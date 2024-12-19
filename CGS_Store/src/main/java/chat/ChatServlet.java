package chat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Servlet implementation class ChatServlet
 */
@WebServlet("/chat")
public class ChatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String API_KEY = "";
    private static final String MODEL = "";
    private static final String API_URL = "https://api.openai.com/v1/chat/completions";

    /**
     * Handles GET request for generating GPT questions
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String room = request.getParameter("room"); // 선택된 방의 이름
        if (room != null) {
            // 새로운 시뮬레이션 시작 시 데이터 초기화
            request.getSession().setAttribute("evaluationResults", new ArrayList<>());
            request.getSession().setAttribute("totalScore", 0);
            request.getSession().setAttribute("messages", new ArrayList<>());

            // 선택된 채팅방 이름 세션에 저장
            request.getSession().setAttribute("chatRoom", room);

            // GPT 질문 생성
            List<String> gptQuestions = generateGPTQuestions(room);

            // 세션에 질문 및 메시지 저장
            request.getSession().setAttribute("gptQuestions", gptQuestions);

            List<String> messages = new ArrayList<>();
            List<Integer> scores = new ArrayList<>();

            if (!gptQuestions.isEmpty()) {
                messages.add("<p class='AISend'>" + gptQuestions.get(0) + "</p>");
            }
            request.getSession().setAttribute("messages", messages);

            // chatRoom.jsp로 리다이렉트
            response.sendRedirect("chatRoom.jsp");
        } else {
            // 채팅방 이름이 없으면 main.jsp로 리다이렉트
            response.sendRedirect("main.jsp");
        }
    }

    /**
     * Generates GPT questions based on the selected chat room
     */
    private List<String> generateGPTQuestions(String chatRoomName) {
        String prompt = getPromptForChatRoom(chatRoomName); // 상황에 맞는 프롬프트 생성
        String jsonInputString = """ 
                {
                "model": "%s", 
                "messages": [ 
                { "role": "system", 
                "content": "%s" 
                    } 
                    ] 
                } 
                """.formatted(MODEL, prompt);

        List<String> questions = new ArrayList<>();
        try {
            // OpenAI API 호출 및 결과 받아오기
            String responseContent = sendPostRequest(jsonInputString);
            System.out.println("GPT 응답: " + responseContent);

            // 응답 JSON 파싱 및 질문 추출
            JSONObject jsonResponse = new JSONObject(responseContent);
            JSONArray choicesArray = jsonResponse.getJSONArray("choices");
            if (choicesArray.length() > 0) {
                String content = choicesArray.getJSONObject(0).getJSONObject("message").getString("content");
                String[] splitQuestions = content.split("\\n");
                for (String question : splitQuestions) {
                    if (!question.trim().isEmpty()) {
                        questions.add(question.trim());
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return questions.isEmpty() ? List.of("GPT 질문을 받을 수 없습니다.") : questions;
    }

    /**
     * Returns a prompt customized for the chat room
     */
    private String getPromptForChatRoom(String chatRoomName) {
        switch (chatRoomName) {
            case "직장 시뮬레이션":
                return "직장에서 발생할 수 있는 상황에 대해 5개의 질문을 생성해주세요. 질문의 형식은 '요즘 일은 어때요?'의 형태로 상사의 입장에서 사용자에게 얘기하듯이 짧게 작성합니다.";
            case "소개팅 시뮬레이션":
                return "소개팅에서 발생할 수 있는 상황에 대해 5개의 질문을 생성해주세요. 질문의 형식은 '취미가 뭐예요?'의 형태로 상대방의 입장에서 사용자에게 얘기하듯이 짧게 작성합니다.";
            case "대학 시뮬레이션":
                return "대학교 조별 과제에서 발생할 수 있는 상황에 대해 5개의 질문을 생성해주세요. 질문의 형식은 '저희 일정 조율 어떻게 진행할까요?'의 형태로 팀원의 입장에서 사용자에게 얘기하듯이 짧게 작성합니다.";
            case "면접 시뮬레이션":
                return "면접 중 발생할 수 있는 상황에 대해 5개의 질문을 생성해주세요. 질문의 형식은 '이 회사는 왜 지원했나요?'의 면접관의 입장에서 사용자에게 얘기하듯이 짧게 작성합니다.";
            default:
                return "일상적인 상황에 대해 5개의 질문을 생성해주세요. 질문의 형식은 '오늘 저녁 뭐 먹지?'와 같이 작성합니다.";
        }
    }

    /**
     * Sends a POST request to the OpenAI API
     */
    private String sendPostRequest(String jsonInputString) throws IOException, InterruptedException {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(API_URL))
                .header("Authorization", "Bearer " + API_KEY)
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(jsonInputString))
                .build();
        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
        return response.body();
    }
}
