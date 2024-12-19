<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/4c3bda8fd6.js" crossorigin="anonymous"></script>
<link rel="icon" href="/CGS_Store/images/favicon.ico" type="image/x-icon">
<!-- <title>Insert title here</title> -->

<!-- 파이어베이스 설치 코드 -->
<script src="https://www.gstatic.com/firebasejs/11.1.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/11.1.0/firebase-analytics.js"></script>
<script src="https://www.gstatic.com/firebasejs/11.1.0/firebase-database.js"></script>

<script>
  // Your web app's Firebase configuration
  const firebaseConfig = {
    apiKey: "AIzaSyDdDSOk6tff59in7-HDYh5sgcv_REKvJVg",
    authDomain: "chatgpts-6e15f.firebaseapp.com",
    databaseURL: "https://chatgpts-6e15f-default-rtdb.asia-southeast1.firebasedatabase.app",
    projectId: "chatgpts-6e15f",
    storageBucket: "chatgpts-6e15f.firebasestorage.app",
    messagingSenderId: "886550654757",
    appId: "1:886550654757:web:c63d114a77069a756f34cc",
    measurementId: "G-3CL8ZEJW3L"
  };

  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  const analytics = firebase.analytics();
  const database = firebase.database();

  console.log('Firebase initialized:', firebase.app());
  console.log('Database initialized:', database);

  // 데이터 쓰기 함수
  function writeInitialData() {
    const username = "initialUser";
    const password = "initialPassword";
    console.log('Attempting to write initial data...');
    console.log(`Username: ${username}, Password: ${password}`);
    database.ref('users/' + username).set({
      username: username,
      password: password
    }).then(() => {
      console.log('Initial user data saved successfully.');
    }).catch((error) => {
      console.error('Error saving initial user data:', error);
    });
  }

  // 초기화 후 데이터 저장 함수 호출
  window.onload = function() {
    writeInitialData();
  };
</script>

<style>
  .loginFormClass {
    height: 70vh;
    width: 30vw;
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
    border: 0px solid #000000;
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
  div .minifont {
    font-size: 12px;
    color: #B0B0B0;
  }
  div input {
    border: 0px solid #000000;
    display: block;
    width: 100%;
    height: 40px;
  }
  
</style>
</head>
<body>
  <div class="loginFormClass">
    <h2><button class="backwardBtn" onclick="$('#loginModal').modal('hide');"><i class="fa-solid fa-arrow-left"></i></button><b>  로그인</b></h2><br />
    <!-- 제목구역 -->
    <form id="loginForm">
      <div class="miniDiv">
        <label for="username" class="minifont">Username:</label><br />
        <input type="text" id="username" name="username">
      </div><br>
      <div class="miniDiv"><label for="password" class="minifont">Password:</label><br />
        <input type="password" id="password" name="password"></div><br>
      <hr /><br>
      <button type="submit" value="로그인" class="loginViewBtn">로그인</button>
    </form>
      <button class="loginViewBtn" onClick="location.href='register.jsp'" >처음 오셨나요?</button>
      <a href="missingPswd.jsp" id="didYouMissingTxt">비밀번호를 잊어버리셨나요?</a>
  </div>
</body>
</html>

