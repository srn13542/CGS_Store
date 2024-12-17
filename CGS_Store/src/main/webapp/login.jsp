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
<!-- <title>Insert title here</title> -->


<style>
.loginFormClass {
	height: 700px;
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
	display: center;
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
		<h2>
			<button class="backwardBtn">
				<i class="fa-solid fa-arrow-left"></i>
			</button>
			<b> 로그인</b>
		</h2>
		<br />
		<!-- 제목구역 -->
		<form id="loginForm" onsubmit="writeUserData(event)">
			<div class="miniDiv">
				<label for="username" class="minifont">Username:</label><br /> <input
					type="text" id="username" name="username">
			</div>
			<br>
			<div class="miniDiv">
				<label for="password" class="minifont">Password:</label><br /> <input
					type="password" id="password" name="password">
			</div>
			<br>
			<hr />
			<br>
			<button type="submit" value="로그인" class="loginViewBtn">로그인</button>
		</form>
		<form action="main.jsp" method="get">
			<button class="loginViewBtn">처음 오셨나요?</button>
			<br /> <a href="missingPswd.jsp" id="didYouMissingTxt">비밀번호를
				잊어버리셨나요?</a>
		</form>
	</div>
</body>
</html>

