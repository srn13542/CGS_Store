<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chat List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/4c3bda8fd6.js"
	crossorigin="anonymous"></script>
<link rel="icon" href="/CGS_Store/images/favicon.ico"
	type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

.chat-container {
	display: flex;
	flex-wrap: wrap; /* 화면 크기에 따라 박스가 넘치면 다음 줄로 이동 */
	justify-content: center; /* 가로 방향 중앙 정렬 */
	gap: 20px; /* 박스 간격 */
	margin: 20px auto;
	width: 100%;
	height: 80vh; /* 뷰포트 높이를 기준으로 설정 */
	display: flex;
	justify-content: center; /* 가로 중앙 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
}

.chat-box {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 300px;
	height: 600px;
	background-color: #FFFFFF;
	border: 2px solid #004E98;
	border-radius: 15px;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	cursor: pointer;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	text-align: center;
	height: 400px;
}

.chat-box:hover {
	transform: scale(1.03);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
}

.chat-box img {
	width: 250px;
	height: 250px;
	object-fit: cover;
	border-radius: 10px;
	margin: 0; /* 여백 제거 */
	margin-top: 20px; /* 이미지와의 간격 추가 */
}

.chat-box .chat-info {
	flex-grow: 1;
	margin-top: 40px; /* 이미지와의 간격 추가 */
}

.chat-box .chat-info h3 {
	margin: 0;
	font-size: 20px;
	color: #004E98;
}

.chat-box .chat-info p {
	margin: 5px 0;
	font-size: 14px;
	color: #555555;
}
</style>
</head>
<body>
	<%
	String username = (String) session.getAttribute("username");
	String[] chatRoomNames = { "직장 시뮬레이션", "소개팅 시뮬레이션", "대학 시뮬레이션", "면접 시뮬레이션" };
	String[] chatImages = { "images/office.jpg", // 직장 시뮬레이션 이미지
			"images/dating.jpg", // 소개팅 시뮬레이션 이미지
			"images/university.jpg", // 대학 시뮬레이션 이미지
			"images/interview.jpg" // 면접 시뮬레이션 이미지
	};
	%>
	<div class="navbar">
		<h1>
			<a href="main.jsp" style="color: white; text-decoration: none;">어떡하징
				뭐라하징?</a>
		</h1>
		<%
		if (username != null) {
		%>
		<a href="logout" class="sign">Sign out</a>
		<%
		} else {
		%>
		<a href="login.jsp" class="sign">Sign in</a>
		<%
		}
		%>
	</div>

	<div class="chat-container">
		<%
		if (username != null) {
			for (int i = 0; i < chatRoomNames.length; i++) {
				String chatRoomName = chatRoomNames[i];
				String chatImage = chatImages[i];
				String encodedRoomName = java.net.URLEncoder.encode(chatRoomName, "UTF-8");
		%>
		<div class="chat-box"
			onclick="location.href='chat?room=<%=encodedRoomName%>'">
			<img src="<%=chatImage%>" alt="<%=chatRoomName%> Image">
			<div class="chat-info">
				<h3><%=chatRoomName%></h3>
			</div>
		</div>
		<%
		}
		} else {
		%>
		<div class="chat-box">
			<p>
				로그인을 하시면 채팅방을 볼 수 있습니다. <a href="login.jsp">로그인</a>
			</p>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>
