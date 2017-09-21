<%@ page contentType="text/html; charset=UTF-8"%><!-- html ver.5 template -->
<%@ include file="/ssi.jsp" %>
<%
String email = request.getParameter("email"); 
%>
<!DOCTYPE html>
<html lang="ko">
<head>

<title>EMAILCheck</title>

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
<body onload="window.focus();" id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">


<!-- 내용 시작 -->
<div class="container-fluid" >
<div class="row">
 <div class="" align="center">
  <h3 class="text-primary">EMAIL Duplication Check</h3>
 </div>
</div>
<hr><br>
<!-- 아이디, 이메일 중복체크와 같은 경우 나중에 ajax,json을 이용하여 변경 Spring... -->

<%
	if(!udao.checkEMail(email)){
%>
<div id="row">
<div class="row">
 <div class="" align="center">
  <h5 class="text-primary">[<%=email %>]는 사용가능한 이메일 입니다.</h5>
 </div>
</div>
<br><br>
<div class="row">
 <div class="" align="center">
  <button type="button" class="btn btn-primary" onclick="other()" id="email_cbtn">EMAIL Change</button>&emsp;<button type="button" class="btn btn-primary" onclick="use()" id="email_cbtn">EMAIL Use</button>
 </div>
</div>
</div>

<div id="frm" class="hidden">
<div class="row">
 <div class="" align="center">
  <h5 class="text-primary">변경할 이메일을 작성해주세요</h5>
 </div>
</div>
<form class="form-horizontal" 
	  method="post" 
	  onsubmit="return checkInfo(this)" 
	  action="./emailcheck.jsp"
	  >

  <div class="form-group" style="padding: 20px 90px">
    <label class="text-primary" style="text-align: right;" for="email">변경EMAIL</label>
    <div class="">
      <input type="text" class="form-control" id="email" name="email" data-toggle="tooltip" data-trigger="hover" data-placement="bottom" data-original-title="Please EMAIL Check">
    </div>
  </div>
  <div style="padding-top: 1px;"  class="form-group" >
    <div class="" align="center">
      <button type="submit" class="btn btn-primary" id="email_cbtn">Check</button>
    </div>
  </div>
</form>
</div>
<%}else{ %>
<div class="row">
 <div class="" align="center">
  <h5 class="text-primary">[<%=email %>]는 이미 사용중인 이메일 입니다.</h5>
 </div>
</div>

<form class="form-horizontal" 
	  method="post" 
	  onsubmit="return checkInfo(this)" 
	  action="./emailcheck.jsp">

  <div class="form-group" style="padding: 20px 70px">
    <label class="col-xs-2 text-primary" style="text-align: right;" for="id">EMAIL</label>
    <div class="col-xs-10">
      <input type="text" class="form-control" id="email" name="email" data-toggle="tooltip" data-trigger="hover" data-placement="bottom" data-original-title="Please EMAIL Check">
    </div>
  </div>
  <div class="form-group" >
    <div class="" align="center">
      <button type="submit" class="btn btn-primary" id="email_cbtn">Check</button>
    </div>
  </div>
</form>
<%} %>

</div>

<!-- 내용 끝 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script><!-- bootstrap의 스크립트는 jQuery를 이용하므로 -->
<script src="/js/bootstrap.min.js"></script><!-- bootstrap.js연결 -->

<script type="text/javascript">
function use(){ //아이디중복확인 사용을 눌렀을시 그대로 입력받을수있게할수있는 함수
	opener.frm_modiemail.email.value = '<%=email%>';
	opener.frm_modiemail.chEMAIL.value = 'y';

	window.close(); //아이디를 보낸후 닫는다

}
function checkInfo(f) {
	if(f.email.value==""){
		alert("이메일을 입력하여주세요");
		f.email.focus();
		return false;
	}
}
function other() {
	document.getElementById("frm").className="";
	document.getElementById("row").className="row hidden";
}
</script>

</body>
</html>