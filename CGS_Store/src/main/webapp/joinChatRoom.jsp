<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
    crossorigin="anonymous">
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
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

.navbar .button {
    background-color: #FF6700;
    color: white;
    padding: 10px 50px;
    border: none;
    border-radius: 20px;
    cursor: pointer;
    font-size: 20px;
    font-weight: bold;
    text-decoration: none;
}

.button:hover {
    transform: scale(0.9);
    transition: transform 0.3s ease;
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
    text-align: center;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

.chat-list li a {
    color: white;
    text-decoration: none;
    font-size: 18px;
    font-weight: bold;
}

.chat-list li:hover {
    background-color: #006bb3;
    transform: scale(1.05);
}
</style>
</head>
<body>
    <div class="navbar">
        <h1>어떡하징 뭐라하징?</h1>
        <%
            String username = (String) session.getAttribute("username");
            if (username != null) {
        %>
            <a href="main.jsp" class="button">Sign out</a>
        <% 
            } else {
        %>
            <a href="login.jsp" class="button">Sign in</a>
        <% 
            } 
        %>
    </div>
    <div>
        <ul class="chat-list">
            <%
            if (username != null) { 
                for (int i = 1; i <= 5; i++) {
                    String chatRoomName = "ChatRoom " + i;
            %>
                    <li><a href="chat?room=<%=chatRoomName%>"><%=chatRoomName%></a></li>
            <%
                }
            } else {
            %>
                <%@include file="login.jsp"%>
            <%
            }
            %>
        </ul>
    </div>
</body>
</html>
