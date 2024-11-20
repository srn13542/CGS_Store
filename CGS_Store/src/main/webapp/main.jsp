<%@ page import="java.util.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
</head>
<body>
    <h2>Welcome, <%= session.getAttribute("username") %>!</h2>
    <p>Select a chat room to join:</p>
    <ul>
        <%
            String username = (String) session.getAttribute("username");
            if (username != null) { //만약 유저네임이 널이 아니라면 (로그인했다면)
                for (int i = 1; i <= 5; i++) { 
                    String chatRoomName = "ChatRoom " + i; //ChatRoom i 로 이루어진 방을 생성
        %>
                    <li><a href="chat?room=<%= chatRoomName %>"><%= chatRoomName %></a></li>
        <%
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        %>
    </ul>
</body>
</html>