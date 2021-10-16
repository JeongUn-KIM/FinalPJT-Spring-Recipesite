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
<form id="condition" name="recipelist_page" action="/recipelist">
	<input type="hidden" name="emotion" value="">
	<input type="hidden" name="ingred" value="">

</form>
<!-- 필터 -->
<table border="1">
	<tr>
		<th>
			<span>기분별</span><br>
			<span>재료별</span>
		</th>
		<td>
			<a href="javascript:goSearchRecipe('emotion','')">전체</a> / <a href="javascript:goSearchRecipe('emotion','1')">좋아요</a> / <a href="javascript:goSearchRecipe('emotion','2')">별로예요</a> / <a href="javascript:goSearchRecipe('emotion','3')">평범해요</a> / <a href="javascript:goSearchRecipe('emotion','4')">추천해주세요</a><br>
			<a href="javascript:goSearchRecipe('ingred','')">전체</a> / <a href="javascript:goSearchRecipe('ingred','1')">육류</a> &nbsp;&nbsp;&nbsp;/ <a href="javascript:goSearchRecipe('ingred','2')">채소류</a> &nbsp;&nbsp;/ <a href="javascript:goSearchRecipe('ingred','3')">해물류</a> &nbsp;&nbsp;/ <a href="javascript:goSearchRecipe('ingred','4')">달걀/유제품</a> / <a href="javascript:goSearchRecipe('ingred','5')">기타</a>
		</td>
	</tr>
</table>
<!-- 게시물 -->
<table id ="more_list">
<c:if test="${empty recipelist_search }">
	<c:forEach items="${recipelist }" var="recipe">
		<tr>
			<td><a href="/recipedetail?no=${recipe.recipe_no }"><img src="/upload/${recipe.recipe_img1 }"></a></td>
			<td><a href="/recipedetail?no=${recipe.recipe_no }">${recipe.recipe_title }</a></td>
		</tr>
	</c:forEach>
</c:if>
<c:if test="${not empty recipelist_search }">
	<c:forEach items="${recipelist_search }" var="recipe">
		<tr>
			<td><a href="/recipedetail?no=${recipe.recipe_no }"><img src="/upload/${recipe.recipe_img1 }"></a></td>
			<td><a href="/recipedetail?no=${recipe.recipe_no }">${recipe.recipe_title }</a></td>
		</tr>
	</c:forEach>
</c:if>

	<!-- 찜기능 -->
</table>

	<!-- 글 더보기 기능 -->
<div>
	<a id="more_list_btn" href="javascript:moreContent();">더보기</a>
</div>

<!-- 검색기능 -->
<form action="/recipelist">
<select name="type">
	<option value="recipe_title">제목</option>
	<option value="recipe_desc">내용</option>
	<option value="recipe_title or recipe_desc">제목+내용</option>
</select>
<input type="search" name="search">
<input type="submit" value="검색">
</form>

<!-- 로그인 하지 못하면 글 작성 버튼 안보이도록 -->
<c:if test="${not empty login_info.user_email }">
	<li style="list-style: none"><a class="btn" href="/recipewrite?email=${login_info.user_email }">작성</a></li>
</c:if>
</body>
<script>
function goSearchRecipe(kinds, val){
	
	
	$("#condition [name='emotion']").val(${emotion})
	$("#condition [name='ingred']").val(${ingred})
	$("#condition [name='" + kinds + "']").val(val);
	$("#condition").submit();
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