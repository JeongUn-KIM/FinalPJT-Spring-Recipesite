<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--    Document Title-->
    <title>오늘 뭐 해먹지?</title>
    <!--    Favicons-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="apple-touch-icon" sizes="180x180" href="/assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="/assets/img/favicons/favicon.ico">
    <link rel="manifest" href="/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">

	<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap" rel="stylesheet">

       
    <link href="/assets/css/theme.css" rel="stylesheet" />




<script type="text/javascript">


/* 키워드 관련 */
$(document).ready(function(){
	$("#btn_search").on("click", function(){
		$(location).attr("href", "http://localhost:9009/search?keyword=" + $("#keyword").val());
	});
});


</script>


</head>


  <body>
	
    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
     
     <jsp:include page="/WEB-INF/views/main/header.jsp"/>
       
      <section class="py-5 overflow-hidden bg-primary" id="home">
        <div class="container">
          <div class="row flex-center">
        
        
         <c:if test="${empty keyword}">   
	         <div class="col-md-5 col-lg-6 order-0 order-md-1 mt-8">
	        	 <a class="img-landing-banner" href=""><img class="img-fluid" src="assets/img/gallery/hero-header.png" alt="hero-header" /></a>
	         </div>
         </c:if>
           
           
            <!-- 레시피 검색 결과 전체 시작 -->
        <c:if test="${!empty keyword}">
        <div class="card col-md-5 col-lg-6 order-0 order-md-1 mt-8" style="background-color: white; flex: 5rem;">
        <div class="container">
          <div class="row h-100">
            
                    
                    <!-- 레시피검색 결과 0일때 -->
                    <c:if test="${fn:length(resultlist) == 0}">
                  	  <div class="col-lg-40 mx-auto text-center mt-7 mb-5">
			              <h5 class="fw-bold fs-3 fs-lg-5 lh-sm">다른 키워드로 검색해 주세요. </h5>
			          </div>
			           <div class="col-12">
			          <div class="carousel slide" id="carouselPopularItems2" data-bs-touch="false" data-bs-interval="false">
			          <div class="carousel-inner">
			          <div class="carousel-item active" data-bs-interval="10000">
		              <div class="row gx-3 h-100 align-items-center">
		              
                    	<div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
                        <div class="card card-span h-100 rounded-3">
                        <img class="img-fluid rounded-3 h-100" src="assets/img/gallery/resultx.png" alt="" />
                          <div class="card-body ps-0">
                            <h5 class="fw-bold text-1000 text-truncate mb-1"> </h5>
                            <div><span class="text-warning me-2"> </span></div>
                          </div>
                        </div>
                      </div>  
                      <div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
                        <div class="card card-span h-100 rounded-3">
                        <img class="img-fluid rounded-3 h-100" src="assets/img/gallery/resultx.png" alt="" />
                          <div class="card-body ps-0">
                            <h5 class="fw-bold text-1000 text-truncate mb-1"> </h5>
                            <div><span class="text-warning me-2"> </span></div>
                          </div>
                        </div>
                      </div>  
                      <div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
                        <div class="card card-span h-100 rounded-3">
                        <img class="img-fluid rounded-3 h-100" src="assets/img/gallery/resultx.png" alt="" />
                          <div class="card-body ps-0">
                            <h5 class="fw-bold text-1000 text-truncate mb-1"> </h5>
                            <div><span class="text-warning me-2"> </span></div>
                          </div>
                        </div>
                      </div>  
                    </c:if>
                    
                    <!-- 레시피검색 결과 0이 아닐때 -->
                    <c:if test="${fn:length(resultlist) != 0}">
                    <div class="col-lg-40 mx-auto text-center mt-7 mb-5">
			           <h5 class="fw-bold fs-3 fs-lg-5 lh-sm">${keyword }관련 레시피 TOP3 </h5>
			        </div>
			        <div class="col-12">
			        <div class="carousel slide" id="carouselPopularItems2" data-bs-touch="false" data-bs-interval="false">
		            <div class="carousel-inner">
               	    <div class="carousel-item active" data-bs-interval="10000">
                    <div class="row gx-3 h-100 align-items-center">
                    
                    <c:forEach items="${resultlist }" var="resultlist" varStatus="status">
                      <div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
                        <div class="card card-span h-100 rounded-3">
                        <img class="img-fluid rounded-3 h-100" src="assets/img/gallery/${resultlist.recipe_img }" alt="" />
                        
                        <div class="card-img-overlay ps-0" style="padding:0rem;">
	                	    <span class="badge bg-danger p-2 mt-0">
	                	    <span class="fs-0">${status.index+1}</span></span>
                	    </div>
                	    
                          <div class="card-body ps-0">
                            <h5 class="fw-bold text-1000 text-truncate mb-1">${resultlist.recipe_title }</h5>
                            <div><span class="text-warning me-2"></span><span class="text-primary">${resultlist.recipe_name }</span></div>
                          </div>
                        </div>
                      </div>
                      
                      <c:if test="${status.index==1 && status.last}">
                      <div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
                        <div class="card card-span h-100 rounded-3">
                        <img class="img-fluid rounded-3 h-100" src="assets/img/gallery/resultx.png" alt="" />
                          <div class="card-body ps-0">
                            <h5 class="fw-bold text-1000 text-truncate mb-1"> </h5>
                            <div><span class="text-warning me-2"> </span></div>
                          </div>
                        </div>
                      </div>  
                      </c:if>
                      
                      <c:if test="${status.index==0 && status.last}">
                      <div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
                        <div class="card card-span h-100 rounded-3">
                        <img class="img-fluid rounded-3 h-100" src="assets/img/gallery/resultx.png" alt="" />
                          <div class="card-body ps-0">
                         	<h5 class="fw-bold text-1000 text-truncate mb-1"> </h5>
                            <div><span class="text-warning me-2"> </span></div>
                            <div><span class="text-warning me-2"> </span></div>
                          </div>
                        </div>
                      </div>  
                      <div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
                        <div class="card card-span h-100 rounded-3">
                        <img class="img-fluid rounded-3 h-100" src="assets/img/gallery/resultx.png" alt="" />
                          <div class="card-body ps-0">
                        	<h5 class="fw-bold text-1000 text-truncate mb-1"> </h5>
                            <div><span class="text-warning me-2"> </span></div>
                            <div><span class="text-warning me-2"> </span></div>
                          </div>
                        </div>
                      </div>  
                      </c:if>
                      
                     </c:forEach>
                      </c:if>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div><!-- end of .container -->
        </div>
        </c:if>
            <!-- 레시피 검색 결과 전체 끝 -->
 
        
        
        <div class="col-md-7 col-lg-6 py-8 text-md-start text-center">
              <h2 class="display-1 fs-md-4 fs-lg-4 fs-xl-4 text-light">드시고 싶은 음식의 키워드를 적어주세요</h2>
              <br>
              <div class="card w-xxl-75">
                <div class="card-body">
                  <div class="tab-content mt-3" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                      <div class="row gx-2 gy-2 align-items-center">
                        <div class="col">
                          <div class="input-group-icon"><i class="fas fa-utensils text-danger input-box-icon"></i>
                            <input class="form-control input-box form-foodwagon-control" id="keyword" type="text" placeholder="재료, 음식명 등..." />
                          </div>
                        </div>
                        <div class="d-grid gap-3 col-sm-auto">
                          <button class="btn btn-danger" type="button" id="btn_search">레시피 찾기</button>
                        </div>
                      </div>
                    </div>
               
                  </div>
                </div>
              </div>
            </div>     
          </div>
        </div>
        
        
        
      </section>
	
      <section class="py-4 overflow-hidden">

        <div class="container">
          <div class="row h-100">
            <div class="col-lg-7 mx-auto text-center mt-7 mb-5">
              <h5 class="fw-bold fs-3 fs-lg-5 lh-sm">화제의 레시피</h5>
            </div>
            <div class="col-12">
              <div class="carousel slide" id="carouselPopularItems" data-bs-touch="false" data-bs-interval="false">
                <div class="carousel-inner">
                
                  <div class="carousel-item active" data-bs-interval="1">
                    <div class="row gx-3 h-100 align-items-center">
                    
                    <c:forEach items="${popularlist }" begin="0" end="4" var="popularlist">
                      <div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
                        <div class="card card-span h-100 rounded-3"><img class="img-fluid rounded-3 h-100" src="assets/img/gallery/${popularlist.recipe_img }" alt="..." />
                          <div class="card-body ps-0">
                            <h5 class="fw-bold text-1000 text-truncate mb-1">${popularlist.recipe_title }</h5>
                            <div><span class="text-warning me-2"></span><span class="text-primary">${popularlist.recipe_name }</span></div>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                    
                    </div>
                  </div>
                  
                  <div class="carousel-item" data-bs-interval="5000">
                    <div class="row gx-3 h-100 align-items-center">
                      
                      <c:forEach items="${popularlist }" begin="5" end="9" var="popularlist">
                      <div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
                        <div class="card card-span h-100 rounded-3"><img class="img-fluid rounded-3 h-100" src="assets/img/gallery/${popularlist.recipe_img }" alt="..." />
                          <div class="card-body ps-0">
                            <h5 class="fw-bold text-1000 text-truncate mb-1">${popularlist.recipe_title }</h5>
                            <div><span class="text-warning me-2"></span><span class="text-primary">${popularlist.recipe_name }</span></div>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                      
                    </div>
                  </div>
                  
                
               
                </div>
                <button class="carousel-control-prev carousel-icon" type="button" data-bs-target="#carouselPopularItems" data-bs-slide="prev"><span class="carousel-control-prev-icon hover-top-shadow" aria-hidden="true"></span><span class="visually-hidden">Previous</span></button>
                <button class="carousel-control-next carousel-icon" type="button" data-bs-target="#carouselPopularItems" data-bs-slide="next"><span class="carousel-control-next-icon hover-top-shadow" aria-hidden="true"></span><span class="visually-hidden">Next </span></button>
              </div>
            </div>
          </div>
        </div><!-- end of .container -->

      </section>
      <!-- <section> close ============================
      ============================================ -->

      <!-- ============================================-->
      <!-- <section> begin ============================-->
      <section class="py-0 pt-7 bg-1000">

        <div class="container">

          <hr class="border border-800" />
          <div class="row flex-center pb-3">
            <div class="col-md-6 order-0">
              <p class="text-200 text-center text-md-start">All rights Reserved &copy; Your Company, 2021</p>
            </div>
            <div class="col-md-6 order-1">
              <p class="text-200 text-center text-md-end"> Made with
                &nbsp;by&nbsp;<a class="text-200 fw-bold" href="https://themewagon.com/" target="_blank">multicampus </a>
              </p>
            </div>
          </div>
        </div><!-- end of .container-->

      </section>
      <!-- <section> close ============================-->
      <!-- ============================================-->


    </main>
    <!-- ===============================================-->
    <!--    End of Main Content-->
    <!-- ===============================================-->




    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="/vendors/@popperjs/popper.min.js"></script>
    <script src="/vendors/bootstrap/bootstrap.min.js"></script>
    <script src="/vendors/is/is.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="/vendors/fontawesome/all.min.js"></script>
    <script src="/assets/js/theme.js"></script>	

<!-- Modal -->
<!-- <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
    
      <div>
		<div class="card-title" style="margin-top:20px;">
			<h2 class="card-title text-center" style="color:#113366;">로 그 인</h2>
		</div>
		<div class="card-body">
	        <input type="text" id="email"  class="form-control" style="padding:0.5rem 0.5rem;" placeholder="아이디" required autofocus><BR>
	        <input type="password" id="pw" class="form-control" style="padding:0.5rem 0.5rem;" placeholder="패스워드" required><br>
	        <div class="d-grid gap-2">
	        	<button id="btn_login" class="btn btn-lg btn-primary btn-block" type="button">로 그 인</button>
	        </div>
		</div>
	</div>
    </div>
  </div>
</div> -->


    
  </body>

</html>