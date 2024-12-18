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

.navbar .button {
	background-color: #FF6700;
	color: white;
	padding: 10px 50px;
	border: none;
	border-radius: 20px;
	cursor: pointer;
	font-size: 20px;
	font-weight: bold;
	text-decoration: none;
}

.button:hover {
	transform: scale(0.9);
	transition: transform 0.3s ease;
}

.filter-sort-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 80%;
	margin: 20px auto;
}

.filter-box{
	background-color: #004E98;
	color: white;
	border-radius: 10px;
	padding: 10px 20px;
	font-size: 16px;
	float: left;
}

.sort-box {
	background-color: #004E98;
	color: white;
	border-radius: 10px;
	padding: 10px 20px;
	font-size: 16px;
	float: right;
}

.filter-box select, .sort-box select {
	margin-left: 10px;
	padding: 5px 10px;
	font-size: 14px;
	border: none;
	border-radius: 5px;
}

.chat-list {
	margin: 20px auto;
	width: 80%;
	max-width: 600px;
	background-color: #EBEBEB;
	border-radius: 10px;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	padding: 20px;
	list-style-type: none;
}

.chat-list li {
	margin: 10px 0;
	background-color: #004E98;
	border-radius: 5px;
	padding: 15px;
	display: flex;
	justify-content: space-between; /* 아이콘과 텍스트를 양쪽에 배치 */
	align-items: center; /* 아이콘과 텍스트를 같은 높이에 정렬 */
	color: white;
	transition: background-color 0.3s ease, transform 0.3s ease;
}

.chat-list li:hover {
	background-color: #006bb3;
	transform: scale(1.05);
}

.chat-list li a {
	color: white;
	text-decoration: none;
	font-size: 18px;
	font-weight: bold;
}

.chat-info {
	font-size: 14px;
	color: #B0C4DE;
	margin-top: 5px;
}

.rename-icon {
	font-size: 20px;
	color: #FF6700;
	cursor: pointer;
	transition: transform 0.2s ease;
	margin-left: 10px; /* 아이콘과 텍스트 간격 추가 */
}

.rename-icon:hover {
	transform: scale(1.2);
}
</style>
</head>
<body>
	<div class="navbar">
		 <h1><a href="main.jsp" style="color: white; text-decoration: none;">어떡하징 뭐라하징?</a></h1>
		<%
		String username = (String) session.getAttribute("username");
		if (username != null) {
		%>
		<a href="logout.jsp" class="button">Sign out</a>
		<%
		} else {
		%>
		<a href="login.jsp" class="button">Sign in</a>
		<%
		}
		%>
	</div>

	<!-- 채팅 리스트 -->
	<ul class="chat-list" id="chatList">
		<div class="filter-sort-container">
			<!-- Filter Box -->
			<div class="filter-box">
				<label for="chatFilter">Filter by:</label> <select id="chatFilter"
					onchange="filterChats()">
					<option value="all">All Chats</option>
					<option value="custom">Custom Filter</option>
				</select>
			</div>
			<!-- Sort Box -->
			<div class="sort-box">
				<label for="chatSort">Sort by:</label> <select id="chatSort"
					onchange="sortChats()">
					<option value="time">Time</option>
					<option value="views">Views</option>
				</select>
			</div>
		</div>
		<%
		if (username != null) {
			String[] chatRoomNames = { "직장 시뮬레이션", "소개팅 시뮬레이션", "대학 시뮬레이션", "면접 시뮬레이션" };
			for (int i = 0; i < chatRoomNames.length; i++) {
				String chatRoomName = chatRoomNames[i];
				String chatTime = "2024-11-27 12:0" + i; // Example time
				String chatPartner = "Partner " + i; // Example partner name
				int views = 10 * i; // Example views
		%>
		<li id="chat-<%=i%>" data-id="<%=i%>">
			<div>
				<a href="chat?room=<%=chatRoomName%>" class="chat-name"><%=chatRoomName%></a>
				<div class="chat-info">
					Created on:
					<%=chatTime%>
					| Partner:
					<%=chatPartner%>
					| Views:
					<%=views%>
				</div>
			</div> <i class="bi bi-pencil-square rename-icon"
			onclick="renameChat(<%=i%>)"></i>
		</li>
		<%
		}
		} else {
		%>
		<%@include file="login.jsp"%>
		<%
		}
		%>
	</ul>
	<script>
	function filterChats() {
	    const filter = document.getElementById('chatFilter').value;
	    const chatList = document.getElementById('chatList');
	    const chats = chatList.getElementsByTagName('li');
	    
	    for (let chat of chats) {
	        if (filter === 'custom') {
	            // Example custom filter (show only ChatRoom 3)
	            if (!chat.innerHTML.includes('ChatRoom 3')) {
	                chat.style.display = 'none';
	            } else {
	                chat.style.display = 'flex'; // 항상 flex 레이아웃 유지
	            }
	        } else {
	            chat.style.display = 'flex'; // 모든 요소를 flex로 표시
	        }
	    }
	}


    function sortChats() {
        const sort = document.getElementById('chatSort').value;
        const chatList = document.getElementById('chatList');
        const chats = Array.from(chatList.getElementsByTagName('li'));

        chats.sort((a, b) => {
            if (sort === 'time') {
                return new Date(a.getAttribute('data-time')) - new Date(b.getAttribute('data-time'));
            } else if (sort === 'views') {
                return b.getAttribute('data-views') - a.getAttribute('data-views');
            }
            return 0;
        });

        // Append sorted chats back to the list
        chats.forEach(chat => chatList.appendChild(chat));
    }
    </script>

	<script>
    function renameChat(chatId) {
        const chatItem = document.getElementById(`chat-${chatId}`);
        const chatNameElement = chatItem.querySelector('.chat-name');
        const newName = prompt('Enter the new name for the chat:', chatNameElement.textContent);

        if (newName && newName.trim() !== '') {
            // Update the chat name in the UI
            chatNameElement.textContent = newName;

            // Optionally send the update to the server (uncomment below to use)
            /*
            fetch('updateChatName', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ chatId, newName })
            }).then(response => {
                if (!response.ok) {
                    alert('Failed to update chat name on server.');
                }
            });
            */
        }
    }
    </script>
</body>
</html>
