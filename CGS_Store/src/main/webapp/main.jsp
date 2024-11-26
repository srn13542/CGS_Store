<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width", initial-scale="1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link rel="icon" href="/CGS_Store/images/favicon.ico" type="image/x-icon">
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

        .navbar .sign-in {
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

        .container {
        	background-color: #EBEBEB;
            text-align: center;
            position: relative;
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
            width: 70%;
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
		
    </style>
</head>
<body>
    <div class="navbar">
        <h1>어떡하징 뭐라하징?</h1>
        <button class="sign-in">
        	<a href="login.jsp" style="color: white; text-decoration: none;">Sign in</a>
        </button>
    </div>
    <div class="container">
        <div id="myCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
            <!-- Indicators -->
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2"></button>
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
            	<button>학습 시작하기</button>
        	</div>
        	
            <!-- Controls -->
            <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
</body>
</html>