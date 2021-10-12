<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원정보수정</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/main";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#user_pw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#user_pw").focus();
					return false;
				}
				if($("#user_name").val()==""){
					alert("성명을 입력해주세요.");
					$("#user_name").focus();
					return false;
				}
				if($("#user_email").val()==""){
					alert("아이디를 입력해주세요.");
					$("#user_email").focus();
					return false;
				}
				if($("#user_address").val()==""){
					alert("주소를 입력해주세요.");
					$("#user_)address").focus();
					return false;
				}
				if($("#user_phone").val()==""){
					alert("전화번호를 입력해주세요.");
					$("#user_phone").focus();
					return false;
				}
			});
			
				
			
		})
	</script>
	<body>
		<section id="container">
			<form action="/join/main" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="user_email">아이디</label>
					<input class="form-control" type="text" id="user_email" name="user_email" value="${user.user_email}" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="user_pw">비밀번호</label>
					<input class="form-control" type="password" id="user_pw" name="user_pw" value ="${user.user_pw}" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="user_name">성명</label>
					<input class="form-control" type="text" id="user_name" name="user_name" value="${user.user_name}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="user_phone">전화번호</label>
					<input class="form-control" type="text" id="user_phone" name="user_phone" value="${user.user_phone}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="user_address">주소</label>
					<input class="form-control" type="text" id="user_address" name="user_address" value="${user.user_address}"/>
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
	</body>
	
</html>