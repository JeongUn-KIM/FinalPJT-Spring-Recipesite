<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.2.1.min.js"></script>
<style>
#messageWindow{
				background-color:#abcdef; 
				width:500px; 
				height:600px; 
				overflow:scroll;
			}
#inputMessage{
				width:400px;
			}
</style>
</head>
<body>

	<!-- 채팅창 만들기 -->
	<!-- 채팅창 입장 / 퇴장 -->
<button id="enter">입장</button>
<button id="exit">퇴장</button>

	<!-- 채팅 전반 영역 -->
	<!-- style="display:none"   :   영역은 존재하나 처음에는 안보임, 입장 버튼을 누르는 순간 보임 -->
	
<div id="chatbox">	

	<!-- 대화내용 출력 영역 -->	
	<div id="messageWindow"></div>
	<input id="inputMessage" type="text">
	<button id="sendBtn">전송</button>

		
</div>

</body>
</html>