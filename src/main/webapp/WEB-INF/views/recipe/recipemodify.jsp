<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<%
String[] ingredient = {"소고기","돼지고기","닭고기","양고기","무슨고기"};
%>
<!-- 1. recipe_title, recipe_name, 사진, recipe_date, recipe_emotion  -->
<form action="recipemodify" method="post" enctype="multipart/form-data" onsubmit="return send()">
<table border="1">
	<tr>
		<th>제목</th>
		<td><input type="text" name="recipe_title" id="recipe_title" value="${recipe.recipe_title }"></td>
	</tr>
	<tr>
		<th>썸네일 사진</th>
		<td>
		<input type="file" name="recipe_img" id="recipe_img" accept="image/*" onchange="view(event, 'img');"><br>
		<table border ="1">
			<tr>
			<th>기존 이미지</th>
			<td><img src="upload/${recipe.recipe_img}"></td>
			<input type="hidden" name="img1" value="${recipe.recipe_img }">
			<th>변경 이미지</th>
			<td><div id="img1"></div></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<th>음식 이름</th>
		<td><input type="text" name="recipe_name" value="${recipe.recipe_name }"></td>
	</tr>
	<tr>
		<th>음식 설명</th>
		<td><textarea rows="5" cols="50" name="recipe_desc">${desc.recipe_desc }</textarea></td>
	</tr>
	<!-- 분류 -->
	<tr>
		<th>분류</th>
		<td>
		<input type="radio" name="recipe_cate" id="육류" value="육류">육류
		<input type="radio" name="recipe_cate" id="해물류" value="해물류">해물류
		<input type="radio" name="recipe_cate" id="채소류" value="채소류">채소류
		<input type="radio" name="recipe_cate" id="달걀유제품류" value="달걀유제품류">달걀/유제품류
		<input type="radio" name="recipe_cate" id="기타" value="기타">기타
		</td>
	</tr>
	
<!-- 팝업창 재료 -->
	<tr>
		<th>재료</th>
		<td>
		<div class="a">
			<button class="openingred" type="button">재료 선택</button>
			<div class="modal" >l
				<div class="modalbox">
				<!-- 보낼것 2. 재료 -->
				<c:forEach items="<%=ingredient%>" var="ingred">
					<input type="checkbox" name="ingredient" id="${ingred }" value="${ingred }">${ingred }
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
		<input type="radio" name="recipe_emotion" id="좋음" value="좋음">좋아요
		<input type="radio" name="recipe_emotion" id="보통" value="보통">보통이예요
		<input type="radio" name="recipe_emotion" id="안좋음" value="안좋음">별로예요
		
		</td>
	</tr>
<!-- 사진 및 레시피 내용 -->
		<tr>
			<th>사진1</th>
			<td>
			<input type="file" name="recipe_img" accept="image/*" onchange="view(event, 'img1');"><br>
			<table border ="1">
				<tr>
				<th>기존 이미지</th>
				<td><img src="upload/${img.recipe_img1}"></td>
				<input type="hidden" name="img1" value="${img.recipe_img1 }">
				<th>변경 이미지</th>
				<td><div id="img1"></div></td>
				</tr>
			</table>
			</td>
			<th>레시피 내용1</th>
			<td><textarea rows="5" cols="50" name="recipe_desc">${desc.recipe_desc1}</textarea></td>
		</tr>
		
		<tr>
			<th>사진2</th>
			<td>
			<input type="file" name="recipe_img" accept="image/*" onchange="view(event, 'img2');">
	<c:if test="${!empty img.recipe_img2 }">
			<table border ="1">
				<tr>
				<th>기존 이미지</th>
				<td><img src="upload/${img.recipe_img2}"></td>
				<input type="hidden" name="img2" value="${img.recipe_img2 }">
				<th>변경 이미지</th>
				<td><div id="img2"></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img2"></div>
			</td>
			<th>레시피 내용2</th>
			<td><textarea rows="5" cols="50" name="recipe_desc">${desc.recipe_desc2}</textarea></td>
		</tr>
		
		<tr>
			<th>사진3</th>
			<td>
			<input type="file" name="recipe_img" accept="image/*" onchange="view(event, 'img3');">
	<c:if test="${!empty img.recipe_img3 }">
			<table border ="1">
				<tr>
				<th>기존 이미지</th>
				<td><img src="upload/${img.recipe_img3}"></td>
				<input type="hidden" name="img3" value="${img.recipe_img3 }">
				<th>변경 이미지</th>
				<td><div id="img3"></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img3"></div>
			</td>
			<th>레시피 내용3</th>
			<td><textarea rows="5" cols="50" name="recipe_desc">${desc.recipe_desc3}</textarea></td>
		</tr>
		
		<tr>
			<th>사진4</th>
			<td>
			<input type="file" name="recipe_img" accept="image/*" onchange="view(event, 'img4');">
	<c:if test="${!empty img.recipe_img4 }">
			<table border ="1">
				<tr>
				<th>기존 이미지</th>
				<td><img src="upload/${img.recipe_img4}"></td>
				<input type="hidden" name="img4" value="${img.recipe_img4 }">
				<th>변경 이미지</th>
				<td><div id="img4"></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img4"></div>
			</td>
			<th>레시피 내용4</th>
			<td><textarea rows="5" cols="50" name="recipe_desc">${desc.recipe_desc4}</textarea></td>
		</tr>
		
		<tr>
			<th>사진5</th>
			<td>
			<input type="file" name="recipe_img" accept="image/*" onchange="view(event, 'img5');">
	<c:if test="${!empty img.recipe_img5 }">
			<table border ="1">
				<tr>
				<th>기존 이미지</th>
				<td><img src="upload/${img.recipe_img5}"></td>
				<input type="hidden" name="img5" value="${img.recipe_img5 }">
				<th>변경 이미지</th>
				<td><div id="img5"></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img5"></div>
			</td>
			<th>레시피 내용5</th>
			<td><textarea rows="5" cols="50" name="recipe_desc">${desc.recipe_desc5}</textarea></td>
		</tr>
		
		<tr>
			<th>사진6</th>
			<td>
			<input type="file" name="recipe_img" accept="image/*" onchange="view(event, 'img6');">
	<c:if test="${!empty img.recipe_img6 }">
			<table border ="1">
				<tr>
				<th>기존 이미지</th>
				<td><img src="upload/${img.recipe_img6}"></td>
				<input type="hidden" name="img6" value="${img.recipe_img6 }">
				<th>변경 이미지</th>
				<td><div id="img6"></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img6"></div>
			</td>
			<th>레시피 내용6</th>
			<td><textarea rows="5" cols="50" name="recipe_desc">${desc.recipe_desc6}</textarea></td>
		</tr>
		<tr>
			<th>사진7</th>
			<td>
			<input type="file" name="recipe_img" accept="image/*" onchange="view(event, 'img7');">
	<c:if test="${!empty img.recipe_img7 }">
			<table border ="1">
				<tr>
				<th>기존 이미지</th>
				<td><img src="upload/${img.recipe_img7}"></td>
				<input type="hidden" name="img7" value="${img.recipe_img7 }">
				<th>변경 이미지</th>
				<td><div id="img7"></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img7"></div>
			</td>
			<th>레시피 내용7</th>
			<td><textarea rows="5" cols="50" name="recipe_desc">${desc.recipe_desc7}</textarea></td>
		</tr>
		<tr>
			<th>사진8</th>
			<td>
			<input type="file" name="recipe_img" accept="image/*" onchange="view(event, 'img8');">	
			<c:if test="${!empty img.recipe_img8 }">
			<table border ="1">
				<tr>
				<th>기존 이미지</th>
				<td><img src="upload/${img.recipe_img8}"></td>
				<input type="hidden" name="img8" value="${img.recipe_img8 }">
				<th>변경 이미지</th>
				<td><div id="img8"></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img8"></div>
			</td>
			<th>레시피 내용8</th>
			<td><textarea rows="5" cols="50" name="recipe_desc">${desc.recipe_desc8}</textarea></td>
		</tr>
		<tr>
			<th>사진9</th>
			<td>
			<input type="file" name="recipe_img" accept="image/*" onchange="view(event, 'img9');">
	<c:if test="${!empty img.recipe_img9 }">
			<table border ="1">
				<tr>
				<th>기존 이미지</th>
				<td><img src="upload/${img.recipe_img9}"></td>
				<input type="hidden" name="img9" value="${img.recipe_img9 }">
				<th>변경 이미지</th>
				<td><div id="img9"></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img9"></div>
			</td>
			<th>레시피 내용9</th>
			<td><textarea rows="5" cols="50" name="recipe_desc">${desc.recipe_desc9}</textarea></td>
		</tr>
		<tr>
			<th>사진10</th>
			<td>
			<input type="file" name="recipe_img" accept="image/*" onchange="view(event, 'img10');">
	<c:if test="${!empty img.recipe_img10 }">
			<table border ="1">
				<tr>
				<th>기존 이미지</th>
				<td><img src="upload/${img.recipe_img10}"></td>
				<input type="hidden" name="img10" value="${img.recipe_img10 }">
				<th>변경 이미지</th>
				<td><div id="img10"></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img10"></div>
			</td>
			<th>레시피 내용10</th>
			<td><textarea rows="5" cols="50" name="recipe_desc">${desc.recipe_desc10}</textarea></td>
		</tr>

</table>
<!-- 저장이 완료되었습니다 함수 만들기 -->
	<input type="submit" value="저장">
	<a href="javascript:history.go(-1)">취소</a>
</form>
<script>
//재료 선택 팝업창
$(function(){
	$(".openingred").click(function(){
		$(".modal").fadeIn();
	});
	
	$(".closeingred").click(function(){
		$(".modal").fadeOut();
	})
	
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
//분류 체크 되었던 거 체크
var cate = document.getElementById("${recipe.recipe_cate }");
cate.setAttribute("checked", "checked");

//재료 체크 되었던 거 체크
var arr = "${recipe.recipe_ingredient }".split(",");
for(var i = 0 ; i < arr.length ; i++){
	var ingredient = document.getElementById(arr[i])
	ingredient.setAttribute("checked", "checked");

}
//감정 체크되었던 거 체크
var emotion = document.getElementById("${recipe.recipe_emotion }");
emotion.setAttribute("checked", "checked");



//저장시 호출 함수
function send(){		
	alert('저장이 완료되었습니다.')
}

</script>
</body>
</html>