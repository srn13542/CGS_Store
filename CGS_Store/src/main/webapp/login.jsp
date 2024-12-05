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
<title>Insert title here</title>


</head>
<body>
	<div class ="loginFormClass">
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
	</div>
</body>
<style>
  .loginFormClass{
    height: 80vh;
    width: 30vw;
    backgroud-color: gray;
    position: absolute;
    left:50%;
    top: 50%;
    transform: translate(-50%, -50%);
  }
</style>
</html>