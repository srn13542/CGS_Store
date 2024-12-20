<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://kit.fontawesome.com/4c3bda8fd6.js" crossorigin="anonymous"></script>

  <!-- Firebase UMD 버전 -->
<script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-analytics.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-database.js"></script>

  <script>
    // Firebase 설정
    //여기임 api
    // Firebase 초기화
    if (!firebase.apps.length) {
      firebase.initializeApp(firebaseConfig);
      console.log("Firebase initialized successfully");
    } else {
      console.log("Firebase already initialized.");
    }

    // 로그인 함수
    async function loginUser(username, password) {
      try {
        console.log(`Logging in with Username: ${username}, Password: ${password}`);
        
        const snapshot = await firebase.database().ref('users/' + username).once('value');
        const userData = snapshot.val();

        if (userData === null) {
          console.error('No user data found for username:', username);
          alert('로그인 실패: 사용자를 찾을 수 없습니다.');
        } else if (userData.password === password) {
          console.log('Login successful.');
		  window.location.href = "joinChatRoom.jsp";
          $.ajax({
        	url: "setSession.jsp",
        	method: "POST",
        	data: {username: username},
        	success: function(response){
        		if(response.trim()==="success"){
        	        alert('로그인 성공!');
        			window.location.href = "joinChatRoom.jsp";
        		} else{
        			alert("로그인 실패: "+ response);
        		}
        	},
        	error: function(xhr, status, error){
        		console.error("AJAX 요청 실패", status, error);
        		alert("서버 요청 실패!");
        	}
          })
        } else {
          console.error('Login failed: Invalid password.');
          alert('로그인 실패: 유효하지 않은 비밀번호입니다.');
        }
      } catch (error) {
        console.error('Error logging in:', error);
        alert('로그인 중 오류가 발생했습니다.');
      }
    }

    // 폼 제출 이벤트
    document.addEventListener('DOMContentLoaded', function () {
      document.getElementById('loginForm').addEventListener('submit', function (event) {
        event.preventDefault();

        const username = document.getElementById('username').value.trim();
        const password = document.getElementById('password').value.trim();

        if (!username || !password) {
          alert('사용자 이름과 비밀번호를 입력해주세요.');
          return;
        }

        loginUser(username, password);
      });
    });
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
