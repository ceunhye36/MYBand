<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->
<%@ include file="/ssi.jsp" %>
<%
String b_id = request.getParameter("b_id");
%>
<!DOCTYPE html>
<html lang="ko">
<head>

<title>Band</title>

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
 /* 
    .content div{
    	border: 1px solid;
    }
  */
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<jsp:include page="/jsp/template/header.jsp" />

<!-- 내용 시작 -->
<div class="container-fluid" style="padding-top: 50px; min-height: 480px;">
  <div class="row" style="padding-right: 1%;"><!--  hidden-xs -->
    <div class="col-sm-3 sidenav hidden-xs"  style="width:15%; top: 50px;position: fixed;">
		<jsp:include page="./submenu.jsp"/>      
    </div>
    
     <div class="col-sm-3 sidenav visible-xs" >
      	<jsp:include page="./submenu.jsp"/>   
    </div>
    <br>
    
    <div class="content">
    <div class="col-sm-10 col-sm-offset-2" style="padding:20px 40px;"><h1>Board Read</h1><hr></div>
    <div class="col-sm-9 col-sm-offset-2" style="padding:20px 40px;">
    	<div class="row">
		  <div class="">
		    <label for="inputEmail3" class="col-sm-2 control-label" style="text-align: right;">ID</label>
		    <div class="col-sm-10 well">
		     <div class="row">
		      <div class="col-sm-3">test1</div><div class="col-sm-9"style="text-align:right; margin-right: 0px;">조회수&ensp; 2&ensp;&ensp;&ensp; <a href="./reply_list.jsp" style="color: #333333;">댓글수&ensp; 1</a></div>
			 </div>
		    </div>
		  </div>
		  <div class="">
		    <label for="inputEmail3" class="col-sm-2 control-label" style="text-align: right;">Title</label>
		    <div class="col-sm-10 well">
		      안녕하세요
		    </div>
		  </div>
		  <div class="">
		    <label for="inputPassword3" class="col-sm-2 control-label" style="text-align: right;">Content</label>
		    <div class="col-sm-10 well">
		      <textarea class="form-control" rows="20" placeholder="Content" disabled="disabled" style="cursor: default;">안녕하세요
test1이라고 합니다
반갑습니다.</textarea>
		    </div>
		  </div>
		  <div class="">
		    <label for="inputEmail3" class="col-sm-2 control-label" style="text-align: right;">File</label>
		    <div class="col-sm-10 well">
		      <a href="#">
	           <span class="glyphicon glyphicon-download"></span> ex_file.txt&ensp;&ensp;&ensp;[size : 1000 byte]
	          </a>
		    </div>
		  </div>
		  <div class="">
		  <div class="row">
		    <div class="col-sm-offset-6 col-sm-2" >
		      <button type="button" onclick="location.href='./board_modi.jsp?b_id=<%=b_id %>&site=boardmodi'" class="btn btn-default btn-block">Modification</button>
		    </div>
		    <div class="col-sm-2" >
		      <button type="button" class="btn btn-default btn-block">Delete</button>
		    </div>
		    <div class="col-sm-2" >
		      <button type="button" onclick="location.href='./board_list.jsp?b_id=<%=b_id%>&site=boardlist'" class="btn btn-default btn-block">List</button>
		    </div>
		  </div>
		  </div>
	   </div>
	</div>
	</div>
  </div>
<br>
</div>
  
  
<!-- 내용 끝 -->

<jsp:include page="/jsp/template/footer.jsp" />



</body>
</html>