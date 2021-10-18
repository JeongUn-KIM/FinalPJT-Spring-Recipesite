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
	<title>회원탈퇴</title>
		<script type="text/javascript">
	function deletecheck() {
		
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
			
				if(confirm("정말 탈퇴를 하시겠습니까?")){
			         $("form").submit();    
			    }


			
			}
</script>
</head>
<body>
<h1> 탈퇴 </h1>
<form action="/deleteresult" method="post">
이메일 :	<input type="text" name="user_email" id="user_email" /> <br>
비밀번호 :	<input type="password" name="user_pw" id = "user_pw"/> <br>

</form>
<button type ="button" id ="submit" onclick = "deletecheck()"> 탈퇴</button>
</body>
</html>