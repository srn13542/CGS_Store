<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/4c3bda8fd6.js"
	crossorigin="anonymous"></script>
<title>이메일로 비밀번호 전송</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #C0C0C0;
}

form {
	text-align: center;
	margin: 0 auto;
	background-color: #EBEBEB;
	width: 600px;
	padding: 10px;
	height: auto;
	border-radius: 16px;
}

.signupP {
	text-align: left;
	position: relative;
	left: 50px;
	margin: 15px 0 5px 0;
}

span {
	color: red;
}

#email {
	padding: 10px;
	border: 1px solid #cecece;
	font-size: 16px;
	margin: 5px 0;
	width: 480px;
	border-radius: 5px;
}

#sendEmailBtn {
	width: 290px;
	padding: 10px;
	background-color: #FFFFFF;
	border: none;
	font-size: 16px;
	margin-top: 20px;
	cursor: pointer;
	border-radius: 5px;
}

#sendEmailBtn:hover {
	background-color: #DDDDDD;
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

.navbar a {
	color: white;
	text-decoration: none;
}

p.notice {
	font-size: 12px;
	color: #808080;
	margin-top: 15px;
}
</style>
</head>
<body>
	<!-- 네비게이션 바 -->
	<div class="navbar">
		<h1>
			<a href="main.jsp">비밀번호 찾기</a>
		</h1>
	</div>

	<!-- 이메일 입력 폼 -->
	<form action="sendPassword" method="post">
		<br>
		<p class="notice">비밀번호를 이메일로 전송합니다. 이메일 주소를 입력해주세요.</p>
		<div>
			<p class="signupP">
				이메일 <span>*</span>
			</p>
			<input type="email" id="email" name="email" placeholder="이메일 입력"
				required>
		</div>
		<input type="submit" value="비밀번호 전송" id="sendEmailBtn">
	</form>
</body>
</html>
