<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    if (username != null) {
        response.setContentType("text/plain");
        response.getWriter().write("logged_in");
    } else {
        response.setContentType("text/plain");
        response.getWriter().write("not_logged_in");
    }
%>
