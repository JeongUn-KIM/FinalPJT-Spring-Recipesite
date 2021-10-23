<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/static/jquery-3.2.1.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

<!-- 필터 -->
<form id="condition" name="recipelist_page" action="/recipelist">
	<input type="hidden" name="nation" value="">
	<input type="hidden" name="ingred" value="">
	<input type="hidden" name="emotion" value="">
</form>
<table border="1">
	<tr>
		<th>
			<span>종류별</span><br>
			<span>재료별</span><br>
			<span>기분별</span>
		</th>
		<td>
			<a href="javascript:goSearchRecipe('nation','')">전체</a> &nbsp;/ <a href="javascript:goSearchRecipe('nation','1')">한식</a> &nbsp;&nbsp;&nbsp;/ <a href="javascript:goSearchRecipe('nation','2')">일식</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/ <a href="javascript:goSearchRecipe('nation','3')">양식</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/ <a href="javascript:goSearchRecipe('nation','4')">중식</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/ <a href="javascript:goSearchRecipe('nation','5')">기타</a><br>
			<a href="javascript:goSearchRecipe('ingred','')">전체</a> &nbsp;/ <a href="javascript:goSearchRecipe('ingred','1')">육류</a> &nbsp;&nbsp;&nbsp;/ <a href="javascript:goSearchRecipe('ingred','2')">채소류</a> &nbsp;&nbsp;/ <a href="javascript:goSearchRecipe('ingred','3')">해물류</a> &nbsp;&nbsp;&nbsp;/ <a href="javascript:goSearchRecipe('ingred','4')">달걀/유제품</a> / <a href="javascript:goSearchRecipe('ingred','5')">기타</a><br>
			<a href="javascript:goSearchRecipe('emotion','')">전체</a> &nbsp;/ <a href="javascript:goSearchRecipe('emotion','1')">좋아요</a> / <a href="javascript:goSearchRecipe('emotion','2')">별로예요</a> / <a href="javascript:goSearchRecipe('emotion','3')">평범해요</a> / <a href="javascript:goSearchRecipe('emotion','4')">추천해주세요</a>
		</td>
	</tr>
</table>

<!-- 게시물 띄우기 + 검색 -->
<table id ="more_list">
<c:choose>
<c:when test="${recipelist_search eq null and empty recipelist_search }">
	<c:forEach items="${recipelist }" var="recipe">
		<tr>
			<td><a href="/recipedetail?no=${recipe.recipe_no }"><img src="/upload/${recipe.recipe_img }"></a></td>
			<td><a href="/recipedetail?no=${recipe.recipe_no }">${recipe.recipe_title }</a></td>
		</tr>
	</c:forEach>
</c:when>
<c:when test="${ recipelist_search ne null and empty recipelist_search}">
	<c:forEach items="${recipelist_search }" var="recipe">
		<tr>
			<td><a href="/recipedetail?no=${recipe.recipe_no }"><img src="/upload/${recipe.recipe_img }"></a></td>
			<td><a href="/recipedetail?no=${recipe.recipe_no }">${recipe.recipe_title }</a></td>
		</tr>
	</c:forEach>
</c:when>
<c:when test="${ recipelist_search ne null and not empty recipelist_search}">
	<c:forEach items="${recipelist_search }" var="recipe">
		<tr>
			<td><a href="/recipedetail?no=${recipe.recipe_no }"><img src="/upload/${recipe.recipe_img }"></a></td>
			<td><a href="/recipedetail?no=${recipe.recipe_no }">${recipe.recipe_title }</a></td>
		</tr>
	</c:forEach>
</c:when>
</c:choose>
	<!-- 찜기능 -->
</table>
	<!-- 글 더보기 기능 -->
<div>
	<a id="more_list_btn" href="javascript:moreContent();">더보기</a>
</div>


<form action="/recipelist" onSubmit="return form_submit()">
<select name="type">
	<option value="recipe_title">레시피 제목</option>
	<option value="recipe_desc">레시피 내용</option>
	<option value="recipe_name">음식명</option>
	<option value="recipe_ingredient">재료명</option>
	<option value="recipe_nation">종류(ex:한식)</option>
</select>
<input type="search" id="search" name="search">
<input type="submit" value="검색">
</form>


<!-- 로그인 하지 못하면 글 작성 버튼 안보이도록 -->
<c:if test="${not empty login_info.user_email }">
	<li style="list-style: none"><a class="btn" href="/recipewrite">작성</a></li>
</c:if>
</body>
<script>
function goSearchRecipe(kinds, val){
	$("#condition [name='emotion']").val(${emotion})
	$("#condition [name='ingred']").val(${ingred})
	$("#condition [name='nation']").val(${nation})
	$("#condition [name='" + kinds + "']").val(val);
	$("#condition").submit();
}


function form_submit(){
	if($("#search").val().length > 1){
		return true;
	}
	else {
		alert("두 글자 이상 검색할 수 있습니다!")
		return false;
	}
}

function moreContent(){
	$.ajax({
		url: "/recipelist",
		type:"post",
		dataType:'json',
		data:{"number": 6},
		success:function(data){
			var content ="";
			for(var i=0 ; i<data.length ; i++){
				content +=
				"<tr>" +
					"<td><a href='/recipedetail?no=" + data[i].recipe_no + "'><img src='/upload/" + data[i].recipe_img1 + "'></a></td>" +
					"<td><a href='/recipedetail?no=" + data[i].recipe_no + "'>" + data[i].recipe_title + "</a></td>" +
				"</tr>";
			}
			content += 
				"<div>" +
					"<a id='more_btn' href='javascript:moreContent();'>더보기</a>" +
				"</div>";
			
				$(content).appendTo("#more_list");
		}
		
	})
}
</script>
</html>