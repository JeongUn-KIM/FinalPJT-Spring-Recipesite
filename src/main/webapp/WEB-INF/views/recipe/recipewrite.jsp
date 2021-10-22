<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import ="main.UserVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/static/jquery-3.2.1.min.js"></script>
<style type="text/css">
.modal{ position:absolute; width:50%; height:50%; background: rgba(0,0,0,0.8); top:0; left:10;display:none;  }
.modalbox{ border: 1px solid; top: 10; bottom: 10;}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<%
UserVO vo = (UserVO)session.getAttribute("login_info");
int User_no = vo.getUser_no();

String[] ingredient = {"소고기","돼지고기", "닭고기", "양고기", "무슨고기"};
%>
<!-- onsubmit에서 send() 함수 return값이 false가 되면 submit이 실행이 안됨 이걸 이용해서 안쓴 내용 말해주기-->
<form action="/recipewrite" method="post" enctype="multipart/form-data" name="frm" onsubmit="return send()">
<!-- 보낼것 1. 내용 -->
<table>
<input type="hidden" name="user_no" value="<%=User_no%>">
	<tr>
		<th>제목</th>
		<td><input type="text" name="recipe_title" id="recipe_title"></td>
	</tr>
	<tr>
		<th>썸네일 사진</th>
		<td>
		<input type="file" name="recipe_img" id="recipe_img" accept="image/*" onchange="view(event, 'img');">
		<div id="img"></div>
		</td>
	</tr>
	<tr>
		<th>음식 이름</th>
		<td><input type="text" name="recipe_name" id="recipe_name"></td>
	</tr>
	<tr>
		<th>음식 설명</th>
		<td><textarea rows="5" cols="50" name="recipe_desc" id="recipe_desc"></textarea></td>
	</tr>
<!-- 분류 -->
	<tr>
		<th>분류</th>
		<td>
		<input type="radio" id="recipe_cate" name="recipe_cate" value="육류">육류
		<input type="radio" name="recipe_cate" value="해물류">해물류
		<input type="radio" name="recipe_cate" value="채소류">채소류
		<input type="radio" name="recipe_cate" value="달걀유제품류">달걀/유제품류
		<input type="radio" name="recipe_cate" value="기타">기타
		</td>
	</tr>
<!-- 종류 -->
	<tr>
		<th>음식 종류</th>
		<td>
		<input type="radio" id="recipe_nation" name="recipe_nation" value="한식">한식
		<input type="radio" name="recipe_nation" value="일식">일식
		<input type="radio" name="recipe_nation" value="양식">양식
		<input type="radio" name="recipe_nation" value="중식">중식
		<input type="radio" name="recipe_nation" value="기타">기타
		</td>
	</tr>
<!-- 팝업창 재료 -->
	<tr>
		<th>재료</th>
		<td>
		<div class="a">
			<button class="openingred" type="button" id="ingredient">재료 선택</button>
			<div class="modal" >
				<div class="modalbox">
				<!-- 보낼것 2. 재료 -->
				<c:forEach items="<%=ingredient%>" var="ingred">
					<input type="checkbox" name="ingredient" value="${ingred }">${ingred }
				</c:forEach>
				<!-- 모달 박스 안에서 검색 기능을 만들 수 있을까? -->
				</div>
				<button class="closeingred" type="button">재료 저장</button>
			</div>
		</div>
		</td>
	</tr>
	
<!-- 감정 -->
	<tr>
		<th>이런 감정일 때 먹으면 좋아요</th>
		<td>
		<input type="radio" id="recipe_emotion" name="recipe_emotion" value="좋음">좋아요
		<input type="radio" name="recipe_emotion" value="보통">보통이예요
		<input type="radio" name="recipe_emotion" value="안좋음">별로예요
		</td>
	</tr>
	
<!-- 사진 첨부 및 레시피 내용 적기 -->
<!-- 더보기 기능 완성되면 여기에도 적용할 예정임 -->

	<tr>
		<th>사진1</th>
		<td>
		<input type="file" name="recipe_img" accept="image/*" id="recipe_img1" onchange="view(event, 'img1');">
		<div id="img1"></div>
		</td>
		<th>레시피 내용1</th>
		<td><textarea rows="5" cols="50" id="recipe_desc1" name="recipe_desc"></textarea></td>
	</tr>
<c:forEach var="i" begin="2" end="10">
	<tr>
		<th>사진${i }</th>
		<td>
		<input type="file" name="recipe_img" accept="image/*" onchange="view(event, 'img${i }');">
		<div id="img${i }"></div>
		</td>
		<th>레시피 내용${i }</th>
		<td><textarea rows="5" cols="50" name="recipe_desc"></textarea></td>
	</tr>
</c:forEach>

</table>
<!-- 저장이 완료되었습니다 함수 만들기 -->
	<input type="submit" value="저장">
	<a href="/recipelist">취소</a>
</form>

<script type="text/javascript">
//재료 선택 팝업창
	$(function(){
		$(".openingred").click(function(){
			$(".modal").fadeIn();
		});
		
		$(".closeingred").click(function(){
			$(".modal").fadeOut();
		})
		
	})
	//파일 확장자 제한, 사이즈 제한
	$(document).ready(function(){
		
	})
	//레시피 사진 미리보기
	function view(event, img_name){
		var reader = new FileReader();
		reader.onload = function(event){
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result);
			$("div#"+img_name).empty();
			document.querySelector("div#"+img_name).appendChild(img);
		}
		reader.readAsDataURL(event.target.files[0]);
	}
	//정규식
	function send(){
		//제목	
		const title = document.getElementById('recipe_title').value;
		const regex1 = /^.{3,}$/;
		if(regex1.test(title) == false) {
			alert("제목은 3글자 이상 작성해주세요")
			$("#recipe_title").focus();
			return false;
		}
		//썸네일 사진
		const img = document.getElementById('recipe_img').value;
		const regex6 = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;
		if(!img) {
			alert("썸네일 사진은 넣어주세요")
			$("#recipe_img").focus();
			return false;
		}
		else if(!regex6.test(img)){
			alert("해당 파일은 이미지 파일이 아닙니다");
		}
		//음식이름
		const name = document.getElementById('recipe_name').value;
		const regex2 = /^.{1,}$/;
		const regex3 = /^[가-힣]+$/;
		if(regex2.test(name) == false) {
			alert("음식 이름은 1글자 이상 작성해주세요")
			$("#recipe_name").focus();
			return false;
		}
		else if(regex3.test(name) == false) {
			alert("음식 이름은 한글로만 작성해주세요")
			$("#recipe_name").focus();
			return false;
		}
		//음식설명
		const desc = document.getElementById('recipe_desc').value;
		const regex4 = /^.{10,}$/;
		if(regex4.test(desc) == false) {
			alert("음식 설명은 10글자 이상 작성해주세요")
			$("#recipe_desc").focus();
			return false;
		}
		//분류
		let cnt1 = 0;
		const frm = document.frm;
		for(let i=0 ; i<frm.recipe_cate.length ; i++){
			if(frm.recipe_cate[i].checked){
				cnt1++
			}
		}
		if(cnt1 == 0){
			alert("분류는 꼭 선택해주세요.");
			$("#recipe_cate").focus();
			return false;
		}
		//음식 종류
		let cnt2 = 0;
		for(let i=0 ; i<frm.recipe_nation.length ; i++){
			if(frm.recipe_nation[i].checked){
				cnt2++
			}
		}
		if(cnt2 == 0){
			alert("음식종류는 꼭 선택해주세요.");
			$("#recipe_nation").focus();
			return false;
		}
		//재료 선택
		let cnt3 = 0;
		for(let i=0 ; i<frm.ingredient.length ; i++){
			if(frm.ingredient[i].checked){
				cnt3++
			}
		}
		if(cnt3 == 0){
			alert("재료는 1개 이상 선택해주세요.");
			$("#ingredient").focus();
			return false;
		}
		//감정
		let cnt4 = 0;
		for(let i=0 ; i<frm.recipe_emotion.length ; i++){
			if(frm.recipe_emotion[i].checked){
				cnt4++
			}
		}
		if(cnt4 == 0){
			alert("감정 요소는 꼭 선택해주세요.");
			$("#recipe_emotion").focus();
			return false;
		}
		//레시피 사진1
		const img1 = document.getElementById('recipe_img1').value;
		if(!img1) {
			alert("레시피사진1은 넣어주세요")
			$("#recipe_img").focus();
			return false;
		}
		else if(!regex6.test(img1)){
			alert("해당 파일은 이미지 파일이 아닙니다");
		}
		//레시피 설명1
		const desc1 = document.getElementById('recipe_desc1').value;
		const regex5 = /^.{10,}$/;
		if(regex5.test(desc1) == false) {
			alert("레시피 내용1은 10글자 이상 작성해주세요.")
			$("#recipe_desc1").focus();
			return false;
		}
		alert('저장이 완료되었습니다.')
		return true;
	}
</script>

</body>
</html>