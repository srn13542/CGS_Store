<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
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
<script src="https://kit.fontawesome.com/4c3bda8fd6.js" crossorigin="anonymous"></script>
<link rel="icon" href="/CGS_Store/images/favicon.ico"
	type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>프로젝트 소개</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #C0C0C0;
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

/* 모달 창 전체를 login.jsp 화면으로 */
.modal-dialog {
	height: 80vh;
}

.modal-content {
	border: none;
	border-radius: 50;
	height: 90%;
	width: 90%;
	background: none;
	box-shadow: none;
	align-items: center;
	justify-content: center;
}

.container {
	text-align: center;
	height: 100%; /* 화면 전체를 채우도록 설정 */
	background: none; /* 배경색 제거 */
}

.container p {
	font-size: 20px;
	line-height: 1.6;
}

.button {
	margin-top: auto;
	padding-bottom: 30px;
}

.button button {
	background-color: #004E98;
	color: white;
	border: none;
	padding: 15px 50px;
	font-size: 20px;
	font-weight: bold;
	border-radius: 20px;
	cursor: pointer;
}

.button:hover {
	transform: scale(0.9); /* 버튼 크기 확대 */
	transition: transform 0.3s ease;
}

.carousel {
	margin-top: 20px;
}

.carousel-inner img {
	width: 80%;
	height: 750px;
	object-fit: cover;
}

.carousel-button {
	position: absolute; /* 캐러셀 내에서 위치를 지정 */
	bottom: 20px; /* 아래쪽 여백 */
	left: 50%; /* 중앙 정렬 */
	transform: translateX(-50%); /* 정확히 중앙 배치 */
	z-index: 10; /* 버튼이 이미지 위에 표시되도록 설정 */
}

.carousel-button button {
	background-color: #004E98;
	color: white;
	border: none;
	padding: 15px 50px;
	font-size: 20px;
	font-weight: bold;
	border-radius: 20px;
	cursor: pointer;
	transition: transform 0.3s ease;
}

.carousel-button button:hover {
	transform: scale(0.9); /* 버튼 크기 확대 */
}

#loginModal{
  top: 5vw;
}
</style>
</head>
<body>
	<%
	String username = (String) session.getAttribute("username");
	%>
	<div class="navbar">
		<h1>
			<a href="main.jsp" style="color: white; text-decoration: none;">어떡하징
				뭐라하징?</a>
		</h1>
		<button class="sign" data-bs-toggle="modal"
			data-bs-target="#loginModal">
			<%
			if (username != null) {
			%>
			<!-- 로그아웃 버튼 -->
			<a href="logout" style="color: white; text-decoration: none;">Sign
				out</a>
			<%
			} else {
			%>
			<!-- 로그인 버튼 -->
			<a style="color: white; text-decoration: none;">Sign in</a>
			<%
			}
			%>
		</button>
	</div>

	<!-- 로그인 모달 -->
	<div class="modal fade" id="loginModal" tabindex="-1"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" id="loginContent">
					<p>로그인 창을 불러오는 중...</p>
				</div>
			</div>
		</div>
	</div>


	<script>
		// 모달이 열릴 때 login.jsp를 로드
		document
				.getElementById('loginModal')
				.addEventListener(
						'show.bs.modal',
						function() {
							const loginContent = document
									.getElementById('loginContent');
							$
									.ajax({
										url : "login.jsp", // login.jsp 파일 경로
										method : "GET",
										success : function(data) {
											loginContent.innerHTML = data; // login.jsp 로드
											// 모달 기본 배경 숨기기
											document
													.querySelector('.modal-dialog').style.background = "none";
											document.querySelector('.modal-content').style.background="rgba(0,0,0,0)";
											document.querySelector('.modal-content').style.border="0px solid #000000";
										},
										error : function() {
											loginContent.innerHTML = "<p>로그인 창을 불러오는 데 실패했습니다.</p>";
										}
									});
						});
	</script>

	<div class="container">
		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel"
			data-bs-interval="3000">
			<!-- Indicators -->
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="active"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="2"></button>
			</div>

			<!-- Carousel items -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="images/bear.jpg" class="d-block w-100" alt="Bear">
				</div>
				<div class="carousel-item">
					<img src="images/lion.jpg" class="d-block w-100" alt="Lion">
				</div>
				<div class="carousel-item">
					<img src="images/polar.jpg" class="d-block w-100" alt="Polar Bear">
				</div>
			</div>

			<div class="carousel-button">
				<a href="joinChatRoom.jsp" style="text-decoration: none;">
					<button
						style="background-color: #004E98; color: white; border: none; padding: 15px 50px; font-size: 20px; font-weight: bold; border-radius: 20px; cursor: pointer; transition: transform 0.3s ease;">
						학습 시작하기</button>
				</a>
			</div>

			<!-- Controls -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
</body>
</html>