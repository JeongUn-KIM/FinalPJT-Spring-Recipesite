<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>메인</title>
<script type="text/javascript">
	function logincheck() {
		
				if($("#user_email").val() == ""){
					alert("이메일을 입력해주세요.");
					$("#user_email").focus();
					return false;
				}
				
				if($("#user_pw").val() == ""){
					alert("비밀번호를 입력해주세요.");
					$("#user_pw").focus();
					return false;
				}
				
				
				location.href ="/loginresult"
			

			
	}
	</script>
</head>
<body>

        <form action="/loginresult" method="post">
            <div>
                <label>아이디</label>
                <input type = "text" id="user_email" name="user_email">    
            </div>
            <div>
                <label>비밀번호</label>
                <input type = "password" id="user_pw" name="user_pw">
            </div>
            <input type="button" id="submit" value="로그인" onclick="logincheck()"></input>
<input type="button" id="submit" value = "회원가입" onclick="location.href='/join'"></input>
        </form>



</body>
</html>