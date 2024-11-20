<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.*" %>
<!DOCTYPE html>
<html>
chatRoom.jsp

<head>
    <meta charset="UTF-8">
    <title>Chat Room</title>
    <style>
        #chatBox {
            width: 80%;
            height: 300px;
            border: 1px solid #000;
            overflow-y: scroll;
            padding: 10px;
        }
    </style>
</head>
<body>
    <h2>Chat Room: <%= session.getAttribute("chatRoom") %></h2>
    <div id="chatBox">
        <%
            List<String> messages = (List<String>) session.getAttribute("messages");
            if (messages != null) {
                for (String message : messages) {
                    out.println("<p>" + message + "</p>");
                }
            }
        %>
    </div>
    <form action="sendMessage" method="post">
        <input type="text" name="message">
        <input type="submit" value="Send">
    </form>
</body>
</html>