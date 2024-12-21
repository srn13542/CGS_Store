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

@WebServlet("/sendMessage")
public class SendMessageServlet extends HttpServlet {
    private static final String API_KEY = "";
    private static final String MODEL = "";
    private static final String API_URL = "https://api.openai.com/v1/chat/completions";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 보낸 메시지 가져오기
    	String simulationId = (String) request.getSession().getAttribute("currentSimulationId");
        if (simulationId == null) {
            simulationId = generateSimulationId();
            request.getSession().setAttribute("currentSimulationId", simulationId);
        }
    	String userMessage = request.getParameter("message");

        // 세션에서 질문과 평가 결과 가져오기
        
        List<String> gptQuestions = (List<String>) request.getSession().getAttribute("gptQuestions");
        List<String> evaluationResults = (List<String>) request.getSession().getAttribute("evaluationResults");
        
        if (gptQuestions == null || gptQuestions.isEmpty()) {
            response.sendRedirect("result.jsp");
            return;
        }

        if (evaluationResults == null) {
            evaluationResults = new ArrayList<>();
        }

        // 첫 번째 질문을 가져오고 삭제
        String gptQuestion = gptQuestions.remove(0);
        request.getSession().setAttribute("gptQuestions", gptQuestions);

        // GPT 대답 생성 및 평가
        String gptResponse = generateResponse(gptQuestion, userMessage);
        evaluationResults.add("질문: " + gptQuestion + "<br>사용자 응답: " + userMessage + "<br>" + gptResponse);

        int totalScore = calculateTotalScore(evaluationResults);
        
        // 세션에 평가 결과 저장
        request.getSession().setAttribute("evaluationResults", evaluationResults);
        request.getSession().setAttribute("totalScore", totalScore);
        
        // 메시지 리스트에 저장 (평가 제외)
        List<String> messages = (List<String>) request.getSession().getAttribute("messages");
        if (messages == null) {
            messages = new ArrayList<>();
        }
        messages.add("<p class='UserSend'>" + userMessage + "</p>");

        if (!gptQuestions.isEmpty()) {
            String nextQuestion = gptQuestions.get(0);
            messages.add("<p class='AISend'>" + nextQuestion + "</p>");
            request.getSession().setAttribute("messages", messages);
            response.sendRedirect("chatRoom.jsp");
        } else {
            request.getSession().setAttribute("messages", messages);
            response.sendRedirect("result.jsp");
        }
    }
    
    private String generateSimulationId() {
        return "sim_" + System.currentTimeMillis();
    }

    private String generateResponse(String gptQuestion, String userMessage) {
        String jsonInputString = """
                {
                "model": "%s",
                "messages": [
                { "role": "system",
                "content": "상황극에서 답변을 평가하는 AI입니다.\\n- 사용자의 대답에 대해 점수: X점형태로 피드백: Y의 형태로 점수는 1~5점으로 피드백은 구체적이고 유용하게 제공합니다."
                },
                {
                "role": "user",
                "content": "질문: %s\\n답변: %s"
                }
                ]
                }
                 """.formatted(MODEL, gptQuestion, userMessage);
        try {
            String responseContent = sendPostRequest(jsonInputString);
            JSONObject jsonResponse = new JSONObject(responseContent);
            JSONArray choicesArray = jsonResponse.getJSONArray("choices");
            if (choicesArray.length() > 0) {
                return choicesArray.getJSONObject(0).getJSONObject("message").getString("content");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "GPT 응답을 받을 수 없습니다.";
    }

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
    private int calculateTotalScore(List<String> evaluationResults) {
        int totalScore = 0;
        String scorePattern = "점수: (\\d+)점"; // 정규식으로 점수 추출
        for (String result : evaluationResults) {
            Pattern pattern = Pattern.compile(scorePattern);
            Matcher matcher = pattern.matcher(result);
            if (matcher.find()) {
                totalScore += Integer.parseInt(matcher.group(1));
            }
        }
        return totalScore;
    }
}
