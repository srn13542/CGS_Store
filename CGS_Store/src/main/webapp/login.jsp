<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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