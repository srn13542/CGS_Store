<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
        <%
            String username = (String) session.getAttribute("username");
            if (username != null) { //ë§ì½ ì ì ë¤ìì´ ëì´ ìëë¼ë©´ (ë¡ê·¸ì¸íë¤ë©´)
                for (int i = 1; i <= 5; i++) { 
                    String chatRoomName = "ChatRoom " + i; //ChatRoom i ë¡ ì´ë£¨ì´ì§ ë°©ì ìì±
        %>
                    <li><a href="chat?room=<%= chatRoomName %>"><%= chatRoomName %></a></li>
        <%
                }
            } else {
                //response.sendRedirect("login.jsp");
        %>
        <%@include file="login.jsp" %>
        <%
            }
        %>
    </ul>
</body>
</html>