<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
/* 비번, 이름 정규식 체크 */
const regex = /^.{8,16}$/;
const regex2 = /^[가-힣a-zA-Z]+$/;
</script>


<style type="text/css">
/* 모달 관련 스타일 */
.modal{
	position:fixed;
	width: 500px;
	height: 500px;
	top: 40%;
	left: 50%;
	transform: translate(-50%,-50%);
	border : 1px solid blue;
	background: white;
	display:none;
}
.modal-con{
  position: absolute;
  top: 50%;
  left: 50%;
  width: 400px;
  height: 400px;
  transform: translate(-50%,-50%);
}
/* 모달창에서 입력규칙 관련 스타일 */
h6{
  margin: 0;
  padding: 0;
  line-height: 1.4rem;
  padding-bottom: 8px;
}

}

</style>

</head>
<body>
	<table style="margin-left: auto; margin-right: auto;" border='1'>
		<tr>
			<th>회원 이메일</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>휴대전화</th>
			<th>주소</th>
			<th>회원수정</th>
			<th>회원삭제</th>
		</tr> 
	<!-- 유저리스트 뽑아오기 -->
	<c:forEach items="${userlist }" var="userlist" varStatus="status">
		<tr>
			<td>${userlist.user_email }</td>
			<td>${userlist.user_pw }</td>
			<td>${userlist.user_name }</td>
			<!-- 폰 정보 -단위로 끈어서 보여주기 -->
			<td><c:set var="TextValue" value="${userlist.user_phone}"/>
				${fn:substring(TextValue,0,3) }-${fn:substring(TextValue,3,7) }-${fn:substring(TextValue,7,11)}
			</td>
			<td>${userlist.user_address }</td>
			<td><button type='button' id="${userlist.user_no}edit">수정하기</button></td>
			<td><button type='button' id="${userlist.user_no}delete">삭제</button></td>
		</tr>
			<!-- 모달로 수정창 띄우기 -->
			<div class="modal" id="${userlist.user_no}modal1"> 
				<div class="modal-con" id="${userlist.user_no}modal2"> 
					<h3>회원정보</h3>
					회원 이메일 : <input type='text' name='user_email' id='${userlist.user_no}user_email' value='${userlist.user_email}'><br>
					비밀번호 : <input type='text' name='user_pw' id='${userlist.user_no}user_pw' value='${userlist.user_pw}'>
							<h6>(8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.)</h6>
					이름 : <input type='text' name='user_name' id='${userlist.user_no}user_name' value='${userlist.user_name}'>
							<h6>(한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가))</h6>
					휴대전화 : <input type='text' name='user_phone' id='${userlist.user_no}user_phone' value='${userlist.user_phone}'><br>
					<!-- 주소 우편번호와 실제 주소 나눠서 보여주기 -->
					<c:set var="imsi" value="${userlist.user_address}"/>
					<c:set var="email" value="${fn:split(imsi,',')}"/>					
					주소 : <input type='text' name='user_address' id='${userlist.user_no}user_address1' value='${email[0]}'>
						<button type='button' onclick="execPostCode${userlist.user_no}();">우편번호</button>
						<input type='text' name='user_address' id='${userlist.user_no}user_address2' value='${email[1]}'>
					<br>
					<button type='button' id="${userlist.user_no}check" onclick="test3${userlist.user_no}();">완료</button>
					<button type='button' class="modal_cancel">취소</button>
				</div> 
			</div>
		
			<script>	
				/* 우편번호 찾기 api */
				function execPostCode${userlist.user_no}() {
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
				           console.log(data.zonecode);
				           console.log(fullRoadAddr);
				           
				           
				           $("#${userlist.user_no}user_address1").val(data.zonecode);
				           $("#${userlist.user_no}user_address2").val(fullRoadAddr);
				           
				           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
				       }
				    }).open();
				}
				
				/* 모달에 완료버튼 액션 - 정규식으로 비번, 이름 체크하고 이상없으면 url에 수정 정보 붙여서 보내기 */
				function test3${userlist.user_no}(){
					var test1 = $('#${userlist.user_no}user_pw').val();
					var test2 = $('#${userlist.user_no}user_name').val();
					if(!regex.test(test1)){
						alert('암호 오류');
					}else if(!regex2.test(test2)){
						alert('이름 오류');
					}else{
						location.href = "http://localhost:9009/usermodify?user_no=" + 
									${userlist.user_no} + "&user_email=" + 
									$('#${userlist.user_no}user_email').val() + "&user_pw=" + 
									$('#${userlist.user_no}user_pw').val() + "&user_name=" + 
									$('#${userlist.user_no}user_name').val() + "&user_phone=" + 
									$('#${userlist.user_no}user_phone').val() + "&user_address=" + 
									$('#${userlist.user_no}user_address1').val() + "," + $('#${userlist.user_no}user_address2').val();
						 
					}
				}
				
				/* 수정버튼, 취소버튼 액션 - 모달 열고 닫기 */
				$(document).ready(function(){
					$("#${userlist.user_no}edit").on("click", function(){
						$("#${userlist.user_no}modal1").fadeIn(); 
					});
					$(".modal_cancel").on("click", function(){
						$("#${userlist.user_no}modal1").fadeOut(); 
					});
				});	
				
				/* 삭제 버튼 눌렀을때 액션 - url에 해당 유저 정보 붙여서 보내서 삭제*/
				$(document).ready(function(){
					$("#${userlist.user_no}delete").on("click", function(){
						$(location).attr("href", "http://localhost:9009/userdelete?user_no=" + ${userlist.user_no});
					});
				});
			</script>
	</c:forEach>
</table>

</body>
</html>