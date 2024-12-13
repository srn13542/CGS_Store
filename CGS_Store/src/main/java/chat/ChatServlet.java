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

/**
 * Servlet implementation class ChatServlet
 */
@WebServlet("/chat")
public class ChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String API_KEY = "OPENAI_API_KEY"; 
	private static final String MODEL = "OPENAI_API_KEY"; 
	private static final String API_URL = "https://api.openai.com/v1/chat/completions";
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String room = request.getParameter("room");  //고른 방의 이름을 저장
		
		if(room != null) {
			request.getSession().setAttribute("chatRoom", room); //그 이름을 넘겨줌(이건꼼수고 사실 다 만들어야함)
			//gpt 질문 생성
			List<String> gptQuestions = generateGPTQuestions();
			//session에 gptQuestion 추가
			request.getSession().setAttribute("gptQuestions", gptQuestions);
			List<String> messages = new ArrayList<>();
			 if (!gptQuestions.isEmpty()) {
				 //질문 출력
		            messages.add("<p class='AISend'>" + gptQuestions.get(0) + "</p>");
		        }
			 //session에 messages 추가
			request.getSession().setAttribute("messages", messages); // 세션에 빈 메시지 저장
			
			response.sendRedirect("chatRoom.jsp"); //그리고 넘기기
		} else {
			response.sendRedirect("main.jsp");
		}
	}
	private List<String> generateGPTQuestions() {
		String jsonInputString = """ 
				{
				"model": "%s", 
				"messages": [ 
				{ "role": "system", 
				"content": "직장 내에서 발생할 수 있는 상황에 대해 10개 질문을 생성해주세요.\\n- 질문의 형식은 '직장에서 팀원과의 갈등을 해결할 때, 어떤 방식을 사용하시겠습니까?'와 같이 간결하게 작성합니다." 
					} 
					] 
				} 
				""".formatted(MODEL);
		List<String> questions = new ArrayList<>();
	try { 
		String responseContent = sendPostRequest(jsonInputString); 
		System.out.println("GPT 응답: " + responseContent);
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
