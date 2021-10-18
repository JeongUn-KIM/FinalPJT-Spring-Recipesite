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
	<title>회원수정</title>
	<script type="text/javascript">
	function updatecheck() {
		const regex = /^.{8,16}$/;
		const regex2 = /^[가-힣a-zA-Z]+$/;
		var test1 = $("#user_pw").val();
		var test2 = $("#user_name").val();
		if (!regex.test(test1)) {
			alert("비밀번호를 잘못 입력하셨습니다.")
			return false;
		}
		if(!regex.test(test2)) {
			alert("이름을 잘못 입력하셨습니다.")
			return false;
		}
		
				if(confirm("수정 하시겠습니까?")){
					 alert("수정이 완료되었습니다. ");
			         $("form").submit();    
			    }


			
			}
	
	
</script>
</head>
<body>
<h1> 회원수정 </h1>
<form action="/myinformresult" method="post">
<div class="form-group has-feedback">
					<label class="control-label" for="user_email">이메일</label>
					<input class="form-control" type="text" id="user_email" name="user_email" value = "${user.user_email }" readonly="readonly"/>
				</div> <br>
<div class="form-group has-feedback">
					<label class="control-label" for="user_pw">비밀번호</label>
					<input class="form-control" type="password" id="user_pw" name="user_pw"  value = "${user.user_pw }"   />
					<h6>(8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.)</h6>
				</div> <br>
<div class="form-group has-feedback">
					<label class="control-label" for="user_name">이름</label>
					<input class="form-control" type="text" id="user_name" name="user_name"  value = "${user.user_name }" />
					 <h6>(한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가))</h6>
				</div> <br>
<div class="form-group has-feedback">
					<label class="control-label" for="user_phone">전화번호</label>
					<input class="form-control" type="text" id="user_phone" name="user_phone" value = "${user.user_phone }"  />
				</div> <br>
<div class="form-group has-feedback">
					<label class="control-label" for="user_address">주소</label>
					<input class="form-control" type="text" id="user_address" name="user_address" value = "${user.user_adress }"  />
				</div> <br>		
</form>
<button type="button" id="submit"  onclick="updatecheck()">수정</button>
</body>
</html>