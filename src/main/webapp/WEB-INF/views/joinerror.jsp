<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인증 실패</title>
    
   <link href="mainassets/assets/css/theme.css" rel="stylesheet" />
    
	<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="adminassets/css/bootstrap.css">
    <link rel="stylesheet" href="adminassets/vendors/simple-datatables/style.css">
    <link rel="stylesheet" href="adminassets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="adminassets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="adminassets/css/app.css">
    <link rel="shortcut icon" href="imgs/logo.ico" type="image/x-icon">
</head>

<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include><br>
   
   

    <div id="error">
        <div class="error-page container">
<div class="page-heading" style="margin-top:90px;"> 
    <div class="col-lg-7 mx-auto text-center mb-4" style="background-color:#fff;border-radius:2rem;padding:1.5rem; ">
            
                
                <div class="text-center">

                    <h1 class="error-title">이메일 인증 실패</h1>
                   <h3 class="fw-bold fs-3 fs-lg-5 lh-sm mb-1"> <p class="fs-5 text-gray-600">회원가입시 이메일 인증을 먼저 해주시길 바랍니다!!!!!!!!!</p></h3>
                    <a href="/main" class="btn btn-lg btn-outline-primary mt-3">홈으로</a>
                </div>
            </div>
        </div>
</div>
</div>

    </div>
</body>

</html>