<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // AJAX 요청인지 확인
    if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
        String username = request.getParameter("username");
        if (username != null && !username.isEmpty()) {
            session.setAttribute("username", username); // 세션 설정
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


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/4c3bda8fd6.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-auth.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-database.js"></script>
    <title>로그인</title>
    <script>
        // Firebase 설정
        const firebaseConfig = {
            apiKey: "AIzaSyDdDSOk6tff59in7-HDYh5sgcv_REKvJVg",
            authDomain: "chatgpts-6e15f.firebaseapp.com",
            databaseURL: "https://chatgpts-6e15f-default-rtdb.asia-southeast1.firebasedatabase.app",
            projectId: "chatgpts-6e15f",
            storageBucket: "chatgpts-6e15f.appspot.com",
            messagingSenderId: "886550654757",
            appId: "1:886550654757:web:c63d114a77069a756f34cc",
            measurementId: "G-3CL8ZEJW3L"
        };

        // Firebase 초기화
        if (!firebase.apps.length) {
            firebase.initializeApp(firebaseConfig);
            console.log("Firebase initialized successfully");
        } else {
            console.log("Firebase already initialized.");
        }

        function login() {
            const username = document.getElementById('username').value; // 입력한 사용자 이름
            const password = document.getElementById('password').value; // 입력한 비밀번호

            // Firebase Realtime Database 참조
            const database = firebase.database();
            database.ref('users').orderByChild('username').equalTo(username).once('value')
                .then((snapshot) => {
                    if (snapshot.exists()) {
                        const userData = Object.values(snapshot.val())[0];

                        if (userData.password === password) {
                            // 비밀번호가 일치할 경우
                            alert('로그인 성공!');

                            // 서버에 username 전달하여 세션 설정
                            $.ajax({
                                url: "login.jsp",
                                method: "POST",
                                data: { username: username },
                                success: function(response) {
                                    if (response.trim() === "success") {
                                        alert("로그인 성공!");
                                        window.location.href = "main.jsp"; // 메인 페이지로 이동
                                    } else {
                                        alert("로그인 실패: " + response);
                                    }
                                },
                                error: function(xhr, status, error) {
                                    console.error("AJAX 요청 실패:", status, error); // AJAX 실패 로그
                                    alert("서버 요청 실패!");
                                }
                            });

                        } else {
                            alert('비밀번호가 올바르지 않습니다.');
                        }
                    } else {
                        alert('사용자를 찾을 수 없습니다.');
                    }
                })
                .catch((error) => {
                    console.error('Firebase Error:', error);
                    alert('로그인 중 문제가 발생했습니다.');
                });
        }

        window.onload = function() {
            $.ajax({
                url: "checkSession.jsp", // 세션 확인을 위한 JSP 파일
                method: "GET",
                success: function(response) {
                    if (response.trim() === "logged_in") {
                        alert("이미 로그인된 상태입니다.");
                        window.location.href = 'main.jsp';
                    }
                }
            });
        };
    </script>
    <style>
        .loginFormClass {
            height: 700px;
            width: 400px;
            background-color: #EBEBEB;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            padding: 30px;
            border-radius: 16px;
            margin: 10px;
        }
        .backwardBtn {
            border: 0;
            background: none;
        }
        .loginViewBtn {
            height: 50px;
            display: block;
            width: 100%;
            margin: 0 0 20px 0;
            border: 0;
            font-size: 20px;
            background-color: #ffffff;
            border-radius: 12px;
        }
        #didYouMissingTxt {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .miniDiv {
            padding: 2px 10px 2px 10px;
        }
        .minifont {
            font-size: 12px;
            color: #B0B0B0;
        }
        input {
            border: 0;
            display: block;
            width: 100%;
            height: 40px;
        }
    </style>
</head>
<body>
    <div class="loginFormClass">
        <h2><button class="backwardBtn"><i class="fa-solid fa-arrow-left"></i></button><b> 로그인</b></h2><br />
        <form id="loginForm" onsubmit="event.preventDefault(); login();">
            <div class="miniDiv">
                <label for="username" class="minifont">Username:</label><br />
                <input type="text" id="username" name="username" required>
            </div><br>
            <div class="miniDiv">
                <label for="password" class="minifont">Password:</label><br />
                <input type="password" id="password" name="password" required>
            </div><br>
            <hr /><br>
            <button type="submit" class="loginViewBtn">로그인</button>
        </form>
        <button class="loginViewBtn" onClick="location.href='register.jsp'">처음 오셨나요?</button>
        <a href="missingPswd.jsp" id="didYouMissingTxt">비밀번호를 잊어버리셨나요?</a>
    </div>
</body>
</html>
