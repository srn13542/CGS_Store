<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.*" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Chat Room</title>
</head>
<body>
  <div class="chatRoom">
    <h2><button class="backwardBtn">◀</button>Chat Room: <%= session.getAttribute("chatRoom") %></h2>
    <div id="chatBox">
        <%
        //messages 리스트 가져옴
            List<String> messages = (List<String>) session.getAttribute("messages");
        	List<String> gptQuestions = (List<String>) session.getAttribute("gptQuestions");
        	if (messages != null) {
                for (String message : messages) {
                    out.println(message);
                }
            }
            
        %>
    </div>
    <form action="sendMessage" method="post" class="sendMessage">
        <input type="text" name="message" id="txtInputBar" placeholder="Type your message here">
        <input type="submit" value="Send" id="txtSendBtn">
    </form>
  </div>
</body>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    body {
        background-color: #c0c0c0;
        display: flex;
        justify-content: center;
        font-family: Arial, sans-serif;
    }
    .chatRoom {
        width: 50vw;
        max-width: 600px;
        height: 100vh;
        background-color: #3A6EA5;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        padding: 20px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
    h2 {
        color: white;
        font-size: 1.5em;
        margin-bottom: 15px;
        text-align: center;
    }
    #chatBox {
        width: 100%;
        flex-grow: 1;
        overflow-y: auto;
        background-color: #F1F3F8;
        border-radius: 10px;
        padding: 15px;
        margin-bottom: 15px;
        box-shadow: inset 0 0 8px rgba(0, 0, 0, 0.1);
    }
    .AISend {
        background-color: #FFFFFF;
        padding: 8px;
        border-radius: 5px;
        margin: 5px 0;
        color: #333;
        font-size: 0.95em;
        margin-right: 40%;
    }
    .UserSend {
        background-color: #004E98;
        padding: 8px;
        border-radius: 5px;
        margin: 5px 0;
        color: #FFFFFF;
        font-size: 0.95em;
        margin-left: 40%;
    }
    .sendMessage {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    #txtInputBar {
        width: 83%;
        padding: 10px;
        font-size: 1em;
        border: 1px solid #C5D2E0;
        border-radius: 5px;
        outline: none;
        background-color: #FFF;
    }
    #txtInputBar:focus {
        border-color: #72A7E4;
    }
    #txtSendBtn {
        width: 15%;
        padding: 10px;
        font-size: 1em;
        background-color: #2F3A56;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    #txtSendBtn:hover {
        background-color: #4A5F75;
    }
    .backwardBtn {
        position: absolute;
        left: 15px;
        font-size: 0.9em;
        align-items: center;
        text-align: center;
        justify-content: center;
        background-color: #3A6EA5;
        border: 0;
        cursor: pointer;
    }
</style>
</html>
