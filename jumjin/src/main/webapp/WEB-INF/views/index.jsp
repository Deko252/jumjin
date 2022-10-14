<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>점심에 진심인 사람들</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="./resources/assets/img/favicon.png" rel="icon">
  <link href="./resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gugi&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="./resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="./resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="./resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="./resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="./resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="./resources/assets/css/main.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Impact - v1.1.1
  * Template URL: https://bootstrapmade.com/impact-bootstrap-business-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<body>

  <!-- ======= Header ======= -->
 

  <header id="header" class="header d-flex align-items-center">

    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
      <a href="./index.do" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1>점<span>.</span>진<span>.</span>사</h1>
      </a>
      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="./index.do">홈으로</a></li>
          <li><a href="./roulette.do">룰렛돌리기</a></li>
          <li><a href="./ghostLeg.do">사다리타기</a></li>
          <li><a href="./map.do">음식점검색</a></li>
          <li><a href="./board.do">게시판</a></li>
          
          <c:if test="${sessionScope.id eq null }">
	          <li><a href="./login.do">로그인</a></li>
	          <li><a href="./join.do">회원가입</a></li>
          </c:if>
          
          <li class="dropdown">
          	<c:if test="${sessionScope.id ne null }">
          		<a href="#"><span>${sessionScope.id } 님<i class="bi bi-chevron-down dropdown-indicator"></i></span></a>
            		<ul>
		            <li><a href="./index.do">로그아웃</a></li>
		            <li><a href="./info.do">개인정보</a></li>
         		   </ul>
          	</c:if>
          
          </li>
        </ul>
      </nav><!-- .navbar -->

      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

    </div>
  </header><!-- End Header -->
  <!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="hero" style="overflow: visible;">
    <div class="container position-relative">
      <div class="row gy-5" data-aos="fade-in">
        <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center text-center text-lg-start">
          <h2><span>점</span>심에 <span>진</span>심인 <span>사</span>람들</h2>
          <p>뭘 먹을지 고민돼? 돌려봐~~</p>
          <div class="d-flex justify-content-center justify-content-lg-start">
            <a href="https://www.youtube.com/watch?v=9uzDtWkbV8Q&ab_channel=KIGLETV-Mainan%26GameAnak" class="btn-get-started">눌러봐 룰렛</a>
            <a href="https://www.youtube.com/watch?v=sraVn-RE_cE" class="glightbox btn-watch-video d-flex align-items-center"><i class="bi bi-play-circle"></i><span>Watch Video</span></a>
          </div>
        </div>
        <div class="col-lg-6 order-1 order-lg-2">
          <img src="assets/img/hero-img.svg" class="img-fluid" alt="" data-aos="zoom-out" data-aos-delay="100">
        </div>
      </div>
	</div>

    <div class="icon-boxes position-relative">
      <div class="container position-relative">
        <div class="row gy-4 mt-5">

          <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="100">
            <div class="icon-box">
              <div class="icon"><img alt="룰렛" src="./resources/assets/img/roulette.png"></div>
              <h4 class="title"><a href="./roulette.do" class="stretched-link">룰렛돌리기</a></h4>
            </div>
          </div>
          <!--End Icon Box -->

          <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="200">
            <div class="icon-box">
              <div class="icon"><img alt="사다리" src="./resources/assets/img/ladder.png"></div>
              <h4 class="title"><a href="./ghostLeg.do" class="stretched-link">사다리타기</a></h4>
            </div>
          </div>
          <!--End Icon Box -->

          <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="300">
            <div class="icon-box">
              <div class="icon"><img alt="지도" src="./resources/assets/img/spot.png"></div>
              <h4 class="title"><a href="./map.do" class="stretched-link">음식점검색</a></h4>
            </div>
          </div>
          <!--End Icon Box -->

          <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="500">
            <div class="icon-box">
              <div class="icon"><img alt="게시판" src="./resources/assets/img/clipboard.png"></div>
              <h4 class="title"><a href="./board.do" class="stretched-link">게시판</a></h4>
            </div>
          </div>
          <!--End Icon Box -->

        </div>
        </div>
    </div>

  </section>
  <!-- End Hero Section -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
	
	<div class="social-links d-flex mt-4">
            <a href="https://twitter.com/?lang=ko" class="twitter"><i class="bi bi-twitter"></i></a>
            <a href="https://ko-kr.facebook.com" class="facebook"><i class="bi bi-facebook"></i></a>
            <a href="https://www.instagram.com" class="instagram"><i class="bi bi-instagram"></i></a>
            <a href="https://kr.linkedin.com/" class="linkedin"><i class="bi bi-linkedin"></i></a>
    </div>

    <div class="container mt-4">
      <div class="copyright">
        &copy; Copyright <strong><span>JumJin</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/impact-bootstrap-business-website-template/ -->
        Designed by <a href="https://bootstrapmade.com/">JumJin</a>
      </div>
    </div>

  </footer><!-- End Footer -->
  <!-- End Footer -->

  <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="./resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="./resources/assets/vendor/aos/aos.js"></script>
  <script src="./resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="./resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="./resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="./resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="./resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="./resources/assets/js/main.js"></script>

</body>

</html>