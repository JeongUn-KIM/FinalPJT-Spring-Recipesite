<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="/static/jquery-3.2.1.min.js"></script>
<style>
#emotion_q, #emotion_a, #nation_q, #nation_a ,#cate_q ,#cate_a, #ingredient_q, #ingredient_a, .btn {display:none;}

</style>
<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

<form action="/recipewrite" method="post" enctype="multipart/form-data" name="frm" onsubmit="return find()">
<table border="1">
<tr><td><input type="button" id="find" value="레시피를 추천받고 싶나요?"></td></tr>

	<tr>
		<th id="emotion_q">오늘 기분이 어때요?</th>
	</tr>
	<tr>
		<td id="emotion_a">
		<input class="emotion" type="radio" id="recipe_emotion" name="recipe_emotion" value="좋음">😀
		<input class="emotion" type="radio" name="recipe_emotion" value="보통">😐
		<input class="emotion" type="radio" name="recipe_emotion" value="슬픔">😥
		<input class="emotion" type="radio" name="recipe_emotion" value="화남">🤬
		<input class="emotion" type="radio" name="recipe_emotion" value="아픔">😷
		</td>
	</tr>
	<tr>
		<th id="nation_q">어떤 종류의 음식이 드시고 싶은가요?</th>
	</tr>
	<tr>
		<td id="nation_a">
		<input class="nation" type="radio" id="recipe_nation" name="recipe_nation" value="한식">한식
		<input class="nation" type="radio" name="recipe_nation" value="일식">일식
		<input class="nation" type="radio" name="recipe_nation" value="양식">양식
		<input class="nation" type="radio" name="recipe_nation" value="중식">중식
		<input class="nation" type="radio" name="recipe_nation" value="">상관없어요
		</td>
	</tr>
	<tr>
		<th id="cate_q">가지고 계신 재료가 있나요?</th>
	</tr>
	<tr>
		<td id="cate_a">
		<input class="cate" type="radio" id="recipe_cate" name="recipe_cate" value="육류">육류
		<input class="cate" type="radio" name="recipe_cate" value="해물류">해물류
		<input class="cate" type="radio" name="recipe_cate" value="채소류">채소류
		<input class="cate" type="radio" name="recipe_cate" value="달걀유제품류">달걀/유제품류
		<input class="cate" type="radio" name="recipe_cate" value="">상관없어요
		</td>
	</tr>
	<tr>
		<th id="ingredient_q">못먹는 재료가 있나요?</th>
	</tr>
	<tr>
		<td id="ingredient_a">
		<input class="ingredient" type="checkbox" name="ingredient" value="땅콩">땅콩
		<input class="ingredient" type="checkbox" name="ingredient" value="대두">대두
		<input class="ingredient" type="checkbox" name="ingredient" value="유제품">유제품
		<input class="ingredient" type="checkbox" name="ingredient" value="갑각류조개류">갑각류/조개류
		<input class="ingredient" type="checkbox" name="ingredient" value="생선">생선
		<input class="ingredient" type="checkbox" name="ingredient" value="밀">밀
		</td>
	</tr>
</table>
	<input class="btn" type="submit" value="Find Recipe">
</form>
</body>
<script type="text/javascript">
//재료 선택 팝업창

	$(function(){
		$("#find").click(function(){
			$("#emotion_q").fadeIn();
			setTimeout(function(){$("#emotion_a").fadeIn();}, 1000);
		});
		$(".emotion").click(function(){
			$("#nation_q").fadeIn();
			setTimeout(function(){$("#nation_a").fadeIn();}, 1000);
		});
		$(".nation").click(function(){
			$("#cate_q").fadeIn();
			setTimeout(function(){$("#cate_a").fadeIn();}, 1000);
		})
		$(".cate").click(function(){
			$("#ingredient_q").fadeIn();
			setTimeout(function(){$("#ingredient_a").fadeIn();}, 1000);
		})
		$(".ingredient").click(function(){
			$(".btn").fadeIn();
		})
	})
</script>
</html>