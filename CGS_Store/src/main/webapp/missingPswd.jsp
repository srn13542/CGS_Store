<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
    crossorigin="anonymous">
<script src="https://kit.fontawesome.com/4c3bda8fd6.js" crossorigin="anonymous"></script>
<link rel="icon" href="/CGS_Store/images/favicon.ico" type="image/x-icon">
<title>비밀번호 찾기</title>

<style>
  .loginFormClass {
    height: 500px;
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
  .findPasswordBtn {
    height: 50px;
    display: block;
    width: 100%;
    margin: 20px 0;
    border: 0;
    font-size: 18px;
    background-color: #ffffff;
    border-radius: 12px;
  }
  .miniDiv {
    padding: 10px 0;
  }
  .minifont {
    font-size: 12px;
    color: #B0B0B0;
  }
  input {
    border: 1px solid #ccc;
    width: 100%;
    height: 40px;
    padding: 5px;
    border-radius: 5px;
  }
</style>
</head>

<body>
    <div class="loginFormClass">
        <h2>
            <button class="backwardBtn" onclick="history.back();">
                <i class="fa-solid fa-arrow-left"></i>
            </button>
            <b> 비밀번호 찾기</b>
        </h2>
        <br />

        <!-- 비밀번호 찾기 폼 -->
        <form action="findPassword" method="post">
            <div class="miniDiv">
                <label for="username" class="minifont">아이디 또는 이메일:</label><br />
                <input type="text" id="username" name="username" placeholder="아이디 또는 이메일 입력" required>
            </div>
            <div class="miniDiv">
                <label for="phone" class="minifont">전화번호:</label><br />
                <input type="text" id="phone" name="phone" placeholder="전화번호 입력 (선택사항)">
            </div>
            <br />
            <button type="submit" class="findPasswordBtn">비밀번호 찾기</button>
        </form>

        <!-- 비밀번호 찾기 안내 -->
        <p class="text-center" style="font-size: 12px; color: #808080;">
            비밀번호를 찾기 위해 정확한 정보를 입력해주세요.
        </p>
    </div>
</body>
</html>
