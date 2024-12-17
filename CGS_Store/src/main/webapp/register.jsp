<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<div class="navbar">
		<h1>
			<a href="main.jsp" style="color: white; text-decoration: none;">회원가입</a>
		</h1>
	</div>
	
    <form action="signup" method="post"> <!— 회원가입 서블릿으로 데이터 전송 —>
        <br /><br /><br />
        <div class="form-group">
            <p class="signupP">이메일</p>
            <input type="email" id="email" name="email" placeholder="이메일을 입력하세요" required><br/>
            <p class="signupP">비밀번호</p>
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required><br/>
            <p class="signupP">비밀번호 확인</p>
            <input type="password" id="passwordCheck" name="passwordCheck" placeholder="비밀번호를 다시 입력해주세요" required><br />
            <p class="signupP">닉네임</p>
            <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required><br/>
        </div><br/>
        <input type="submit" value="회원가입" id="signupBtn">
    </form>   

</body>


<style>
    body {
	    margin: 0;
	    font-family: Arial, sans-serif;
	    background-color: #C0C0C0;

    }
    #email, #password, #name {
        padding: 10px;
        border: 1px solid #cecece;
        font-size: 16px;
        margin: 5px 0;
        width:480px;
    }
    #signupBtn {
        width: 290px;
        padding: 10px;
        background-color: #FFFFFF;
        color: white;
        border: none;
        font-size: 16px;
        margin: 10px 0;
        color: #000000;
    }
    #signupBtn:hover {
        background-color: #EEEEEE;
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
    
    form{
        text-align: center;
        margin: 0 auto;
        background-color: #EBEBEB;
        width: 600px;
        padding: 10px;
        height: 80vh;
    }
    .signupP{
        
    }
</style>
</html>
