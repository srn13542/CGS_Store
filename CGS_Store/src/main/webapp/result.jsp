<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Evaluation Results</title>
</head>
<body>
    <h1>평가 결과</h1>
    <ul>
        <%
        List<String> evaluationResults = (List<String>) session.getAttribute("evaluationResults");
        if (evaluationResults != null && !evaluationResults.isEmpty()) {
            for (String result : evaluationResults) {
        %>
        <li><%= result %></li>
        <%
            }
        } else {
        %>
        <p>평가 결과가 없습니다.</p>
        <%
        }
        %>
    </ul>
</body>
</html>
