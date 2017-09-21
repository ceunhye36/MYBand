<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->

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
    .reply:HOVER {
    	background-color: #f2f2f2;
		cursor: pointer;
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
      <h2>BAND</h2><h5>_여행가자</h5>
      <ul class="nav nav-pills nav-stacked">
        <li><a href="/jsp/band/bandInfo.jsp">BandInfo</a></li>
        <li><a href="/jsp/band/board_list.jsp">Board List</a></li>
        <li><a href="/jsp/band/board_write.jsp">Board Write</a></li>
      </ul><br>
    </div>
    
     <div class="col-sm-3 sidenav visible-xs" >
      <h2>BAND</h2><h5>_여행가자</h5>
      <ul class="nav nav-pills nav-stacked">
        <li><a href="/jsp/band/bandInfo.jsp">BandInfo</a></li>
        <li><a href="/jsp/band/board_list.jsp">Board List</a></li>
        <li><a href="/jsp/band/board_write.jsp">Board Write</a></li>
      </ul><br>
    </div>
    <br>
    
    <div class="content hidden-xs">
    <div class="col-sm-10 col-sm-offset-2" style="padding:20px 40px;"><h1>Reply List</h1><hr></div>
    
    <div class="col-sm-10 col-sm-offset-2" style="padding:20px 200px;">
    	<div class="row">
		  <div class="col-sm-9 col-sm-offset-0 reply" onclick="showbtn('replyB1','replyF1')">test1&ensp;&ensp;&ensp;옛다댓글~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</div>
	   	  <div class="hidden" id="replyB1">
	   	  <div class="col-sm-1"><button type="button" onclick="showreply('replyF1')" class="btn btn-primary">댓글</button></div>
	   	  <div class="col-sm-1"><button type="button" class="btn btn-danger">삭제</button></div><!-- 작성자 혹은 manager 권한 -->
	   	  </div>
	    </div>
	    <div class="row hidden"id="replyF1">
	      <br>
		  <form class="form-horizontal">
			  <div class="form-group">
			    <div class="col-sm-10 col-sm-offset-1">
			      <textarea class="form-control" id="replyT1" rows="3"></textarea>
			    </div>
			    <div class="col-sm-1" style="padding-left: 0px;">
			      <button type="submit" class="btn btn-primary btn-default btn-block btn-large"style="height: 70px;font-size: 25px;font-weight: bolder;">Reply</button>
			    </div>
			  </div>
		  </form>
	    </div>
	    <hr>
	    <div class="row">
		  <div class="col-sm-8 col-sm-offset-1 reply" onclick="showbtn('replyB2')">test2&ensp;&ensp;&ensp;옛다댓글~~~~~~~~~~~~~~~</div>
		  <div class="hidden" id="replyB2">
		  <div class="col-sm-1"><button type="button" onclick="showreply('replyF2')" class="btn btn-primary">댓글</button></div>
	   	  <div class="col-sm-1"><button type="button" class="btn btn-danger">삭제</button></div><!-- 작성자 혹은 manager 권한 -->
	   	  </div>
	    </div>
	    <div class="row hidden"id="replyF2">
	      <br>
		  <form class="form-horizontal">
			  <div class="form-group">
			    <div class="col-sm-10 col-sm-offset-1">
			      <textarea class="form-control"  rows="3"></textarea>
			    </div>
			    <div class="col-sm-1" style="padding-left: 0px;">
			      <button type="submit" class="btn btn-primary btn-default btn-block btn-large"style="height: 70px;font-size: 25px;font-weight: bolder;">Reply</button>
			    </div>
			  </div>
		  </form>
	    </div>
	    <hr>
	    <div class="row">
		  <div class="col-sm-8 col-sm-offset-1 reply" onclick="showbtn('replyB3')">test3&ensp;&ensp;&ensp;옛다댓글~~~~~~~~~~~~~~~</div>
		  <div class="hidden" id="replyB3">
		  <div class="col-sm-1"><button type="button" onclick="showreply('replyF3')" class="btn btn-primary">댓글</button></div>
	   	  <div class="col-sm-1"><button type="button" class="btn btn-danger">삭제</button></div><!-- 작성자 혹은 manager 권한 -->
	   	  </div>
	    </div>
	    <div class="row hidden"id="replyF3">
	      <br>
		  <form class="form-horizontal">
			  <div class="form-group">
			    <div class="col-sm-10 col-sm-offset-1">
			      <textarea class="form-control"  rows="3"></textarea>
			    </div>
			    <div class="col-sm-1" style="padding-left: 0px;">
			      <button type="submit" class="btn btn-primary btn-default btn-block btn-large"style="height: 70px;font-size: 25px;font-weight: bolder;">Reply</button>
			    </div>
			  </div>
		  </form>
	    </div>
	    <hr>
	    <div class="row">
		  <div class="col-sm-9 col-sm-offset-0 reply" onclick="showbtn('replyB4')">test4&ensp;&ensp;&ensp;옛다댓글~~~~~~~~~~~~~~~</div>
		  <div class="hidden" id="replyB4">
		  <div class="col-sm-1"><button type="button" onclick="showreply('replyF4')" class="btn btn-primary">댓글</button></div>
	   	  <div class="col-sm-1"><button type="button" class="btn btn-danger">삭제</button></div><!-- 댓글작성자 혹은 admin 권한 -->
	   	  </div>
	    </div>
	    <div class="row hidden" id="replyF4">
	      <br>
		  <form class="form-horizontal">
			  <div class="form-group">
			    <div class="col-sm-10 col-sm-offset-1">
			      <textarea class="form-control"  rows="3"></textarea>
			    </div>
			    <div class="col-sm-1" style="padding-left: 0px;">
			      <button type="submit" class="btn btn-primary btn-default btn-block btn-large"style="height: 70px;font-size: 25px;font-weight: bolder;">Reply</button>
			    </div>
			  </div>
		  </form>
	    </div>
	</div>
	
	<div class="col-sm-10 col-sm-offset-2" style="padding:20px 40px;">
		<div class="row">
		  <form class="form-horizontal">
			  <div class="form-group">
			    <div class="col-sm-7 col-sm-offset-2">
			      <textarea class="form-control"  rows="3"></textarea>
			    </div>
			    <div class="col-sm-1" style="padding-left: 0px;">
			      <button type="submit" class="btn btn-primary btn-default btn-block btn-large"style="height: 70px;font-size: 20px;font-weight: bolder;">Reply</button>
			    </div>
			    <div class="col-sm-1" style="padding-left: 0px;">
			      <button type="button" onclick="history.back()" class="btn btn-default btn-block btn-large"style="height: 70px;font-size: 20px;font-weight: bolder;">Cancel</button>
			    </div>
			  </div>
		  </form>
	    </div>
	</div>
	</div>
	
	
	<!-- ----------------------Mobile--------------------------------------------------------------------------------------------------------------- -->
	
	<div class="content visible-xs">
	<div class="col-sm-10 col-sm-offset-2" style="padding:20px 40px;"><h1>Reply List</h1><hr></div>
    <div  style="padding:10px 15px;">
    	<div class="row">
		  <div class="col-xs-10 col-xs-offset-0 reply" style="padding-right: 2px;" id="reply1" onclick="showbtn('replymB1','replymF1')">test1<br><p>옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아</p></div>
	   	  <div class="hidden" id="replymB1" style="padding-left: 0px;">
	   	  <div class="col-xs-1"><button type="button" onclick="showreply('replymF1')" class="btn btn-primary">R</button></div>
	   	  <div class="col-xs-1"><button type="button" class="btn btn-danger">D</button></div><!-- 작성자 혹은 manager 권한 -->
	   	  </div>
	    </div>
	    <div class="row hidden"id="replymF1">
	      <br>
		  <form class="form-horizontal">
			  <div class="form-group">
			    <div class="col-xs-9 col-xs-offset-0"style="padding-left:40px;padding-right:0px;">
			      <textarea class="form-control"  rows="3"></textarea>
			    </div>
			    <div class="col-xs-2" style="padding-left: 0px;">
			      <button type="submit" class="btn btn-primary btn-default btn-block btn-large"style=" height: 70px;font-size: 25px;font-weight: bolder;">R</button>
			    </div>
			  </div>
		  </form>
	    </div>
	    <hr>
	    <div class="row">
		  <div class="col-xs-9 col-xs-offset-1 reply"style="padding-right: 2px;"  onclick="showbtn('replymB2')">test2<br>옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아옛다댓글아</div>
		  <div class="hidden" id="replymB2">
		  <div class="col-xs-1"><button type="button" onclick="showreply('replymF2')" class="btn btn-primary">댓글</button></div>
	   	  <div class="col-xs-1"><button type="button" class="btn btn-danger">삭제</button></div><!-- 작성자 혹은 manager 권한 -->
	   	  
	   	  </div>
	    </div>
	    <div class="row hidden"id="replymF2">
	      <br>
		  <form class="form-horizontal">
			  <div class="form-group">
			    <div class="col-xs-10 col-xs-offset-1">
			      <textarea class="form-control"  rows="3"></textarea>
			    </div>
			    <div class="col-xs-1" style="padding-left: 0px;">
			      <button type="submit" class="btn btn-primary btn-default btn-block btn-large"style="height: 70px;font-size: 25px;font-weight: bolder;">Reply</button>
			    </div>
			  </div>
		  </form>
	    </div>
	    <hr>
	    <div class="row">
		  <div class="col-xs-9 col-xs-offset-1 reply"style="padding-right: 2px;"  onclick="showbtn('replymB3')">test3<br>옛다댓글~~~~~~~~~~~~~~~</div>
		  <div class="hidden" id="replymB3">
		  <div class="col-xs-1"><button type="button" onclick="showreply('replymF3')" class="btn btn-primary">댓글</button></div>
	   	  <div class="col-xs-1"><button type="button" class="btn btn-danger">삭제</button></div><!-- 작성자 혹은 manager 권한 -->
	   	  </div>
	    </div>
	    <div class="row hidden"id="replymF3">
	      <br>
		  <form class="form-horizontal">
			  <div class="form-group">
			    <div class="col-xs-10 col-xs-offset-1">
			      <textarea class="form-control"  rows="3"></textarea>
			    </div>
			    <div class="col-xs-1" style="padding-left: 0px;">
			      <button type="submit" class="btn btn-primary btn-default btn-block btn-large"style="height: 70px;font-size: 25px;font-weight: bolder;">Reply</button>
			    </div>
			  </div>
		  </form>
	    </div>
	    <hr>
	    <div class="row">
		  <div class="col-xs-10 col-xs-offset-0 reply"style="padding-right: 2px;"  onclick="showbtn('replymB4')">test4<br>옛다댓글~~~~~~~~~~~~~~~</div>
		  <div class="hidden" id="replymB4">
		  <div class="col-xs-1"><button type="button" onclick="showreply('replymF4')" class="btn btn-primary">댓글</button></div>
	   	  <div class="col-xs-1"><button type="button" class="btn btn-danger">삭제</button></div><!-- 댓글작성자 혹은 admin 권한 -->
	   	  </div>
	    </div>
	    <div class="row hidden" id="replymF4">
	      <br>
		  <form class="form-horizontal">
			  <div class="form-group">
			    <div class="col-xs-10 col-xs-offset-1">
			      <textarea class="form-control"  rows="3"></textarea>
			    </div>
			    <div class="col-xs-1" style="padding-left: 0px;">
			      <button type="submit" class="btn btn-primary btn-default btn-block btn-large"style="height: 70px;font-size: 25px;font-weight: bolder;">Reply</button>
			    </div>
			  </div>
		  </form>
	    </div>
	</div>
	
	<div style="padding:20px 40px;">
		<div class="row">
		  <form class="form-horizontal">
			  <div class="form-group">
			    <div>
			      <textarea class="form-control"  rows="5"></textarea>
			    </div>
			    <div >
			      <button type="submit" class="btn btn-primary btn-default btn-block btn-large"style="height: 70px;font-size: 20px;font-weight: bolder;">Reply</button>
			    </div>
			    <div style="padding-left: 0px;">
			      <button type="button" onclick="history.back()"  class="btn btn-default btn-block btn-large"style="height: 70px;font-size: 20px;font-weight: bolder;">Cancel</button>
			    </div>
			    
			  </div>
		  </form>
	    </div>
	</div>
	</div>
  </div>
<br>
</div>
  
  
<!-- 내용 끝 -->

<jsp:include page="/jsp/template/footer.jsp" />
<script>

/* phone....버튼보이기.. 안됨.... */
/* 
$(document).ready(function(){
	var btnI2=0;
    $("#reply1").click(function(){
    	if(btnI2%2==1){
    		alert("야!!");
    		$("#replyB1").className="";
    	}else{
    		$("#replyB1").className="hidden";
    	}
    });
});
 */
</script>

<script type="text/javascript">
var replyI=0;
var btnI=0;
function showreply(f) {
	replyI++;
	if(replyI%2==1){
		document.getElementById(f).className="row";
	}else{
		document.getElementById(f).className="row hidden";
	}
}
function showbtn(b,f) {
	btnI++;
	if(btnI%2==1){
		document.getElementById(b).className="";
	}else{
		document.getElementById(b).className="hidden";
		document.getElementById(f).className="row hidden";
	}
}
</script>
</body>
</html>