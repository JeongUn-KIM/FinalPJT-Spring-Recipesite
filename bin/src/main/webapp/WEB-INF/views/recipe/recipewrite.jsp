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
%>
<form action="/recipewrite" method="post" enctype="multipart/form-data">
<!-- 보낼것 1. 내용 -->
<table>
<input type="hidden" name="user_no" value="<%=User_no%>">
	<tr>
		<th>제목</th>
		<td><input type="text" name="recipe_title" ></td>
	</tr>
	<tr>
		<th>음식 이름</th>
		<td><input type="text" name="recipe_name" ></td>
	</tr>
	<tr>
		<th>사진1</th>
		<td>
		<input type="file" name="recipe_img1" id="recipe_img1" onchange="view(event, 'img1');">
		<div id="img1"></div>
		</td>
		<th>레시피 내용1</th>
		<td><textarea rows="5" cols="50" name="recipe_desc"></textarea></td>
	</tr>
		<tr>
		<th>사진2</th>
		<td>
		<input type="file" name="recipe_img2" id="recipe_img2" onchange="view(event, 'img2')">
		<div id="img2"></div>
		</td>
		<th>레시피 내용2</th>
		<td><textarea rows="5" cols="50" name="recipe_desc"></textarea></td>
	</tr>
		<tr>
		<th>사진3</th>
		<td>
		<input type="file" name="recipe_img3" id="recipe_img3" onchange="view(event, 'img3')">
		<div id="img3"></div>
		</td>
		<th>레시피 내용3</th>
		<td><textarea rows="5" cols="50" name="recipe_desc"></textarea></td>
	</tr>
		<tr>
		<th>사진4</th>
		<td>
		<input type="file" name="recipe_img4" id="recipe_img4" onchange="view(event, 'img4')">
		<div id="img4"></div>
		</td>
		<th>레시피 내용4</th>
		<td><textarea rows="5" cols="50" name="recipe_desc"></textarea></td>
	</tr>
		<tr>
		<th>사진5</th>
		<td>
		<input type="file" name="recipe_img5" id="recipe_img5" onchange="view(event, 'img5')">
		<div id="img5"></div>
		</td>
		<th>레시피 내용5</th>
		<td><textarea rows="5" cols="50" name="recipe_desc"></textarea></td>
	</tr>
		<tr>
		<th>사진6</th>
		<td>
		<input type="file" name="recipe_img6" id="recipe_img6" onchange="view(event, 'img6')">
		<div id="img6"></div>
		</td>
		<th>레시피 내용6</th>
		<td><textarea rows="5" cols="50" name="recipe_desc"></textarea></td>
	</tr>
		<tr>
		<th>사진7</th>
		<td>
		<input type="file" name="recipe_img7" id="recipe_img7" onchange="view(event, 'img7')">
		<div id="img7"></div>
		</td>
		<th>레시피 내용7</th>
		<td><textarea rows="5" cols="50" name="recipe_desc"></textarea></td>
	</tr>
		<tr>
		<th>사진8</th>
		<td>
		<input type="file" name="recipe_img8" id="recipe_img8" onchange="view(event, 'img8')">
		<div id="img8"></div>
		</td>
		<th>레시피 내용8</th>
		<td><textarea rows="5" cols="50" name="recipe_desc"></textarea></td>
	</tr>
		<tr>
		<th>사진9</th>
		<td>
		<input type="file" name="recipe_img9" id="recipe_img9" onchange="view(event, 'img9')">
		<div id="img9"></div>
		</td>
		<th>레시피 내용9</th>
		<td><textarea rows="5" cols="50" name="recipe_desc"></textarea></td>
	</tr>
		<tr>
		<th>사진10</th>
		<td>
		<input type="file" name="recipe_img10" id="recipe_img10" onchange="view(event, 'img10')">
		<div id="img10"></div>
		</td>
		<th>레시피 내용10</th>
		<td><textarea rows="5" cols="50" name="recipe_desc"></textarea></td>
	</tr>
	<tr>
		<th>분류</th>
		<td>
		<input type="radio" name="recipe_cate" value="meat">육류
		<input type="radio" name="recipe_cate" value="seafood">해물류
		<input type="radio" name="recipe_cate" value="vegetable">채소류
		<input type="radio" name="recipe_cate" value="dairy">달걀/유제품류
		<input type="radio" name="recipe_cate" value="etc">기타
		</td>
	</tr>
	<tr>
		<th>재료</th>
		<td>
		<div class="a">
			<button class="openingred" type="button">재료 선택</button>
			<div class="modal" >
				<div class="modalbox">
				<!-- 보낼것 2. 재료 -->
				<c:forEach items="${column_namelist }" var="ingred_name">
					<input type="checkbox" name="${ingred_name }" value="1">${ingred_name }
					<input type="hidden" name="${ingred_name }" value="0">
				</c:forEach>
				<!-- 모달 박스 안에서 검색 기능을 만들 수 있을까? -->
				</div>
				<button class="closeingred" type="button">재료 저장</button>
			</div>
		</div>
		</td>
	</tr>
	<tr>
		<th>이런 감정일 때 먹으면 좋아요</th>
		<td>
		<input type="radio" name="recipe_emotion" value="good">좋아요
		<input type="radio" name="recipe_emotion" value="notgood">별로예요
		<input type="radio" name="recipe_emotion" value="normal">평범해요
		</td>
	</tr>
</table>
	<input type="submit" value="저장">
</form>

<script type="text/javascript">
	$(function(){
		$(".openingred").click(function(){
			$(".modal").fadeIn();
		});
		
		$(".closeingred").click(function(){
			$(".modal").fadeOut();
		})
		
	})
	//레시피 사진 미리보기
	function view(event, img){
		var reader = new FileReader();
		var img_name = img;
		reader.onload = function(event){
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result); 
			document.querySelector("div#"+img_name).appendChild(img);
		}
		reader.readAsDataURL(event.target.files[0]);
	}
</script>

</body>
</html>