<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %> --%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>회원가입 페이지</title>
</head>
<body>
<h1> 회원가입 </h1>
<form action="/joinresult" method="post">
이메일 :	<input type="text" name="user_email" placeholder="이메일" /> <br>
비밀번호 :	<input type="password" name="user_pw" placeholder="비밀번호" /> <br>
이름 :	<input type="text" name="user_name" placeholder="이름" /> <br>
전화번호 :	<input type="text" name="user_phone" placeholder="전화번호" /> <br>
주소 :	<input type="text" name="user_address" placeholder="주소" /> <br>
<button>가입</button>
<input type ="reset" value ="초기화">
</form>

</body>
</html>