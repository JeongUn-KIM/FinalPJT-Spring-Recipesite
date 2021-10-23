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
<!-- 1. recipe_title, recipe_name, 사진, recipe_date, recipe_emotion  -->
<table>
	<tr>
		<th>작성 시간</th>
		<td>${recipe.recipe_date }</td>
	</tr>
		<tr>
		<th>썸네일</th>
		<td>
		<img src="upload/${recipe.recipe_img}">
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${recipe.recipe_title }</td>
	</tr>
	<tr>
		<th>음식 이름</th>
		<td>${recipe.recipe_name }</td>
	</tr>
	<tr>
		<th>음식 설명</th>
		<td>${desc.recipe_desc }</td>
	</tr>
	<!-- 분류 -->
	<tr>
		<th>분류</th>
		<td>
		${recipe.recipe_cate }
		</td>
	</tr>
	
<!-- 재료 -->
	<tr>
		<th>재료</th>
		<td>
		${recipe.recipe_ingredient }
		</td>
	</tr>
	
<!-- 감정 -->
	<tr>
		<th>이런 감정일 때 먹으면 좋아요</th>
		<td>
		${recipe.recipe_emotion }
		</td>
	</tr>
<!-- 사진 및 레시피 내용 -->
	<tr>
		<th>1</th>
		<td>
		<img src="upload/${img.recipe_img1}">
		</td>
		<th></th>
		<td>${desc.recipe_desc1}</td>
	</tr>
	<c:if test="${!empty img.recipe_img2 }">
		<tr>
			<th>2</th>
			<td>
			<img src="upload/${img.recipe_img2}">
			</td>
			<th></th>
			<td>${desc.recipe_desc2}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img3 }">
		<tr>
			<th>3</th>
			<td>
			<img src="upload/${img.recipe_img3}">
			</td>
			<th></th>
			<td>${desc.recipe_desc3}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img4 }">
		<tr>
			<th>4</th>
			<td>
			<img src="upload/${img.recipe_img4}">
			</td>
			<th></th>
			<td>${desc.recipe_desc4}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img5 }">
		<tr>
			<th>5</th>
			<td>
			<img src="upload/${img.recipe_img5}">
			</td>
			<th></th>
			<td>${desc.recipe_desc5}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img6 }">
		<tr>
			<th>6</th>
			<td>
			<img src="upload/${img.recipe_img6}">
			</td>
			<th></th>
			<td>${desc.recipe_desc6}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img7 }">
		<tr>
			<th>7</th>
			<td>
			<img src="upload/${img.recipe_img7}">
			</td>
			<th></th>
			<td>${desc.recipe_desc7}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img8 }">
		<tr>
			<th>8</th>
			<td>
			<img src="upload/${img.recipe_img8}">
			</td>
			<th></th>
			<td>${desc.recipe_desc8}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img9 }">
		<tr>
			<th>9</th>
			<td>
			<img src="upload/${img.recipe_img9}">
			</td>
			<th></th>
			<td>${desc.recipe_desc9}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img10 }">
		<tr>
			<th>10</th>
			<td>
			<img src="upload/${img.recipe_img10}">
			</td>
			<th></th>
			<td>${desc.recipe_desc10}</td>
		</tr>
	</c:if>

</table>
<div>
	<a href="/recipelist">목록</a>
	<!-- session user no랑 비교해서 글 안에서 수정 삭제 버튼 생기기 -->
	<c:if test="${login_info.user_no eq recipe.user_no}">
		<a class="btn" href="/recipemodify?recipe_no=${recipe.recipe_no }">수정</a>
		<a class="btn" href="javascript:goDelete()">삭제</a>
	</c:if>
</div>
<script>
function goDelete(){
	if(confirm("정말 삭제하시겠습니까?")){
		alert("글을 삭제하였습니다.");
		location.replace("/recipelist");
	}
}
</script>
</body>
</html>