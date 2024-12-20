<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chat List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/4c3bda8fd6.js" crossorigin="anonymous"></script>
<link rel="icon" href="/CGS_Store/images/favicon.ico" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #C0C0C0;
}

.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #004E98;
    color: white;
    padding: 10px 20px;
}

.navbar h1 {
    margin: 0;
}

.navbar .sign {
    background-color: #FF6700;
    color: white;
    padding: 10px 50px;
    border: none;
    border-radius: 20px;
    cursor: pointer;
    font-size: 20px;
    font-weight: bold;
}

.chat-list {
    margin: 20px auto;
    width: 80%;
    max-width: 600px;
    background-color: #EBEBEB;
    border-radius: 10px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    padding: 20px;
    list-style-type: none;
}

.chat-list li {
    margin: 10px 0;
    background-color: #004E98;
    border-radius: 5px;
    padding: 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: white;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

.chat-list li:hover {
    background-color: #006bb3;
    transform: scale(1.05);
}

.chat-list li a {
    color: white;
    text-decoration: none;
    font-size: 18px;
    font-weight: bold;
}

.chat-info {
    font-size: 14px;
    color: #B0C4DE;
    margin-top: 5px;
}

.rename-icon {
    font-size: 20px;
    color: #FF6700;
    cursor: pointer;
    transition: transform 0.2s ease;
    margin-left: 10px;
}

.rename-icon:hover {
    transform: scale(1.2);
}
</style>
</head>
<body>
<%
String username = (String) session.getAttribute("username");
String[] chatRoomNames = {"직장 시뮬레이션", "소개팅 시뮬레이션", "대학 시뮬레이션", "면접 시뮬레이션"};
%>
<div class="navbar">
    <h1>
        <a href="main.jsp" style="color: white; text-decoration: none;">어떡하징 뭐라하징?</a>
    </h1>
    <% if (username != null) { %>
        <a href="logout" class="sign">Sign out</a>
    <% } else { %>
        <a href="login.jsp" class="sign">Sign in</a>
    <% } %>
</div>

<ul class="chat-list" id="chatList">
    <% if (username != null) {
        for (int i = 0; i < chatRoomNames.length; i++) {
            String chatRoomName = chatRoomNames[i];
            String encodedRoomName = java.net.URLEncoder.encode(chatRoomName, "UTF-8");
            String chatTime = "2024-11-27 12:0" + i;
            String chatPartner = "Partner " + (i + 1);
            int views = 10 * (i + 1);
    %>
    <li id="chat-<%=i%>" data-id="<%=i%>">
        <div>
            <a href="chat?room=<%=encodedRoomName%>" class="chat-name"><%=chatRoomName%></a>
            <div class="chat-info">
                Created on: <%=chatTime%> | Partner: <%=chatPartner%> | Views: <%=views%>
            </div>
        </div>
        <i class="bi bi-pencil-square rename-icon" onclick="renameChat(<%=i%>)"></i>
    </li>
    <%
        }
    } else {
    %>
    <div>Please <a href="login.jsp">log in</a> to view chat rooms.</div>
    <% } %>
</ul>

<script>
function renameChat(chatId) {
    const chatItem = document.getElementById(`chat-${chatId}`);
    const chatNameElement = chatItem.querySelector('.chat-name');
    const newName = prompt('Enter the new name for the chat:', chatNameElement.textContent);

    if (newName && newName.trim() !== '') {
        chatNameElement.textContent = newName;
    }
}
</script>
</body>
</html>
