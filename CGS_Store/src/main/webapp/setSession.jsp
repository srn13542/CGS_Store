<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  // AJAX 요청인지 확인
  if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
    String username = request.getParameter("username");
    if (username != null && !username.isEmpty()) {
      session.setAttribute("username", username); // 세션에 username 저장
      System.out.println("Username set in session: " + username); // 로그 확인
      response.setContentType("text/plain");
      response.getWriter().write("success");
    } else {
      response.setContentType("text/plain");
      response.getWriter().write("failure");
    }
    return;
  }
%>
