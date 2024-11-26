<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class = "modal1">
	<h2>로그인</h2> <!-- 제목구역 -->
	<form action="login" method="post"> <!-- 로그인 서블릿 사용하여 페이지 이동 -->
	    <div class = "loginForm"> <!-- 이름 뒤에 적을 수 있는 input 타입을 넣음 -->
		<input type="text" id="username" name="username" placeholder="ID를 입력하세요"><br/>
		<input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요"><br/>
		</div><br />
		<input type="submit" value="Login" id = "LoginBtn">
	</form>
	<hr />
	
	<div>
	  <button value="signInEmailBtn" id="signInEmailBtn">이메일로 회원가입</button><br />
	  <button value="signInBtn" id="signInBtn">처음 오셨나요?</button>
	  <button value="whatIsMyPswd" id="pswdMissingBtn">비밀번호가 기억나지 않으시나요?</button>
	</div>
</div>
	<h2>Login</h2>
	<!-- 제목구역 -->
	<form action="login" method="post">
		<!-- 로그인 서블릿 사용하여 페이지 이동 -->
		<label for="username">Username:</label>
		<!-- 이름 뒤에 적을 수 있는 input 타입을 넣음 -->
		<input type="text" id="username" name="username"><br>
		<br> <label for="password">Password:</label> <input
			type="password" id="password" name="password"><br>
		<br> <input type="submit" value="Login"> <a
			href="main.jsp">Go to Main Page</a>
		<form action="main.jsp" method="get">
			<button type="submit">Go to Main Page</button>
		</form>

	</form>
</body>
<style>
  .modal1{
    background-color:#EBEBEB;
    padding: 16px;
    border-radius:24px;
    height: 500px;
    width: 300px;
    text-align: center;
    margin: 0 auto;
  }
   #username{
    width: 270px;
    padding: 10px;
    border: 1px dotted #cecece;
    font-size: 16px;
  }
  #password{
    width: 270px;
    padding: 10px;
    border: 1px dotted #cecece;
    font-size: 16px;
  }
  #LoginBtn{
    width: 290px;
    padding: 10px;
    background-color: #3399ff;
    border: 0px;
    font-size: 16px;
  }
  #LoginBtn:hover{
    background-color: #0066CC;
  }
  h2{
    text-align: left;
    padding: 0px 0px 0px 5px;
  }
  hr{
  margin: 20px 0px 20px 0px;
  }
  button{
    width: 290px;
    padding: 10px;
    border: 0px;
    background-color:#ffffff;
    margin: 5px 0px 5px 0px
  }
  #pswdMissingBtn{
    font-size:10px;
    text-color:#cccccc;
    background-color:#ebebeb;
  }
  #pswdMissingBtn:hover{
    background-color:#cccccc;
  }
</style>
</html>