// Firebase 설정
const firebaseConfig = {
	apiKey: "AIzaSyDdDSOk6tff59in7-HDYh5sgcv_REKvJVg",
	authDomain: "chatgpts-6e15f.firebaseapp.com",
	databaseURL: "https://chatgpts-6e15f-default-rtdb.asia-southeast1.firebasedatabase.app",
	projectId: "chatgpts-6e15f",
	storageBucket: "chatgpts-6e15f.firebasestorage.app",
	messagingSenderId: "886550654757",
	appId: "1:886550654757:web:c63d114a77069a756f34cc",
};

if (!firebase.apps.length) {
	firebase.initializeApp(firebaseConfig);
}

// 로그인 함수
function loginUser(username, password) {
	firebase.database().ref('users/' + username).once('value')
		.then(snapshot => {
			const userData = snapshot.val();
			if (userData && userData.password === password) {
				$.ajax({
					url: "setSession.jsp",
					method: "POST",
					data: { username: username },
					success: function(response) {
						if (response.trim() === "success") {
							alert("로그인 성공!");
							window.location.href = "main.jsp";
						} else {
							alert("서버 오류: " + response);
						}
					}
				});
			} else {
				alert("로그인 실패: 잘못된 사용자명 또는 비밀번호입니다.");
			}
		})
		.catch(error => alert("로그인 중 오류 발생: " + error));
}

// 이벤트 핸들러
$(document).on('submit', '#loginForm', function(event) {
	event.preventDefault();

	const username = $('#username').val().trim();
	const password = $('#password').val().trim();

	if (!username || !password) {
		alert('사용자 이름과 비밀번호를 입력해주세요.');
		return;
	}

	loginUser(username, password);
});
