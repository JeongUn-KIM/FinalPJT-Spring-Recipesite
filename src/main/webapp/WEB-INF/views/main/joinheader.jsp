<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<script src="/static/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function lo() {
	$("#btn_login").on("click", function login(){
		if($('#user_email').val() ==''){
			alert('아이디를 입력하세요!');
			$('#user_email').focus();
			return;
		} else if($('#user_pw').val() ==''){
			alert('비밀번호를 입력하세요!');
			$('#user_pw').focus();
			return;
		}
		
		$.ajax({
			type: 'post',
			url :'header',
			data:{ user_email:$("#user_email").val(), user_pw:$("#user_pw").val()},
			success: function(server){
				if(server=="true"){
				
					location.reload();
				}else{
					alert("아이디나 비밀번호가 일치하지 않습니다.");
					$("#user_email").focus();
				}
			},
			error: function(req, text) {
				 alert(text + ': ' + req.status);
		 	}
		});
	})
	/* email 텍스트에서 엔터치면 password 포커스 */
	$("#user_email").keydown(function(key){
		if(key.keyCode==13){
			$("#user_pw").focus();
		}
	})
	
	/* password에서 엔터치면 로그인 버튼 클릭 */
	$("#user_pw").keydown(function(key){
		if(key.keyCode==13){
			$("#btn_login").click();
		}
	})
});


$(document).ready(function(){
	$("#btn_logout").on("click", function(){
		$.ajax({
			type:"post",
			url:"logout",
			success:function(){
				location.reload();
				location.href = "/main";
			}
		})
	});
});

</script>
  <body>
     
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" data-navbar-on-scroll="data-navbar-on-scroll" style="z-index:2;">
        <div class="container"><a class="navbar-brand d-inline-flex" href="/main"><span class="text-1000 fs-3 fw-bold ms-2 text-gradient mt-3">오늘 뭐 해먹지?</span></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"> </span></button>
          <div class="collapse navbar-collapse border-lg-0 my-2 mt-lg-0" id="navbarSupportedContent">
            <div class="ms-auto">
				<div class="btn-group"><a href="#"><i class="fas fa-comment-medical fa-2x text-warning input-box-icon"></i></a></div>&emsp;
              <button class="btn btn-white shadow-warning text-warning" type="button" onclick="location.href='/noticelist'">공지사항</button>
              <button class="btn btn-white shadow-warning text-warning" type="button" onclick="location.href='/recipelist'">레시피 게시판</button>&emsp;&emsp;
            
          	</div>
          </div>
        </div>
      </nav>



</head>


    
  </body>

</html>