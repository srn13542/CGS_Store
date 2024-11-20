<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chat Room</title>
</head>
<body>
    <h2>Chat Room: <%= session.getAttribute("chatRoom") %></h2>
    <p>Welcome to <%= session.getAttribute("chatRoom") %>!</p>
    <p>Start chatting!</p>
    <form action="sendMessage" method="post">
        <input type="text" name="message">
        <input type="submit" value="Send">
    </form>
</body>
</html>
