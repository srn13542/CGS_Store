<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- Firebase SDKs -->
<script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-database.js"></script>
</head>
<body>
<div class="signup-modal">
    <h2>회원가입</h2>
    <form id="signupForm">

<div class="navbar">
    <h1>
        <a href="main.jsp" style="color: white; text-decoration: none;">회원가입</a>
    </h1>
</div>

<div class="signupDiv">
    <!-- 절대 경로를 사용하여 서블릿과 정확히 연결 -->
    <form action="<%= request.getContextPath() %>/signup" method="post">
        <div class="form-group">
            <p class="signupP">닉네임 <span id="nameSpan">*</span></p>
            <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required><br/>
            
            <p class="signupP">이메일 <span id="emailSpan">*</span></p>
            <input type="email" id="email" name="email" placeholder="이메일을 입력하세요" required><br/>
            
            <p class="signupP">비밀번호 <span id="passwordSpan">*</span></p>
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required><br/>
            
            <p class="signupP">비밀번호 확인 <span id="passwordCheckSpan">*</span></p>
            <input type="password" id="passwordCheck" name="passwordCheck" placeholder="비밀번호를 다시 입력해주세요" required><br/>
            
            <div class="confirmDiv"></div>
        </div><br/><br />
        <input type="submit" value="회원가입" id="signupBtn">
    </form>
    <hr/>
    <div>
        <a href="login.jsp">
            <button id="backToLoginBtn">로그인 화면으로 돌아가기</button>
        </a>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Your web app's Firebase configuration
      //여기임 api


        // Initialize Firebase
        firebase.initializeApp(firebaseConfig);
        const database = firebase.database();

        console.log('Firebase initialized:', firebase.app());
        console.log('Database initialized:', database);

        document.getElementById('signupForm').addEventListener('submit', function(event) {
            event.preventDefault();  // 기본 폼 제출 동작 방지

            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            const username = document.getElementById('name').value;

            console.log('Attempting to write user data...');
            console.log(`Email: ${email}, Username: ${username}, Password: ${password}`);

            // default_key 값 증가
            database.ref('default_key').once('value').then((snapshot) => {
                let currentValue = parseInt(snapshot.val().value, 10) || 0;
                let newValue = currentValue + 1;

                // 사용자 데이터와 증가된 default_key 값 저장
                return database.ref('users/' + username).set({
                    email: email,
                    username: username,
                    password: password,
                    pid: newValue
                }).then(() => {
                    return database.ref('default_key').set({ value: newValue });
                });
            }).then(() => {
                console.log('User data and default key incremented successfully.');
                alert('회원가입이 완료되었습니다.');
                window.location.href = "main.jsp";  // 회원가입 완료 후 main.jsp로 이동
            }).catch((error) => {
                console.error('Error during user registration:', error);
                alert('회원가입 중 오류가 발생했습니다.');
            });
        });
    });
</script>
</body>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #C0C0C0;
    }
    #email, #password, #name, #passwordCheck {
        padding: 10px;
        border: 1px solid #cecece;
        font-size: 16px;
        margin: 5px 0 5px 0;
        width: 480px;
    }
    #signupBtn {
        width: 290px;
        padding: 10px;
        background-color: #FFFFFF;
        color: black;
        border: none;
        font-size: 16px;
        margin: 10px 0;
    }
    #signupBtn:hover {
        background-color: #DDDDDD;
    }
    h2 {
        text-align: left;
        padding-left: 50px;
    }
    hr {
        margin: 20px 0;
    }
    #backToLoginBtn {
        width: 290px;
        padding: 10px;
        border: none;
        background-color: #ffffff;
        margin: 5px 0;
    }
    #backToLoginBtn:hover {
        background-color: #ececec;
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
    .sign-in:hover {
        transform: scale(0.9); /* 버튼 크기 확대 */
        transition: transform 0.3s ease;
    }
    form {
        text-align: center;
        margin: 0 auto;
        background-color: #EBEBEB;
        width: 600px;
        padding: 10px;
        height: 90vh;
    }
    .signupP {
        text-align: left;
        position: relative;
        left: 50px;
        margin: 15px 0 0 0;
    }
    span {
        color: red;
    }
    .explainSpan {
        color: #C0C0C0;
        text-align: left;
        position: relative;
    }
</style>
</html>
