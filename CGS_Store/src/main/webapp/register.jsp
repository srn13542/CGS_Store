<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<div class="signup-modal">
    <h2>회원가입</h2>
    <form action="signup" method="post"> <!— 회원가입 서블릿으로 데이터 전송 —>
        <div class="form-group">
            <input type="email" id="email" name="email" placeholder="이메일을 입력하세요" required><br/>
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required><br/>
            <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required><br/>
        </div><br/>
        <input type="submit" value="회원가입" id="signupBtn">
    </form>
    <hr/>
    <div>
        <a href="login.jsp">
            <button id="backToLoginBtn">로그인 화면으로 돌아가기</button>
        </a>
    </div>
</div>
</body>
<style>
    .signup-modal {
        background-color: #F9F9F9;
        padding: 16px;
        border-radius: 24px;
        height: 400px;
        width: 300px;
        text-align: center;
        margin: 0 auto;
    }
    #email, #password, #name {
        width: 270px;
        padding: 10px;
        border: 1px solid #cecece;
        font-size: 16px;
        margin: 5px 0;
    }
    #signupBtn {
        width: 290px;
        padding: 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        font-size: 16px;
        margin: 10px 0;
    }
    #signupBtn:hover {
        background-color: #45A049;
    }
    h2 {
        text-align: left;
        padding-left: 5px;
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
</style>
</html>
