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

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/sendMessage")
public class SendMessageServlet extends HttpServlet {
    private static final String API_KEY = "API_key";
    private static final String MODEL = "MODEL";
    private static final String API_URL = "https://api.openai.com/v1/chat/completions";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userMessage = request.getParameter("message");

        // Retrieve or initialize session attributes
        List<String> messages = (List<String>) request.getSession().getAttribute("messages");
        if (messages == null) {
            messages = new ArrayList<>();
        }

        // Add user's message to the chat
        messages.add("<p class='UserSend'>" + userMessage + "</p>");

        // Generate GPT evaluation
        String gptResponse = generateResponse(userMessage);
        messages.add("<p class='AISend'>" + gptResponse + "</p>");

        // Save messages back to session
        request.getSession().setAttribute("messages", messages);

        // Redirect to JSP
        response.sendRedirect("chatRoom.jsp");
    }

    private String generateResponse(String userMessage) {
        String jsonInputString = """
                {
                  "model": "%s",
                  "messages": [
                    {
                      "role": "system",
                      "content": "직장 내 상황극에서 질문에 대해 답변을 평가합니다. 간단한 피드백을 제공합니다."
                    },
                    {
                      "role": "user",
                      "content": "%s"
                    }
                  ]
                }
                """.formatted(MODEL, userMessage);

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
}
