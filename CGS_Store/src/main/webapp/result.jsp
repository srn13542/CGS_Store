<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Evaluation Results</title>
    <!-- Bootstrap 및 외부 리소스 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" 
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" 
            crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/4c3bda8fd6.js" crossorigin="anonymous"></script>
    <link rel="icon" href="/CGS_Store/images/favicon.ico" type="image/x-icon">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        body {
            background-color: #EBEBEB;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            border: 2px solid #004E98;
            border-radius: 10px;
        }
        .card-header {
            background-color: #004E98;
            color: white;
        }
        .card-body {
            background-color: white;
        }
        .score {
            font-weight: bold;
        }
        .no-results {
            font-style: italic;
        }
        ul {
            padding-left: 20px;
        }
        ul li {
            margin-bottom: 10px;
        }
        h2 {
            color: #004E98;
            margin-top: 30px;
        }
        .footer {
            margin-top: 50px;
            text-align: center;
            color: #004E98;
        }
        .main-button {
            margin-top: 20px;
            display: block;
            width: 100%;
            text-align: center;
            background-color: #FF6700;
            color: white;
            font-size: 16px;
            padding: 10px 0;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }
        .main-button:hover {
            background-color: #CC5500;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h1>평가 결과</h1>
            </div>
            <div class="card-body">
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
                    <p class="no-results">평가 결과가 없습니다.</p>
                    <%
                    }
                    %>
                </ul>
                <h2>점수 합계:</h2>
                <p>
                    <%
                    Integer totalScore = (Integer) session.getAttribute("totalScore");
                    if (totalScore != null) {
                    %>
                    <span class="score"><%= totalScore %></span>
                    <%
                    } else {
                    %>
                    <span class="no-results">점수 데이터가 없습니다.</span>
                    <%
                    }
                    %>
                </p>
                <a href="main.jsp" class="main-button">메인으로 돌아가기</a>
            </div>
        </div>
    </div>
</body>
</html>
