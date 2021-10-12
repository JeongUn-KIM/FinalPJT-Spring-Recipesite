<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>로그인</title>
	<script src="resources/jQuery/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h1>로그인 페이지</h1>
	<hr />
		<c:choose>
			<c:when test="${empty sessionScope.userId}">
			<!-- 로그인이 안되어 있으면 -->
				<form id="loginFrm" name="loginFrm" action="main">
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="user_email" id="user_email" placeholder="10글자" maxlength="10"></td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><input type="password" name="user_pw" id="user_pw" maxlength="20"></td>
						</tr>
						<c:if test="${msg == '실패'}">
							<tr>
								<td colspan=2>
									아이디 또는 패스워드가 틀렸습니다.
								</td>
							</tr>
						</c:if>
						<tr>
							<td colspan=2>
								<input type="button" id="login" value="로그인" />
							</td>
						</tr>
					</table>
				</form>
			</c:when>
			<c:otherwise>
				<h3>${sessionScope.user_email}님 환영합니다.</h3>
				<a href="logout">로그아웃</a>
			</c:otherwise>
		</c:choose>
</body>
<script type="text/javascript">
	$(document).ready(function(e){
		$('#login').click(function(){

			// 입력 값 체크
			if($.trim($('#user_email').val()) == ''){
				alert("이메일을 입력해 주세요.");
				$('#user_email').focus();
				return;
			}else if($.trim($('#user_pw').val()) == ''){
				alert("패스워드를 입력해 주세요.");
				$('#user_pw').focus();
				return;
			}
			
			//전송
			$('#loginFrm').submit();
		});
		
	});
</script>
</html>