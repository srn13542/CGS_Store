<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<link rel="icon" href="/CGS_Store/images/favicon.ico"
	type="image/x-icon">
<!-- <title>Insert title here</title> -->

<style>
  .loginFormClass{
    height: 700px;
    width: 400px;
    background-color: #EBEBEB;
    position: absolute;
    left:50%;
    top: 50%;
    transform: translate(-50%, -50%);
    padding: 30px;
    border-radius: 16px;
    margin:10px;
  }
  .backwardBtn{
   
  }
  .loginViewBtn{
    height:50px;
    width:340px;
    margin: 0 0 20px 0;
    border: 0;
    font-size: 20px;
  }
  #didYouMissingTxt{
    
  }
</style>

</head>
<body>
	<div class ="loginFormClass">
	<h2><b>로그인</b><button class="backwardBtn">x</button></h2><br />
	<!-- 제목구역 -->
	<form action="login" method="post">
		<!-- 로그인 서블릿 사용하여 페이지 이동 -->
		<div>
		<label for="username" class ="minifont">Username:</label>
		<!-- 이름 뒤에 적을 수 있는 input 타입을 넣음 -->
		<input type="text" id="username" name="username">
		</div><br>
		<div><label for="password" class="minifont">Password:</label> <input
			type="password" id="password" name="password"></div><br>
			<hr /><br>
		    <button type="submit" value="로그인" class="loginViewBtn">로그인</button>
		<form action="main.jsp" method="get">
			<button class="loginViewBtn">처음 오셨나요?</button> <br />
			<a href="missingPswd.jsp" id="didYouMissingTxt">비밀번호를 잊어버리셨나요?</a>
		</form>
	</form>
	</div>
</body>

</html>