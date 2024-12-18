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
	private static final String API_KEY = "API_KEY";
	private static final String MODEL = "MODEL";
	private static final String API_URL = "https://api.openai.com/v1/chat/completions";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 보낸 메시지 가져오기
		String userMessage = request.getParameter("message");
		// 세션 질문 가져오기
		List<String> gptQuestions = (List<String>) request.getSession().getAttribute("gptQuestions"); 
		if (gptQuestions == null || gptQuestions.isEmpty()) {
			response.sendRedirect("chatRoom.jsp");
			return;
		}
		// 첫번째 질문을 꺼낸 후 gptQuestion
		String gptQuestion = gptQuestions.remove(0); 
		// 업데이트된 질문 리스트 저장
		request.getSession().setAttribute("gptQuestions", gptQuestions); 
		// 메시지들 세션에 저장
		List<String> messages = (List<String>) request.getSession().getAttribute("messages");
		if (messages == null) {
			messages = new ArrayList<>();
		}
		

		// userMessage 추가
		messages.add("<p class='UserSend'>" + userMessage + "</p>");
		// GPT대답 생성
		String gptResponse = generateResponse(gptQuestion, userMessage);
		// GPT 대답 추가
		messages.add("<p class='AISend'>" + gptResponse + "</p>"); // Save messages back to session

		if (!gptQuestions.isEmpty()) {
			String nextQuestion = gptQuestions.get(0);
			messages.add("<p class='AISend'>" + nextQuestion + "</p>");
		}

		request.getSession().setAttribute("messages", messages);
		request.getSession().setAttribute("gptQuestions", gptQuestions);

		System.out.println("현재 남은 질문 리스트: " + gptQuestions);
		System.out.println("현재 채팅 메시지 리스트: " + messages);
		response.sendRedirect("chatRoom.jsp");
	}

	private String generateResponse(String gptQuestion, String userMessage) {
		String jsonInputString = """
				{
				"model": "%s",
				"messages": [
				{ "role": "system",
				"content": "직장 내 상황극에서 직원의 답변을 평가하는 AI입니다.\\n- 직원의 대답에 대해 1~5점으로 평가하고, 구체적이고 유용한 피드백을 제공합니다."
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
		HttpRequest request = HttpRequest.newBuilder().uri(URI.create(API_URL))
				.header("Authorization", "Bearer " + API_KEY).header("Content-Type", "application/json")
				.POST(HttpRequest.BodyPublishers.ofString(jsonInputString)).build();

		HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
		return response.body();
	}
}
