<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link rel="icon" href="/CGS_Store/images/favicon.ico" type="image/x-icon">
    <title>관리자 페이지</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #C0C0C0;
            min-height: 100vh;
        }
        .navbar {
            background-color: #004E98;
            padding: 10px;
            display: flex;
            align-items: center;
            color: white;
            width: 100%;
            top: 0;
            z-index: 1000;
        }
        .navbar h1 {
            margin: 0;
            font-size: 1.2em;
            flex: 1;
        }
        .navbar span {
            margin-left: 0;
            font-size: 0.7em;
            color: #ccc;
        }
        .nav {
            display: flex;
            margin-left: auto;
            align-items: center;
            justify-content: space-between;
            width: 75%;
        }
        .nav a {
            color: white;
            text-decoration: none;
            padding: 5px;
        }
        .nav a:hover {
            color: #FF6700;
        }
        .nav a:focus {
            outline: none;
        }
        .admin {
            background-color: #FF6700;
            color: white;
            padding: 10px 50px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-size: 20px;
            font-weight: bold;
        }
        .admin a {
            color: white;
            text-decoration: none;
        }
        .admin a:focus, .admin a:active {
            outline: none;
            text-decoration: none;
        }
        .admin:hover {
            transform: scale(0.9);
            transition: transform 0.3s ease;
        }
        .container {
            padding: 20px;
        }
        .group-box {
            background-color: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            border: 2px dashed #ccc;
            min-height: 300px;
        }
        .sidebar {
            width: 200px;
            background-color: #EBEBEB;
            color: black;
            position: fixed;
            height: 100%;
            padding: 15px;
            overflow-y: auto;
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }
        .sidebar ul li {
            margin-bottom: 15px;
            cursor: default;
        }
        .sidebar ul li ul {
            list-style-type: none;
            padding-left: 15px;
        }
        .sidebar ul li ul li {
            margin-bottom: 8px;
            cursor: pointer;
        }
        .content {
            margin-left: 220px;
            padding: 15px;
            min-height: calc(100vh - 50px);
        }
        .empty-message {
            text-align: center;
            font-size: 1.2em;
            color: #666;
        }
        .add-group {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #004E98;
            color: white;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            font-size: 24px;
            cursor: pointer;
        }
        .activity-box {
            background-color: #f9f9f9;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .activity-box h3 {
            font-size: 1.2em;
            margin-bottom: 15px;
        }
        .member-list {
            list-style: none;
            padding: 0;
        }
        .member-list li {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }
        .member-list li:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>어떡하징 뭐라하징?<span>관리자 페이지</span></h1>
        <ul class="nav nav-pills nav-fill">
            <li class="nav-item">
                <a class="nav-link" href="#">그룹 관리</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">데이터 관리</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">멤버 관리</a>
            </li>
            <button class="admin">
                <a href="login.jsp">Admin</a>
            </button>
        </ul>
    </div>
    <div class="sidebar">
        <ul>
            <li>그룹 관리
                <ul>
                    <li><a href="admin/AdminServlet?action=group-register">그룹 등록</a></li>
                    <li><a href="admin/AdminServlet?action=group-modify">그룹 수정</a></li>
                    <li><a href="admin/AdminServlet?action=group-delete">그룹 삭제</a></li>
                </ul>
            </li>
            <li>데이터 관리
                <ul>
                    <li><a href="admin/AdminServlet?action=data-management">뭐하지?</a></li>
                </ul>
            </li>
            <li>멤버 관리
                <ul>
                    <li><a href="admin/AdminServlet?action=member-score">멤버 점수</a></li>
                    <li><a href="admin/AdminServlet?action=individual-stats">개인 통계</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="content">
        <div class="activity-box">
            <h3>활동 중인 멤버</h3>
            <ul class="member-list">
                <li>
                    멤버 A
                    <span class="status-dot" style="background-color: green; height: 15px; width: 15px; border-radius: 50%; display: inline-block;"></span> 
                </li>
                <li>
                    멤버 B
                    <span class="status-dot" style="background-color: red; height: 15px; width: 15px; border-radius: 50%; display: inline-block;"></span> 
                </li>
                <li onclick="location.href='admin/AdminServlet?action=individual-stats';">
                    멤버 C
                    <span class="status-dot" style="background-color: yellow; height: 15px; width: 15px; border-radius: 50%; display: inline-block;"></span>
                </li>
            </ul>
        </div>
        <div class="activity-box">
            <h3>멤버 척도</h3>
            
        </div>
    </div>
</body>
</html>
