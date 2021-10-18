<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>회원가입 페이지</title>
	<script type="text/javascript">	
const regex = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
const regex2 = /^[가-힣a-zA-Z]+$/;
				/* 우편번호 찾기 api */
				function execPostCode() {
				    new daum.Postcode({
				        oncomplete: function(data) {
				           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
				           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				           var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
				           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				               extraRoadAddr += data.bname;
				           }
				           // 건물명이 있고, 공동주택일 경우 추가한다.
				           if(data.buildingName !== '' && data.apartment === 'Y'){
				              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				           }
				           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				           if(extraRoadAddr !== ''){
				               extraRoadAddr = ' (' + extraRoadAddr + ')';
				           }
				           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				           if(fullRoadAddr !== ''){
				               fullRoadAddr += extraRoadAddr;
				           }
	
				           // 우편번호와 주소 정보를 해당 필드에 넣는다.
				           console.log(data.zonecode);//우편번호
				           console.log(fullRoadAddr);//도로명주소
				           
				           
				           $("#${userlist.user_no}user_address1").val(data.zonecode);
				           $("#${userlist.user_no}user_address2").val(fullRoadAddr);
				           
				           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
				       }
				    }).open();
				}
				
			</script>
	<script type="text/javascript">
	function joincheck() {
		var test1 = $("#user_pw").val();
		var test2 = $("#user_name").val();
		var test3 = $("#user_pwCheck").val();
		
				if($("#user_email").val() == ""){
					alert("이메일을 입력해주세요.");
					$("#user_email").focus();
					return false;
				}
				if(test1 == ""){
					alert("비밀번호를 입력해주세요.");
					$("#user_pw").focus();
					return false;
				}
				
				if (!regex.test(test1)) {
					alert("비밀번호가 조건에 맞지 않습니다.")
					$("#user_pw").focus();
					return false;
				}
				
				if(test3 == "") {
					alert("비밀번호확인을 입력해주세요.")
					$("#user_pwCheck").focus();
					return false;
				}
				
				if (!regex.test(test3)) {
					alert("비밀번호확인이 조건에 맞지 않습니다.")
					$("#user_pwCheck").focus();
					return false;
				}
					
				if(test1 != test3) {
					alert("비밀번호가 서로 다르게 입력하셨습니다. ")
					return false;
				}
				
				if(test2 == ""){
					alert("성명을 입력해주세요.");
					$("#user_name").focus();
					return false;
				}
				if(!regex2.test(test2)) {
					alert("이름을 잘못 입력하셨습니다.")
					return false;
				}
				
				if($("#user_phone").val() == ""){
					alert("전화번호를 입력해주세요.");
					$("#user_phone").focus();
					return false;
				}
				if($("#user_address").val() == ""){
					alert("주소를 입력해주세요.");
					$("#user_address").focus();
					return false;
				}
				if(confirm("회원가입을 하시겠습니까?")){
					// alert("회원가입이 완료되었습니다. 감사합니다.");
			         $("form").submit();    
			    }


			
			}
</script>
</head>
<body>
<h1> 회원가입 </h1>
<form action="/joinresult" method="post">
<div class="form-group has-feedback" id ="userinsert">
					<label class="control-label" for="user_email">이메일</label>
					<input class="form-control" type="text" id="user_email" name="user_email" placeholder="이메일" />
				</div>	
				 <br>
<div class= "form-group has-feedback">
					<label class="control-label" for="user_pw">비밀번호</label>
					<input class="form-control" type="password" id="user_pw" name="user_pw" placeholder="비밀번호" />
					<h6>(8~16자내에서 영문 대 소문자, 숫자, 특수문자를 전부 사용하세요.)</h6>
		</div>		<br>
		<div class= "form-group has-feedback">
					<label class="control-label" for="user_pw">비밀번호확인</label>
					<input class="form-control" type="password" id="user_pwCheck" name="user_pwCheck" placeholder="비밀번호확인" />
					<h6>(8~16자내에서 영문 대 소문자, 숫자, 특수문자를 전부 사용하세요.)</h6>
		</div>		<br>
<div class= "form-group has-feedback">
					<label class="control-label" for="user_name">이름</label>
					<input class="form-control" type="text" id="user_name" name="user_name" placeholder="이름" />
					<h6>(한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가))</h6>
	</div>				 <br>
<div class= "form-group has-feedback">
					<label class="control-label" for="user_phone">전화번호</label>
					<input class="form-control" type="text" id="user_phone" name="user_phone" placeholder="전화번호" />
				</div> <br>
<div class= "form-group has-feedback">			
					<label class="control-label" for="user_address">주소</label>
					<input class="form-control" type="text" id="user_address1" name="user_address" placeholder="우편번호" />
					<button type='button' onclick="execPostCode();">우편번호</button>
					<input class="form-control" type="text" id="user_address2" name="user_address" placeholder="주소" />
			</div>		 <br>		

</form>
<button type="button" id="submit"  onclick="joincheck()">가입완료</button>
<input type="button" id="submit" value = "취소" onclick="location.href='/login'"></input>



</body>
</html>