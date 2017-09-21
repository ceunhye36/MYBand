<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->

<!DOCTYPE html>
<html lang="ko">
<head>

<title>MyPage</title>

<meta content="charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- IE최신 표준 모드로 렌더링해라 -->
<meta name="viewport" content="width=device-width, initial-scale=1"><!-- 반응형으로 디자인하기 위해 viewport 설정 -->

<link rel="stylesheet" href="/css/bootstrap.min.css"><!-- bootstrap.css를 연결 bootstrap.min.css는 bootstrap.css를 축소(minify)한것 -->

<!-- bootstrap CDN 이용하기 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->

<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]--> <!-- IE9미만 버전으로 접속 했을때 HTML5와 Media Query지원을 위해 스크립트를 연결 -->


<style>
    .carousel-inner img {
      width: 100%; /* Set width to 100% */
      min-height: 200px;
    }

    /* Hide the carousel text when the screen is less than 600 pixels wide */
    @media (max-width: 600px) {
      .carousel-caption {
        display: none; 
      }
    }
    
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<jsp:include page="/jsp/template/header.jsp" />

<!-- 내용 시작 -->
<div class="container-fluid" style="padding-top: 50px; min-height: 480px;">
  <div class="row content" style="padding-right: 1%;"><!--  hidden-xs -->
    <div class="col-sm-3 sidenav hidden-xs"  style="width:15%; top: 50px;position: fixed;">
      <h2>MyPage</h2>
      <ul class="nav nav-pills nav-stacked">
        <li><a href="/jsp/user/myinfo.jsp">MyInfo</a></li>
        <li><a href="/jsp/user/myband.jsp">MyBand</a></li>
        <li class="active"><a href="/jsp/user/calendar.jsp">Calendar</a></li>
      </ul><br>
    </div>
    
     <div class="col-sm-3 sidenav visible-xs" >
      <h2>MyPage</h2>
      <ul class="nav nav-pills nav-stacked">
        <li><a href="/jsp/user/myinfo.jsp">MyInfo</a></li>
        <li><a href="/jsp/user/myband.jsp">MyBand</a></li>
        <li class="active"><a href="/jsp/user/calendar.jsp">Calendar</a></li>
      </ul><br>
    </div>
    <br>
    
    <div class="col-sm-9 col-sm-offset-2" >
    </div>
  </div>
</div>

<!-- 내용 끝 -->

<jsp:include page="/jsp/template/footer.jsp" />

</body>
</html>