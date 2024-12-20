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
<script src="https://kit.fontawesome.com/4c3bda8fd6.js"
	crossorigin="anonymous"></script>
<link rel="icon" href="/CGS_Store/images/favicon.ico"
	type="image/x-icon">
<title>비밀번호 찾기</title>

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
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
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

#username, #nickname {
	padding: 10px;
	border: 1px solid #cecece;
	font-size: 16px;
	margin: 5px 0;
	width: 480px;
	border-radius: 5px;
}

#findPasswordBtn {
	width: 290px;
	padding: 10px;
	background-color: #FFFFFF;
	border: none;
	font-size: 16px;
	margin-top: 20px;
	cursor: pointer;
	border-radius: 5px;
}

#findPasswordBtn:hover {
	transform: scale(0.9); /* 버튼 크기 확대 */
	transition: transform 0.3s ease;
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

	<!-- 비밀번호 찾기 폼 -->
	<form action="sendPswd.jsp" method="post">

		<br>
		<div>
			<p class="signupP">
				아이디 또는 이메일 <span>*</span>
			</p>
			<input type="text" id="username" name="username"
				placeholder="아이디 또는 이메일 입력" required>
		</div>
		<div>
			<p class="signupP">
				닉네임 <span>*</span>
			</p>
			<input type="text" id="nickname" name="nickname" placeholder="닉네임 입력"
				required>
		</div>
		<input type="submit" value="비밀번호 찾기" id="findPasswordBtn">
		<p class="notice">비밀번호를 찾기 위해 정확한 정보를 입력해주세요.</p>
	</form>
</body>
</html>
